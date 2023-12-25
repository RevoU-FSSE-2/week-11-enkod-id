const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const mongoose = require('mongoose');

const app = express();
app.use(express.json());

mongoose.connect('mongodb://localhost:27017/test', {useNewUrlParser: true, useUnifiedTopology: true});

const userSchema = new mongoose.Schema({
  email: String,
  password: String,
});

const blogSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  title: String,
  description: String
});

const User = mongoose.model('User', userSchema);
const Blog = mongoose.model('Blog', blogSchema);

app.post('/register', async (req, res) => {
  const hashedPassword = await bcrypt.hash(req.body.password, 10);
  const user = new User({ email: req.body.email, password: hashedPassword });
  await user.save();
  res.status(201).send();
});

app.post('/login', async (req, res) => {
  const user = await User.findOne({ email: req.body.email });
  if (user && await bcrypt.compare(req.body.password, user.password)) {
    const token = jwt.sign({ id: user._id }, 'secret_key');
    res.json({ token });
  } else {
    res.status(401).send();
  }
});

app.use((req, res, next) => {
  const token = req.headers['authorization'];
  try {
    req.user = jwt.verify(token, 'secret_key');
    next();
  } catch {
    res.status(401).send();
  }
});

app.post('/blogs', async (req, res) => {
  const blog = new Blog({ ...req.body, userId: req.user.id });
  await blog.save();
  res.status(201).send();
});

app.get('/blogs', async (req, res) => {
  const blogs = await Blog.find({ userId: req.user.id });
  res.json(blogs);
});

app.listen(3000, () => {
  console.log("running in 3000");
});