require('dotenv').config();
const express = require('express');
const cors = require('cors');
const http = require('http');
const https = require('https');
const { connectDB } = require('./config/db');

const app = express();

app.use(cors());
app.use(express.json());

// Routes
app.use('/api/auth', require('./routes/auth'));
app.use('/api/products', require('./routes/products'));
app.use('/api/parts', require('./routes/parts'));
app.use('/api/gcodes', require('./routes/gcodes'));

app.get('/api/health', (req, res) => res.json({ status: 'ok' }));

// ── Keep-alive for Render free tier ────────────────────────────────────────
// Render free dynos spin down after 15 min of inactivity, causing 20-30 second
// cold starts. We self-ping /api/health every 10 minutes to keep the dyno warm.
// Only runs in production so local dev isn't affected.
function startKeepAlive() {
  if (process.env.NODE_ENV !== 'production') return;

  // RENDER_EXTERNAL_URL is injected automatically by Render on every deployment.
  // RENDER_URL is our own custom fallback if someone overrides it manually.
  const base = process.env.RENDER_EXTERNAL_URL || process.env.RENDER_URL;
  const selfUrl = base ? `${base}/api/health` : null;

  if (!selfUrl) {
    console.log('[keep-alive] no Render URL found — skipping keep-alive ping');
    return;
  }

  const pingFn = selfUrl.startsWith('https') ? https : http;

  setInterval(() => {
    pingFn.get(selfUrl, (res) => {
      console.log(`[keep-alive] ping → ${res.statusCode}`);
    }).on('error', (err) => {
      console.warn('[keep-alive] ping failed:', err.message);
    });
  }, 10 * 60 * 1000); // every 10 minutes

  console.log(`[keep-alive] pinging ${selfUrl} every 10 min`);
}

connectDB()
  .then(() => {
    app.listen(process.env.PORT || 5000, () => {
      console.log(`Server running on port ${process.env.PORT || 5000}`);
      startKeepAlive();
    });
  })
  .catch(err => console.error(err));
