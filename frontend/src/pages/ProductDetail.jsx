import { useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import Skeleton from 'react-loading-skeleton';
import {
  useGetProductQuery,
  useGetPartsQuery,
  useCreatePartMutation,
  useUpdatePartMutation,
  useDeletePartMutation,
} from '../store/api';

function PartCardSkeleton() {
  return (
    <div className="item-card">
      <Skeleton width={28} height={16} style={{ marginBottom: 8 }} />
      <Skeleton width={140} height={18} style={{ marginBottom: 6 }} />
      <Skeleton count={2} height={12} style={{ marginBottom: 4 }} />
      <div style={{ display: 'flex', gap: 8, marginTop: 8 }}>
        <Skeleton width={120} height={28} borderRadius={6} />
        <Skeleton width={60} height={28} borderRadius={6} />
      </div>
    </div>
  );
}

const emptyForm = { name: '', description: '' };

export default function ProductDetail() {
  const { productId } = useParams();

  const { data: product, isLoading: loadingProduct } = useGetProductQuery(productId);
  const { data: parts = [], isLoading: loadingParts } = useGetPartsQuery(productId);

  const [createPart] = useCreatePartMutation();
  const [updatePart] = useUpdatePartMutation();
  const [deletePart] = useDeletePartMutation();

  const [showCreate, setShowCreate] = useState(false);
  const [editTarget, setEditTarget] = useState(null);
  const [form, setForm] = useState(emptyForm);

  const openCreate = () => { setForm(emptyForm); setShowCreate(true); };
  const openEdit = (p) => { setEditTarget(p); setForm({ name: p.name, description: p.description || '' }); };
  const closeAll = () => { setShowCreate(false); setEditTarget(null); };

  const handleCreate = async (e) => {
    e.preventDefault();
    await createPart({ ...form, product: productId });
    closeAll();
  };

  const handleEdit = async (e) => {
    e.preventDefault();
    await updatePart({ id: editTarget._id, productId, name: form.name, description: form.description });
    closeAll();
  };

  const handleDelete = async (id) => {
    if (!confirm('Delete this part?')) return;
    await deletePart({ id, productId });
  };

  if (loadingProduct) {
    return (
      <>
        <div className="breadcrumb">
          <Link to="/products">Products</Link>
          <span className="breadcrumb-sep">›</span>
          <Skeleton width={100} height={14} inline />
        </div>
        <div className="page-header">
          <div><Skeleton width={200} height={28} /><Skeleton width={120} height={14} style={{ marginTop: 6 }} /></div>
        </div>
        <div className="grid">{[1, 2, 3].map(i => <PartCardSkeleton key={i} />)}</div>
      </>
    );
  }

  return (
    <>
      <div className="breadcrumb">
        <Link to="/products">Products</Link>
        <span className="breadcrumb-sep">›</span>
        <span style={{ color: 'var(--text-on-dark)' }}>{product.name}</span>
      </div>

      <div className="page-header">
        <div>
          <h1>{product.name}</h1>
          <p className="page-subtitle">
            {product.sku && <span className="badge badge-gold" style={{ marginRight: 8 }}>SKU: {product.sku}</span>}
            {loadingParts ? <Skeleton width={60} height={14} inline /> : `${parts.length} part${parts.length !== 1 ? 's' : ''}`}
          </p>
        </div>
        <button className="btn-primary" onClick={openCreate}>+ Add Part</button>
      </div>

      {product.description && (
        <p style={{ color: 'var(--text-muted-dark)', marginBottom: 24, fontSize: 14 }}>{product.description}</p>
      )}

      <div className="grid">
        {loadingParts
          ? [1, 2, 3].map(i => <PartCardSkeleton key={i} />)
          : parts.map((p, i) => (
            <div key={p._id} className="item-card">
              <div className="item-card-number">{String(i + 1).padStart(2, '0')}</div>
              <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 8 }}>
                <div>
                  <div className="item-card-meta">Part</div>
                  <div className="item-card-title">{p.name}</div>
                </div>
                <button
                  className="btn-ghost btn-sm"
                  title="Edit part"
                  onClick={() => openEdit(p)}
                  style={{ flexShrink: 0, fontSize: 14 }}
                >✏️</button>
              </div>
              {p.description && (
                <p style={{ fontSize: 13, color: 'var(--text-muted)', lineHeight: 1.5 }}>{p.description}</p>
              )}
              <div style={{ display: 'flex', gap: 8, marginTop: 4 }}>
                {/* productId is now part of the URL — no extra fetch needed in PartDetail */}
                <Link to={`/products/${productId}/parts/${p._id}`}>
                  <button className="btn-primary btn-sm">G-Code Versions →</button>
                </Link>
                <button className="btn-danger btn-sm" onClick={() => handleDelete(p._id)}>Delete</button>
              </div>
            </div>
          ))}
        {!loadingParts && parts.length === 0 && (
          <div className="empty-state" style={{ gridColumn: '1/-1' }}>
            <div className="empty-state-icon">🔩</div>
            <p>No parts yet. Add the first part for this product.</p>
          </div>
        )}
      </div>

      {showCreate && (
        <PartFormModal
          title="New Part"
          form={form}
          setForm={setForm}
          onSubmit={handleCreate}
          onClose={closeAll}
          submitLabel="Create Part"
        />
      )}

      {editTarget && (
        <PartFormModal
          title="Edit Part"
          form={form}
          setForm={setForm}
          onSubmit={handleEdit}
          onClose={closeAll}
          submitLabel="Save Changes"
        />
      )}
    </>
  );
}

function PartFormModal({ title, form, setForm, onSubmit, onClose, submitLabel }) {
  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={e => e.stopPropagation()}>
        <h2>{title}</h2>
        <form onSubmit={onSubmit}>
          <div className="form-group">
            <label>Part Name</label>
            <input placeholder="e.g. Base Plate" value={form.name} onChange={e => setForm({ ...form, name: e.target.value })} required />
          </div>
          <div className="form-group">
            <label>Description</label>
            <textarea rows={3} placeholder="Optional description..." value={form.description} onChange={e => setForm({ ...form, description: e.target.value })} />
          </div>
          <div style={{ display: 'flex', gap: 8, justifyContent: 'flex-end', marginTop: 4 }}>
            <button type="button" className="btn-ghost" onClick={onClose}>Cancel</button>
            <button type="submit" className="btn-primary">{submitLabel}</button>
          </div>
        </form>
      </div>
    </div>
  );
}
