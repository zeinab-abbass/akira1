const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//connection
require('../database/mongoose')

// creating the collection
const ExperianceSchema = mongoose.Schema({
    start_year : { type: String, required: [true, "Please fill this field"] },
    end_year : { type: String, required: [true, "Please fill this field"] },
    company : { type: String, required: [true, "Please fill this field"] },
    description : { type: String }
});

// to create data objects based on the schema we need model
module.exports = Experiance = mongoose.model('Experiance',ExperianceSchema);
