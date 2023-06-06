const express = require('express');
const User = require('../models/user');
const authRouter = express.Router();
const bcryptjs = require('bcryptjs');
const auth = require('../middleware/auth');
const jwt = require('jsonwebtoken');
authRouter.use(express.json());

// Sign Up
authRouter.post("/api/signup", async (req, res) => {
  try {
        const { name, email, password } = req.body;  // Destructure the request body

        const existingUser = await User.findOne({ email });  // We use await because findOne() is an asynchronous function.
        if (existingUser) {
            return res
                .status(400)
                .json({ msg: "User with same email already exists!" });
        }

        const hashedPassword = await bcryptjs.hash(password, 8);  // Hash the password

        console.log("hashedPassword: ", typeof hashedPassword);

        let user = new User({
          email,
          password: hashedPassword,
          name,
        });

        user = await user.save();
        res.json(user);

  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Sign In
authRouter.post('/api/signin', async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne( { email });

        if (!user) {
            return res.status(400).json({ message: "User does not exist" });
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ message: "Incorrect password" });
        }

        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, ...user._doc });

    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Check Token Validity
authRouter.post('/tokenIsValid', async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        if (!token) {
            return res.json(false);
        }
        const verified = jwt.verify(token, "passwordKey");
        if (!verified) {
            return res.json(false);
        }
        const user = await User.findById(verified.id);
        if (!user) {
            return res.json(false);
        }
        res.json(true); // If all the above conditions are satisfied, then return true.

    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token});
});

module.exports = authRouter;