const jwt = require('jsonwebtoken');
const User = require('../models/User');

// In-memory user cache: avoids a DB round-trip on every protected request.
// TTL of 5 minutes — short enough that role changes propagate quickly.
const userCache = new Map(); // userId -> { user, expiresAt }
const CACHE_TTL_MS = 5 * 60 * 1000;

function getCachedUser(id) {
  const entry = userCache.get(id);
  if (!entry) return null;
  if (Date.now() > entry.expiresAt) { userCache.delete(id); return null; }
  return entry.user;
}

function setCachedUser(id, user) {
  userCache.set(id, { user, expiresAt: Date.now() + CACHE_TTL_MS });
}

exports.protect = async (req, res, next) => {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return res.status(401).json({ message: 'Not authorized' });
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const cached = getCachedUser(decoded.id);
    if (cached) {
      req.user = cached;
    } else {
      // .lean() returns a plain JS object — faster than a hydrated Mongoose doc
      const user = await User.findById(decoded.id).select('-password -__v').lean();
      setCachedUser(decoded.id, user);
      req.user = user;
    }
    next();
  } catch {
    res.status(401).json({ message: 'Token invalid' });
  }
};

// Call this on logout/role-change so the cache doesn't serve stale data
exports.invalidateUserCache = (userId) => userCache.delete(String(userId));

exports.adminOnly = (req, res, next) => {
  if (req.user.role !== 'admin') return res.status(403).json({ message: 'Admin only' });
  next();
};
