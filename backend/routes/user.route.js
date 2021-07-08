const express = require('express')
const router = express.Router()

const actions = require("../controllers/user.controller")

router.get('/', (req,res) => {
    res.send('hello world');
});

router.post('/register', actions.register)
router.post('/login', actions.login)
router.post('/validate', actions.validate)
router.post('/edit', actions.edit)
router.post('/get', actions.get)
router.get('/users', actions.users)
router.post('/usersByLocation', actions.usersByLocation)
router.post('/editStatus', actions.editStatus)
router.post('/editType', actions.editType)

module.exports = router;
