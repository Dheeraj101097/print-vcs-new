const mongoose = require('mongoose');

const productSchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: { type: String },
  sku: { type: String },
  createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
}, { timestamps: true });

// sparse: true allows multiple docs with null/missing SKU while still
// enforcing uniqueness for non-null values (fixes the previous index error)
productSchema.index({ sku: 1 }, { unique: true, sparse: true });
productSchema.index({ createdBy: 1 });

module.exports = mongoose.model('Product', productSchema);
