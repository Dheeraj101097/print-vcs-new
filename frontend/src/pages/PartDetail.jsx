import { useState, useEffect, lazy, Suspense } from 'react';
import { useParams, Link } from 'react-router-dom';
import axios from 'axios';
import Skeleton from 'react-loading-skeleton';
import { useDispatch } from 'react-redux';
import {
  useGetProductQuery,
  useGetPartQuery,
  useGetVersionsQuery,
  useUpdateVersionNotesMutation,
  useDeleteVersionMutation,
  api,
} from '../store/api';

const GCodeRenderer = lazy(() => import('../components/GCodeRenderer'));

function VersionRowSkeleton() {
  return (
    <div className="version-row" style={{ pointerEvents: 'none' }}>
      <div style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
        <Skeleton width={40} height={14} />
        <Skeleton width={44} height={18} borderRadius={10} />
      </div>
      <Skeleton width={160} height={12} style={{ marginTop: 4 }} />
      <Skeleton width={200} height={10} style={{ marginTop: 4 }} />
    </div>
  );
}

export default function PartDetail() {
  // productId comes from the URL — no extra API call needed for breadcrumb
  const { productId, partId } = useParams();

  const { data: product } = useGetProductQuery(productId);
  const { data: part, isLoading: loadingPart } = useGetPartQuery(partId);
  const { data: versions = [], isLoading: loadingVersions } = useGetVersionsQuery(partId);

  const dispatch = useDispatch();
  const [updateVersionNotes] = useUpdateVersionNotesMutation();
  const [deleteVersion] = useDeleteVersionMutation();

  // Upload state
  const [showUpload, setShowUpload] = useState(false);
  const [file, setFile] = useState(null);
  const [notes, setNotes] = useState('');
  const [piecesPerBed, setPiecesPerBed] = useState('');
  const [uploading, setUploading] = useState(false);

  // Viewer state
  const [selectedId, setSelectedId] = useState(null);
  const [gcodeContent, setGcodeContent] = useState('');
  const [loadingContent, setLoadingContent] = useState(false);

  // Edit notes state
  const [editNotes, setEditNotes] = useState(null); // { id, notes, partId }

  // Auto-select the latest version when versions first load
  useEffect(() => {
    if (versions.length > 0 && selectedId === null) {
      selectVersion(versions[0]);
    }
  }, [versions]);

  const selectVersion = async (v) => {
    setSelectedId(v._id);
    setLoadingContent(true);
    setGcodeContent('');
    try {
      const res = await axios.get(`/api/gcodes/${v._id}/content`, { responseType: 'text' });
      setGcodeContent(res.data);
    } catch {
      setGcodeContent('');
    }
    setLoadingContent(false);
  };

  const selected = versions.find(v => v._id === selectedId) ?? null;

  const upload = async (e) => {
    e.preventDefault();
    if (!file) return;
    setUploading(true);
    const fd = new FormData();
    fd.append('file', file);
    fd.append('notes', notes);
    if (piecesPerBed) fd.append('piecesPerBed', piecesPerBed);
    try {
      await axios.post(`/api/gcodes/part/${partId}`, fd);
      setFile(null); setNotes(''); setPiecesPerBed(''); setShowUpload(false);
      setSelectedId(null);
      setGcodeContent('');
      // Upload goes through axios (multipart), so manually invalidate the RTK cache
      dispatch(api.util.invalidateTags([{ type: 'Version', id: partId }]));
    } catch (err) {
      alert(err.response?.data?.message || 'Upload failed');
    }
    setUploading(false);
  };

  const download = async (v) => {
    try {
      const token = localStorage.getItem('cad_token');
      const res = await fetch(`/api/gcodes/${v._id}/download`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      const blob = await res.blob();
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url; a.download = v.originalName; a.click();
      URL.revokeObjectURL(url);
    } catch { alert('Download failed'); }
  };

  const handleDelete = async (v) => {
    if (!confirm('Delete this version?')) return;
    await deleteVersion({ id: v._id, partId });
    if (selectedId === v._id) { setSelectedId(null); setGcodeContent(''); }
  };

  const handleSaveNotes = async (e) => {
    e.preventDefault();
    await updateVersionNotes({ id: editNotes.id, notes: editNotes.notes, partId });
    setEditNotes(null);
  };

  const fmt = (bytes) => {
    if (!bytes) return '—';
    return bytes < 1024 * 1024 ? `${(bytes / 1024).toFixed(1)} KB` : `${(bytes / 1024 / 1024).toFixed(1)} MB`;
  };
  const fmtDate = (d) => new Date(d).toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });

  if (loadingPart) {
    return (
      <>
        <div className="breadcrumb">
          <Link to="/products">Products</Link>
          <span className="breadcrumb-sep">›</span>
          <Skeleton width={80} height={14} inline />
          <span className="breadcrumb-sep">›</span>
          <Skeleton width={80} height={14} inline />
        </div>
        <div className="page-header">
          <Skeleton width={200} height={28} />
        </div>
        <div style={{ display: 'grid', gridTemplateColumns: '300px 1fr', gap: 20 }}>
          <div className="version-list">
            <div className="version-list-header"><Skeleton width={160} height={14} /></div>
            {[1, 2, 3].map(i => <VersionRowSkeleton key={i} />)}
          </div>
          <Skeleton height={520} borderRadius={8} />
        </div>
      </>
    );
  }

  // product may still be loading (cache hit is fast); fall back to part.product for breadcrumb
  const productName = product?.name || part?.product?.name || 'Product';

  return (
    <>
      <div className="breadcrumb">
        <Link to="/products">Products</Link>
        <span className="breadcrumb-sep">›</span>
        <Link to={`/products/${productId}`}>{productName}</Link>
        <span className="breadcrumb-sep">›</span>
        <span style={{ color: 'var(--text-on-dark)' }}>{part.name}</span>
      </div>

      <div className="page-header">
        <div>
          <h1>{part.name}</h1>
          {part.description && <p className="page-subtitle">{part.description}</p>}
        </div>
        <button className="btn-primary" onClick={() => setShowUpload(true)}>↑ Upload New Version</button>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: '300px 1fr', gap: 20, alignItems: 'start' }}>
        {/* Version list */}
        <div className="version-list">
          <div className="version-list-header">Version History ({versions.length})</div>
          {loadingVersions && [1, 2, 3].map(i => <VersionRowSkeleton key={i} />)}
          {!loadingVersions && versions.length === 0 && (
            <div style={{ padding: '24px 18px', color: 'var(--text-muted)', fontSize: 13, textAlign: 'center' }}>
              No versions yet
            </div>
          )}
          {versions.map(v => (
            <div
              key={v._id}
              className={`version-row${selectedId === v._id ? ' active' : ''}`}
              onClick={() => selectVersion(v)}
            >
              <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
                <span style={{ fontWeight: 700, fontSize: 14, color: 'var(--text)' }}>{v.version}</span>
                {v.isLatest && <span className="badge badge-green">Latest</span>}
                <div style={{ marginLeft: 'auto', display: 'flex', gap: 4 }}>
                  {/* Edit notes */}
                  <button
                    className="btn-ghost btn-sm"
                    title="Edit notes"
                    onClick={e => { e.stopPropagation(); setEditNotes({ id: v._id, notes: v.notes || '', partId }); }}
                  >✏️</button>
                  <button
                    className="btn-ghost btn-sm"
                    onClick={e => { e.stopPropagation(); download(v); }}
                    title="Download"
                  >↓</button>
                  <button
                    className="btn-danger btn-sm"
                    onClick={e => { e.stopPropagation(); handleDelete(v); }}
                    title="Delete"
                  >✕</button>
                </div>
              </div>
              <div style={{ fontSize: 12, color: 'var(--text-muted)' }}>{v.originalName}</div>
              <div style={{ fontSize: 11, color: 'var(--text-light)', display: 'flex', gap: 10 }}>
                <span>{fmtDate(v.createdAt)}</span>
                <span>{fmt(v.fileSize)}</span>
                <span>by {v.uploadedBy?.name || '—'}</span>
              </div>
              {v.notes && (
                <div style={{
                  fontSize: 12, color: 'var(--text-muted)', fontStyle: 'italic',
                  background: 'var(--surface2)', borderRadius: 6, padding: '5px 8px', marginTop: 2
                }}>
                  "{v.notes}"
                </div>
              )}
            </div>
          ))}
        </div>

        {/* Viewer */}
        <div>
          {selected ? (
            <div className="card" style={{ background: 'var(--surface)' }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 16 }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                  <span style={{ fontWeight: 700, color: 'var(--text)', fontSize: 15 }}>{selected.originalName}</span>
                  <span className="badge badge-gold">{selected.version}</span>
                </div>
                <button className="btn-ghost btn-sm" onClick={() => download(selected)}>↓ Download</button>
              </div>

              {loadingContent ? (
                <Skeleton height={520} borderRadius={8} baseColor="#111318" highlightColor="#1a1d24" />
              ) : (
                <Suspense fallback={<Skeleton height={520} borderRadius={8} baseColor="#111318" highlightColor="#1a1d24" />}>
                  <GCodeRenderer content={gcodeContent} />
                </Suspense>
              )}

              {selected.notes && (
                <div style={{
                  marginTop: 14, padding: '10px 14px',
                  background: 'var(--surface2)', borderRadius: 8,
                  fontSize: 13, color: 'var(--text-muted)',
                  borderLeft: '3px solid var(--gold)'
                }}>
                  <span style={{ fontWeight: 600, color: 'var(--gold)', fontSize: 11, textTransform: 'uppercase', letterSpacing: '0.06em' }}>
                    Version Notes
                  </span>
                  <p style={{ marginTop: 4 }}>{selected.notes}</p>
                </div>
              )}
            </div>
          ) : (
            <div className="card" style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', minHeight: 300 }}>
              <div className="empty-state">
                <div className="empty-state-icon">🖥</div>
                <p>Select a version to preview</p>
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Upload modal */}
      {showUpload && (
        <div className="modal-overlay" onClick={() => setShowUpload(false)}>
          <div className="modal" onClick={e => e.stopPropagation()}>
            <h2>Upload New Version</h2>
            <form onSubmit={upload}>
              <div className="form-group">
                <label>File (.gcode, .3mf, .nc, .mf)</label>
                <input
                  type="file"
                  accept=".gcode,.gc,.mf,.3mf,.nc,.tap,.txt"
                  onChange={e => setFile(e.target.files[0])}
                  required
                  style={{ padding: '8px 0', background: 'transparent', border: 'none', boxShadow: 'none' }}
                />
              </div>
              <div className="form-group">
                <label>Pieces per Bed</label>
                <input
                  type="number"
                  min="1"
                  placeholder="e.g. 4"
                  value={piecesPerBed}
                  onChange={e => setPiecesPerBed(e.target.value)}
                />
              </div>
              <div className="form-group">
                <label>Version Notes</label>
                <textarea
                  rows={3}
                  value={notes}
                  onChange={e => setNotes(e.target.value)}
                  placeholder="What changed in this version?"
                />
              </div>
              <div style={{ display: 'flex', gap: 8, justifyContent: 'flex-end', marginTop: 4 }}>
                <button type="button" className="btn-ghost" onClick={() => setShowUpload(false)}>Cancel</button>
                <button type="submit" className="btn-primary" disabled={uploading}>
                  {uploading ? 'Uploading...' : 'Upload Version'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Edit notes modal */}
      {editNotes && (
        <div className="modal-overlay" onClick={() => setEditNotes(null)}>
          <div className="modal" onClick={e => e.stopPropagation()}>
            <h2>Edit Version Notes</h2>
            <form onSubmit={handleSaveNotes}>
              <div className="form-group">
                <label>Notes</label>
                <textarea
                  rows={4}
                  value={editNotes.notes}
                  onChange={e => setEditNotes({ ...editNotes, notes: e.target.value })}
                  placeholder="Describe what changed in this version..."
                />
              </div>
              <div style={{ display: 'flex', gap: 8, justifyContent: 'flex-end', marginTop: 4 }}>
                <button type="button" className="btn-ghost" onClick={() => setEditNotes(null)}>Cancel</button>
                <button type="submit" className="btn-primary">Save Notes</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </>
  );
}
