const express = require('express'); // Import express
const PORT = process.env.PORT || 3000; // Set port
const app = express(); // Create express app

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server listening on port ${PORT}`);
});