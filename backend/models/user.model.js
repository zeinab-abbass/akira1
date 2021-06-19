const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const UserSchema = mongoose.Schema({
    name : { type: String, required: [true, "Please fill this field"] },
    username : { type: String, required: [true, "Please fill this field"] },
    email : { type: String, required: [true, "Please fill this field"], unique: [true, "Already taken"] },
    password : { type: String, required: [true, "Please fill this field"] },
    phone : { type: String, required: [true, "Please fill this field"] },
    location : { type: String, required: [true, "Please fill this field"] },
    languages : [ { type: String } ],
    hobbies : [ { type: String } ],
    interests : [ { type: String } ],
    experiance : [{ type: Schema.Types.ObjectId, ref: 'Experiance' }],
    age : { type: Number },
    photo : { type: String, },
    status : { type: Boolean, default: true },
    type : { type: String, default: "basic" },
    favorites : [{ type: Schema.Types.ObjectId, ref: this }]
});

// to create data objects based on the schema we need model
module.exports = User = mongoose.model('User',UserSchema);
