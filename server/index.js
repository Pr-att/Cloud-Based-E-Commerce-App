const express = require('express'); // Import express
const PORT = process.env.PORT || 3000; // Set port
const app = express(); // Create express app
const mongoose = require('mongoose'); // Import mongoose
const DB = "mongodb+srv://Amazon_Clone:cjcXPX2l0qL3HCNq@amazon-cluster.eleh2ko.mongodb.net/?retryWrites=true&w=majority";


// npm run dev to start server
const authRouter = require('./routes/auth'); // Import auth router

// To manipulate the data sent from client to server, we use middleware
// Middleware is a function that has access to the request and response objects
app.use(authRouter); // Use auth router
app.use(express.json()); // Parse JSON data sent from client to server

// Connect to MongoDB
mongoose.connect(DB).then(() => {
    console.log("Connected to MongoDB");
}).catch((err) => {
    console.log(err);
});


app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server listening on port ${PORT}`);
});

//module.exports = "index.js";