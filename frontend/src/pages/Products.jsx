import { useState } from 'react';
import { Link } from 'react-router-dom';
import Skeleton from 'react-loading-skeleton';
import {
  useGetProductsQuery,
  useCreateProductMutation,
  useUpdateProductMutation,
  useDeleteProductMutation,
} from '../store/api';

function ProductCardSkeleton() {
  return (
    <div className="item-card">
      <Skeleton width={28} height={16} style={{ marginBottom: 8 }} />
      <Skeleton width={160} height={18} style={{ marginBottom: 6 }} />
      <Skeleton count={2} height={12} style={{ marginBottom: 4 }} />
      <div style={{ display: 'flex', gap: 8, marginTop: 8 }}>
        <Skeleton width={90} height={28} borderRadius={6} />
        <Skeleton width={60} height={28} borderRadius={6} />
      </div>
    </div>
  );
}

const emptyForm = { name: '', description: '', sku: '' };

export default function Products() {
  const { data: products = [], isLoading } = useGetProductsQuery();
  const [createProduct] = useCreateProductMutation();
  const [updateProduct] = useUpdateProductMutation();
  const [deleteProduct] = useDeleteProductMutation();

  const [showCreate, setShowCreate] = useState(false);
  const [editTarget, setEditTarget] = useState(null); // product being edited
  const [form, setForm] = useState(emptyForm);

  const openCreate = () => { setForm(emptyForm); setShowCreate(true); };
  const openEdit = (p) => { setEditTarget(p); setForm({ name: p.name, description: p.description || '', sku: p.sku || '' }); };
  const closeAll = () => { setShowCreate(false); setEditTarget(null); };

  const handleCreate = async (e) => {
    e.preventDefault();
    await createProduct(form);
    closeAll();
  };

  const handleEdit = async (e) => {
    e.preventDefault();
    await updateProduct({ id: editTarget._id, ...form });
    closeAll();
  };

  const handleDelete = async (id) => {
    if (!confirm('Delete this product and all its parts?')) return;
    await deleteProduct(id);
  };

  return (
    <>
      <div className="page-header">
        <div>
          <h1>Products</h1>
          <p className="page-subtitle">
            {isLoading ? <Skeleton width={140} height={14} /> : `${products.length} product${products.length !== 1 ? 's' : ''} in your workspace`}
          </p>
        </div>
        <button className="btn-primary" onClick={openCreate}>+ New Product</button>
      </div>

      <div className="grid">
        {isLoading
          ? [1, 2, 3].map(i => <ProductCardSkeleton key={i} />)
          : products.map((p, i) => (
            <div key={p._id} className="item-card">
              <div className="item-card-number">{String(i + 1).padStart(2, '0')}</div>
              <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 8 }}>
                <div>
                  <div className="item-card-meta">Product</div>
                  <div className="item-card-title">{p.name}</div>
                </div>
                {/* Pencil edit button */}
                <button
                  className="btn-ghost btn-sm"
                  title="Edit product"
                  onClick={() => openEdit(p)}
                  style={{ flexShrink: 0, fontSize: 14 }}
                >✏️</button>
              </div>
              {p.sku && <span className="badge badge-gold">SKU: {p.sku}</span>}
              {p.description && (
                <p style={{ fontSize: 13, color: 'var(--text-muted)', lineHeight: 1.5 }}>{p.description}</p>
              )}
              <div style={{ display: 'flex', gap: 8, marginTop: 4 }}>
                <Link to={`/products/${p._id}`}>
                  <button className="btn-primary btn-sm">View Parts →</button>
                </Link>
                <button className="btn-danger btn-sm" onClick={() => handleDelete(p._id)}>Delete</button>
              </div>
            </div>
          ))}
        {!isLoading && products.length === 0 && (
          <div className="empty-state" style={{ gridColumn: '1/-1' }}>
            <div className="empty-state-icon">📦</div>
            <p>No products yet. Create your first one to get started.</p>
          </div>
        )}
      </div>

      {/* Create modal */}
      {showCreate && (
        <ProductFormModal
          title="New Product"
          form={form}
          setForm={setForm}
          onSubmit={handleCreate}
          onClose={closeAll}
          submitLabel="Create Product"
        />
      )}

      {/* Edit modal */}
      {editTarget && (
        <ProductFormModal
          title="Edit Product"
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

function ProductFormModal({ title, form, setForm, onSubmit, onClose, submitLabel }) {
  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal" onClick={e => e.stopPropagation()}>
        <h2>{title}</h2>
        <form onSubmit={onSubmit}>
          <div className="form-group">
            <label>Product Name</label>
            <input placeholder="e.g. Phone Stand" value={form.name} onChange={e => setForm({ ...form, name: e.target.value })} required />
          </div>
          <div className="form-group">
            <label>SKU</label>
            <input placeholder="e.g. PS-001" value={form.sku} onChange={e => setForm({ ...form, sku: e.target.value })} />
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
