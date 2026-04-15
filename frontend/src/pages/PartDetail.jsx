import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import axios from 'axios';
import GCodeRenderer from '../components/GCodeRenderer';

export default function PartDetail() {
  const { partId } = useParams();
  const [part, setPart] = useState(null);
  const [versions, setVersions] = useState([]);
  const [showUpload, setShowUpload] = useState(false);
  const [file, setFile] = useState(null);
  const [notes, setNotes] = useState('');
  const [uploading, setUploading] = useState(false);
  const [selected, setSelected] = useState(null);
  const [gcodeContent, setGcodeContent] = useState('');
  const [loadingContent, setLoadingContent] = useState(false);

  useEffect(() => {
    axios.get(`/api/parts/${partId}`).then(r => setPart(r.data));
    loadVersions();
  }, [partId]);

  const loadVersions = () =>
    axios.get(`/api/gcodes/part/${partId}`).then(r => {
      setVersions(r.data);
      if (r.data.length > 0) selectVersion(r.data[0]);
    });

  const selectVersion = async (v) => {
    setSelected(v);
    setLoadingContent(true);
    setGcodeContent('');
    try {
      const res = await axios.get(`/api/gcodes/${v._id}/content`, { responseType: 'text' });
      setGcodeContent(res.data);
    } catch { setGcodeContent(''); }
    setLoadingContent(false);
  };

  const upload = async (e) => {
    e.preventDefault();
    if (!file) return;
    setUploading(true);
    const fd = new FormData();
    fd.append('file', file);
    fd.append('notes', notes);
    try {
      await axios.post(`/api/gcodes/part/${partId}`, fd);
      setFile(null); setNotes(''); setShowUpload(false);
      loadVersions();
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

  const remove = async (id) => {
    if (!confirm('Delete this version?')) return;
    await axios.delete(`/api/gcodes/${id}`);
    if (selected?._id === id) { setSelected(null); setGcodeContent(''); }
    loadVersions();
  };

  const fmt = (bytes) => {
    if (!bytes) return '—';
    return bytes < 1024 * 1024 ? `${(bytes / 1024).toFixed(1)} KB` : `${(bytes / 1024 / 1024).toFixed(1)} MB`;
  };
  const fmtDate = (d) => new Date(d).toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });

  if (!part) return <p style={{ color: 'var(--text-muted-dark)' }}>Loading...</p>;

  return (
    <>
      <div className="breadcrumb">
        <Link to="/products">Products</Link>
        <span className="breadcrumb-sep">›</span>
        <Link to={`/products/${part.product?._id}`}>{part.product?.name || 'Product'}</Link>
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
          {versions.length === 0 && (
            <div style={{ padding: '24px 18px', color: 'var(--text-muted)', fontSize: 13, textAlign: 'center' }}>
              No versions yet
            </div>
          )}
          {versions.map(v => (
            <div
              key={v._id}
              className={`version-row${selected?._id === v._id ? ' active' : ''}`}
              onClick={() => selectVersion(v)}
            >
              <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                <span style={{ fontWeight: 700, fontSize: 14, color: 'var(--text)' }}>{v.version}</span>
                {v.isLatest && <span className="badge badge-green">Latest</span>}
                <div style={{ marginLeft: 'auto', display: 'flex', gap: 4 }}>
                  <button
                    className="btn-ghost btn-sm"
                    onClick={e => { e.stopPropagation(); download(v); }}
                    title="Download"
                  >↓</button>
                  <button
                    className="btn-danger btn-sm"
                    onClick={e => { e.stopPropagation(); remove(v._id); }}
                    title="Delete"
                  >✕</button>
                </div>
              </div>
              <div style={{ fontSize: 12, color: 'var(--text-muted)' }}>
                {v.originalName}
              </div>
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
                <button
                  className="btn-ghost btn-sm"
                  onClick={() => download(selected)}
                >
                  ↓ Download
                </button>
              </div>

              {loadingContent ? (
                <div style={{
                  height: 520, background: '#111318', borderRadius: 8,
                  display: 'flex', alignItems: 'center', justifyContent: 'center',
                  color: 'var(--text-muted)', fontSize: 14
                }}>
                  Loading preview...
                </div>
              ) : (
                <GCodeRenderer content={gcodeContent} />
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
    </>
  );
}
