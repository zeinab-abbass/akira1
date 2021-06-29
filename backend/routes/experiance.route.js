const express = require('express')
const router = express.Router()

const actions = require("../controllers/experiance.controller")

router.get('/', (req,res) => {
    res.send('hello world');
});

router.post('/addExperiance', actions.add)

module.exports = router;
