const mongoose = require('mongoose');

let bucket;

const connectDB = async () => {
  const conn = await mongoose.connect(process.env.MONGO_URI);
  const { GridFSBucket } = mongoose.mongo;
  bucket = new GridFSBucket(conn.connection.db, { bucketName: 'cadfiles' });

  console.log('MongoDB connected');
  return conn;
};

const getBucket = () => bucket;

module.exports = { connectDB, getBucket };
