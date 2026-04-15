const mongoose = require('mongoose');

const gcodeVersionSchema = new mongoose.Schema({
  part: { type: mongoose.Schema.Types.ObjectId, ref: 'Part', required: true },
  version: { type: String, required: true },   // e.g. "v1.0", "v1.1"
  versionNumber: { type: Number, required: true },
  filename: { type: String, required: true },
  originalName: { type: String, required: true },
  fileType: { type: String },                  // gcode, 3mf, etc.
  fileId: { type: mongoose.Schema.Types.ObjectId },        // GridFS ID of original uploaded file
  gcodePreviewId: { type: mongoose.Schema.Types.ObjectId }, // GridFS ID of extracted .gcode (for .3mf files)
  meshId: { type: mongoose.Schema.Types.ObjectId },         // GridFS ID of extracted .model mesh
  fileSize: { type: Number },
  notes: { type: String },                     // changelog / notes for this version
  isLatest: { type: Boolean, default: true },
  uploadedBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
}, { timestamps: true });

module.exports = mongoose.model('GCodeVersion', gcodeVersionSchema);
