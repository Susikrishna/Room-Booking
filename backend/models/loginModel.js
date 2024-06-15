const mongoose = require('mongoose');
const db = require("../config/db");

const loginSchema = new mongoose.Schema({
    username: {
        type : String,
        required: [true, "userName can't be empty"],
        unique: true,
    },
    password: {
        type: String,
        required: [true, "password is required"],
    },
})

const loginModel = db.model('login',loginSchema);

module.exports = loginModel;