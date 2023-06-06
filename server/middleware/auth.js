const jwt = require("jsonwebtoken");

const auth = async (req, res, next) => {
    try {
        const token = req.header("x-auth-token");  // Get the token from the request header
        if (!token) {
            return res.status(401).json({ msg: "No authentication token, authorization denied" });
        }

        const verified = jwt.verify(token, "passwordKey");  // Verify the token
        if (!verified) {
            return res.status(401).json({ msg: "Token verification failed, authorization denied" });
        }

        req.user = verified.id;  // req.user is the user id
        req.token = token;  // req.token is the token
        next();  // Move on to the next middleware
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}

module.exports = auth;