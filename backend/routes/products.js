const router = require('express').Router();
const Product = require('../models/Product');
const { protect } = require('../middleware/auth');

router.use(protect);

router.get('/', async (req, res) => {
  try {
    // .lean() returns plain JS objects — 2-5x faster than hydrated Mongoose docs
    // .select('-__v') drops the internal version field from the response
    const products = await Product.find()
      .select('-__v')
      .populate('createdBy', 'name email')
      .lean();
    res.json(products);
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

router.post('/', async (req, res) => {
  try {
    const { name, description, sku } = req.body;
    const data = { name, description, createdBy: req.user._id };
    if (sku && sku.trim()) data.sku = sku.trim();
    const product = await Product.create(data);
    res.status(201).json(product);
  } catch (e) {
    res.status(400).json({ message: e.message });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const product = await Product.findById(req.params.id)
      .select('-__v')
      .populate('createdBy', 'name')
      .lean();
    if (!product) return res.status(404).json({ message: 'Not found' });
    res.json(product);
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

router.put('/:id', async (req, res) => {
  try {
    const product = await Product.findByIdAndUpdate(req.params.id, req.body, { new: true }).lean();
    res.json(product);
  } catch (e) {
    res.status(400).json({ message: e.message });
  }
});

router.delete('/:id', async (req, res) => {
  try {
    await Product.findByIdAndDelete(req.params.id);
    res.json({ message: 'Deleted' });
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

module.exports = router;
