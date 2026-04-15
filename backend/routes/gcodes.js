const router = require('express').Router();
const multer = require('multer');
const path = require('path');
const AdmZip = require('adm-zip');
const GCodeVersion = require('../models/GCodeVersion');
const { protect } = require('../middleware/auth');
const { getBucket } = require('../config/db');

// ── GridFS helpers ──────────────────────────────────────────────────────────

// Upload a Buffer to GridFS; resolves with the new file's ObjectId
function uploadToGridFS(buffer, filename, contentType) {
  return new Promise((resolve, reject) => {
    const stream = getBucket().openUploadStream(filename, { contentType });
    stream.on('error', reject);
    stream.on('finish', () => resolve(stream.id));
    stream.end(buffer);
  });
}

// Delete a GridFS file by ObjectId — silently skips if already gone
async function deleteFromGridFS(id) {
  if (!id) return;
  try {
    const { ObjectId } = require('mongoose').mongo;
    await getBucket().delete(new ObjectId(id));
  } catch (e) {
    console.warn('GridFS delete skipped:', e.message);
  }
}

// Extract gcode and mesh Buffers from a .3mf ZIP archive (in-memory, no disk)
function extractFrom3mf(buffer) {
  const result = { gcodeBuffer: null, meshBuffer: null };
  try {
    const zip = new AdmZip(buffer);
    const entries = zip.getEntries();

    const gcodeEntry =
      entries.find(e => e.entryName.match(/Metadata\/plate_\d+\.gcode$/i)) ||
      entries.find(e => e.entryName.match(/\.gcode$/i));
    if (gcodeEntry) result.gcodeBuffer = gcodeEntry.getData();

    const meshEntry =
      entries.find(e => e.entryName.match(/3D\/3dmodel\.model$/i)) ||
      entries.find(e => e.entryName.match(/\.model$/i));
    if (meshEntry) result.meshBuffer = meshEntry.getData();
  } catch (e) {
    console.error('3mf extraction failed:', e.message);
  }
  return result;
}

// ── Multer (memory storage — no local disk writes) ──────────────────────────

const upload = multer({
  storage: multer.memoryStorage(),
  fileFilter: (req, file, cb) => {
    const allowed = ['.gcode', '.gc', '.mf', '.3mf', '.nc', '.tap', '.txt'];
    const ext = path.extname(file.originalname).toLowerCase();
    allowed.includes(ext) ? cb(null, true) : cb(new Error('File type not allowed'));
  }
});

router.use(protect);

// ── GET /part/:partId — list all versions for a part ───────────────────────

router.get('/part/:partId', async (req, res) => {
  try {
    const versions = await GCodeVersion.find({ part: req.params.partId })
      .populate('uploadedBy', 'name')
      .sort({ versionNumber: -1 });
    res.json(versions);
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

// ── POST /part/:partId — upload new version ────────────────────────────────

router.post('/part/:partId', upload.single('file'), async (req, res) => {
  try {
    const { notes } = req.body;
    const partId = req.params.partId;
    const ts = Date.now();
    const ext = path.extname(req.file.originalname).toLowerCase().replace('.', '');
    const storedFilename = `${ts}-${req.file.originalname}`;

    // Mark previous versions as not latest
    await GCodeVersion.updateMany({ part: partId }, { isLatest: false });

    // Get next version number
    const count = await GCodeVersion.countDocuments({ part: partId });
    const versionNumber = count + 1;
    const version = `v${versionNumber}.0`;

    // Upload original file to GridFS
    const fileId = await uploadToGridFS(req.file.buffer, storedFilename, req.file.mimetype);

    // For .3mf files: extract gcode + mesh from the ZIP buffer and store each in GridFS
    let gcodePreviewId = fileId; // default: preview the original file
    let meshId = null;

    if (ext === '3mf') {
      const { gcodeBuffer, meshBuffer } = extractFrom3mf(req.file.buffer);
      if (gcodeBuffer) {
        gcodePreviewId = await uploadToGridFS(gcodeBuffer, `extracted_${ts}.gcode`, 'text/plain');
      }
      if (meshBuffer) {
        meshId = await uploadToGridFS(meshBuffer, `mesh_${ts}.model`, 'application/xml');
      }
    }

    const gcode = await GCodeVersion.create({
      part: partId,
      version,
      versionNumber,
      filename: storedFilename,
      originalName: req.file.originalname,
      fileType: ext,
      fileId,
      gcodePreviewId,
      meshId,
      fileSize: req.file.size,
      notes,
      isLatest: true,
      uploadedBy: req.user._id
    });

    res.status(201).json(gcode);
  } catch (e) {
    res.status(400).json({ message: e.message });
  }
});

// ── GET /:id/content — stream raw gcode text for the renderer ──────────────

router.get('/:id/content', async (req, res) => {
  try {
    const gcode = await GCodeVersion.findById(req.params.id);
    if (!gcode) return res.status(404).json({ message: 'Not found' });

    const fileId = gcode.gcodePreviewId || gcode.fileId;
    if (!fileId) return res.status(404).json({ message: 'File not stored in database' });

    res.setHeader('Content-Type', 'text/plain');
    const stream = getBucket().openDownloadStream(fileId);
    stream.on('error', () => {
      if (!res.headersSent) res.status(404).json({ message: 'File not found in storage' });
    });
    stream.pipe(res);
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

// ── GET /:id/mesh — stream extracted 3MF mesh XML ─────────────────────────

router.get('/:id/mesh', async (req, res) => {
  try {
    const gcode = await GCodeVersion.findById(req.params.id);
    if (!gcode || !gcode.meshId) return res.status(404).json({ message: 'No mesh available' });

    res.setHeader('Content-Type', 'application/xml');
    const stream = getBucket().openDownloadStream(gcode.meshId);
    stream.on('error', () => {
      if (!res.headersSent) res.status(404).json({ message: 'Mesh file not found in storage' });
    });
    stream.pipe(res);
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

// ── GET /:id/download — download the original uploaded file ───────────────

router.get('/:id/download', async (req, res) => {
  try {
    const gcode = await GCodeVersion.findById(req.params.id);
    if (!gcode) return res.status(404).json({ message: 'Not found' });
    if (!gcode.fileId) return res.status(404).json({ message: 'File not stored in database' });

    res.setHeader('Content-Disposition', `attachment; filename="${gcode.originalName}"`);
    const stream = getBucket().openDownloadStream(gcode.fileId);
    stream.on('error', () => {
      if (!res.headersSent) res.status(404).json({ message: 'File not found in storage' });
    });
    stream.pipe(res);
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

// ── DELETE /:id — remove version record + all GridFS files ────────────────

router.delete('/:id', async (req, res) => {
  try {
    const gcode = await GCodeVersion.findById(req.params.id);
    if (!gcode) return res.status(404).json({ message: 'Not found' });

    // Delete original file from GridFS
    await deleteFromGridFS(gcode.fileId);

    // Delete extracted gcode only if it's a separate GridFS entry (not same as fileId)
    if (gcode.gcodePreviewId && String(gcode.gcodePreviewId) !== String(gcode.fileId)) {
      await deleteFromGridFS(gcode.gcodePreviewId);
    }

    // Delete mesh if present
    await deleteFromGridFS(gcode.meshId);

    await gcode.deleteOne();
    res.json({ message: 'Deleted' });
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

module.exports = router;
