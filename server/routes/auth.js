const express = require('express');
const User = require('../models/user');
const authRouter = express.Router();
const bcryptjs = require('bcryptjs');
authRouter.use(express.json());

authRouter.post('/api/signup', async (req, res) => {
    // Destructure the request body
    try {
        const { name, email, password } = req.body;
            const existingUser = await User.findOne( { email }); // We use await because findOne() is an asynchronous function.
            if (existingUser) {
                return res.status(400).json({ message: "User already exists" });
            }
            // Hash the password
            const hashedPassword = await bcryptjs.hash(password, 10);

            // Create a new user
            let user = new User({
                name,
                email,
                password : hashedPassword,
            });

            user = await user.save();
            res.json( user );
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: "Internal server error" });
    }
});

module.exports = authRouter;