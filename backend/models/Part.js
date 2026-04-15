const mongoose = require('mongoose');

const partSchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: { type: String },
  product: { type: mongoose.Schema.Types.ObjectId, ref: 'Product', required: true },
  createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
}, { timestamps: true });

// Critical: this index makes GET /parts/product/:productId a single index scan
// instead of a full collection scan
partSchema.index({ product: 1 });

module.exports = mongoose.model('Part', partSchema);
