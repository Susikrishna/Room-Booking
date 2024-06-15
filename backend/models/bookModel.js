const mongoose = require('mongoose');
const db = require("../config/db")

const bookSchema = new mongoose.Schema({
    userId:{
        type:String,
        required: true,
    },
    roomNumber:{
        type: String,
        required: true,
    },
    purpose: {
        type: String,
        required: true,
    },
    clubName: {
        type: String,
        required: true,
    }
})

const bookModel = db.model("book",bookSchema);
module.exports = bookModel;