const router = require('express').Router();
const Part = require('../models/Part');
const { protect } = require('../middleware/auth');

router.use(protect);

// Get all parts for a product — uses the { product: 1 } index for a fast scan
router.get('/product/:productId', async (req, res) => {
  try {
    const parts = await Part.find({ product: req.params.productId })
      .select('-__v')
      .populate('createdBy', 'name')
      .lean();
    res.json(parts);
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

router.post('/', async (req, res) => {
  try {
    const part = await Part.create({ ...req.body, createdBy: req.user._id });
    res.status(201).json(part);
  } catch (e) {
    res.status(400).json({ message: e.message });
  }
});

router.get('/:id', async (req, res) => {
  try {
    // Populate product with only the fields the breadcrumb actually needs
    const part = await Part.findById(req.params.id)
      .select('-__v')
      .populate('product', 'name _id')
      .populate('createdBy', 'name')
      .lean();
    if (!part) return res.status(404).json({ message: 'Not found' });
    res.json(part);
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

router.put('/:id', async (req, res) => {
  try {
    const part = await Part.findByIdAndUpdate(req.params.id, req.body, { new: true }).lean();
    res.json(part);
  } catch (e) {
    res.status(400).json({ message: e.message });
  }
});

router.delete('/:id', async (req, res) => {
  try {
    await Part.findByIdAndDelete(req.params.id);
    res.json({ message: 'Deleted' });
  } catch (e) {
    res.status(500).json({ message: e.message });
  }
});

module.exports = router;
