const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },

    email: {
        type: String,
        required: true,
        trim: true,
        validate: {
            validator: function (value) {
                const regex = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                return value.match(regex);
            },
            message: "Invalid email address",
        },
    },

    password: {
        type: String,
        required: true,
    },

    address: {
        type: String,
        default: "", // Default value, because address is not mandatory during signup.
    },

    type: {
        type: String,
        default: "user",  // Default value is set to user , because user is not an admin.
    }
});

const User = mongoose.model('User', userSchema); // Create a model from the schema. Very Important!

module.exports = User; // Export the model so that it can be used in other files.