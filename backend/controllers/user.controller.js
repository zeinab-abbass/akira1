const express = require('express')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

const User = require('../models/User.model.js');

//Register
exports.register = async (req, res, next) => {
       let user;

       if ((!req.body.name) || (!req.body.username) || (!req.body.email) || (!req.body.password) || (!req.body.phone) || (!req.body.location) ) {
           return res.json({error: 'Enter all fields'})
       }

       //we will not store pass for the act of security
       //we will encrypt and decrypt pass acc to library bcrypt
       //encrypting pass
       await bcrypt.hash(req.body.password, 10, function(err,hash){
            if(err) throw err;

            user = new User({
                name: req.body.name,
                username: req.body.username,
                email: req.body.email,
                phone: req.body.phone,
                location: req.body.location,
                password: hash,
            })
            User.findOne({
                email: req.body.email
            })
            .then( user1 => {
                if (!user1) {
                  //save user created to database => .then the callback fn it return the json object
                  user.save()
                  .then(result => {
                             return res.status(201).json(
                            {
                               massage: 'User created successfully!',
                               result: result
                            });
                   })
                  .catch(err => {
                         return res.status(500).send(
                         {
                             error: err
                         });
                   });
                }
                else {
                     return res.json({error: 'User already exists.'})
                }
            })
            .catch(err => {
                return res.send('error: '+err)
            })

       });
}