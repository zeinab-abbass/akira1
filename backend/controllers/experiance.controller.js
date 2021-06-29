const express = require('express')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

const Experiance = require('../models/Experiance.model.js');
const User = require('../models/User.model.js');

//Add Experiance
exports.add = async (req, res, next) => {
       let experiance;

           if ((!req.body.company) || (!req.body.start_year) || (!req.body.end_year) || (!req.body.title) || (!req.body.description) || (!req.body.user)) {
               return res.json({error: 'Enter all fields'})
           }

           experiance = new Experiance({
                company: req.body.company,
                title: req.body.title,
                start_year: req.body.start_year,
                end_year: req.body.end_year,
                user: req.body.user,
                description: req.body.description
            })

           Experiance.findOne({
                company: req.body.company,
                title: req.body.title,
                start_year: req.body.start_year,
                end_year: req.body.end_year,
                user: req.body.user,
           })
           .populate({
                 path: 'user',
                 model: User})
            .then( exp1 => {
                if (!exp1) {
                  //save created to database => .then the callback fn it return the json object
                  experiance.save()
                  .then(result => {

                           User.findOne({
                                 _id: req.body.user,
                               })
                                 .then(u1 => {
                                   if (u1) {
                                     User.updateOne({_id: req.body.user}, {$addToSet: {experiance: experiance}}).exec((error, folder) => {
                                       if (error) {
                                         return res.status(500).send("There was a problem finding the workspace.");
                                       } else {
                                             return res.status(201).json(
                                             {
                                                   massage: 'Experiance created successfully!',
                                                   result: result
                                             });
                                       }
                                     });
                                   } else {
                                     return res.json({error: 'User not found.'})
                                   }
                                 })
                                 .catch(err => {
                                   return res.send('error: ' + err)
                                 })

                   })
                  .catch(err => {
                         return res.status(500).send(
                         {
                             error: err
                         });
                   });
                }
                else {
                     return res.json({error: 'Experiance already exists.'})
                }
            })
            .catch(err => {
                echo(err);
                return res.send('error: '+err)
            })
}