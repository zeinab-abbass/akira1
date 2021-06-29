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
                echo(err);
                return res.send('error: '+err)
            })

       });
}

//Login
exports.login = async (req,res,next) =>{
  let  user1;
  //1.find if the email found
  await User.findOne( { email:req.body.email } )
    .then(user => {
      if (!user) {
        return res.status(401).json({
          massage: "Authentication Failed : User not Found."
        });
      }
      user1 = user;
      //2.we find the email we must compare pass to find if it match
     bcrypt.compare(req.body.password, user.password,function (err,res1) {
       if (!res1) {
         return res.status(401).json({
           massage: 'Authentication Failed: False Password.'
         })
       } else {
         //password match then we want to create the token
         const token = jwt.sign({email: user1.email, id: user1._id}, 'secret-key', {
           algorithm: 'HS256',
           expiresIn: '1h',
           subject: user1.email
         }); //this method create token and we give it the data we want to store

         return res.status(201).json({
           user: user1,
           //token: token,
         });
       }
     });
    })
    .catch(err => {
      return res.status(401).json({
        massage : 'Authentication Failed!!'
      })
    });
}

//Validate email
exports.validate = async (req, res, next) => {


       if ((!req.body.email) ) {
           return res.json({error: 'Enter all fields'})
       }

            User.findOne({
                email: req.body.email
            })
            .then( user1 => {
                if (!user1) {
                           return res.status(201).json(
                            {
                               massage: 'User validate successfully!',
                               result: true
                            });
                }
                else {
                     return res.status(200).json(
                     {
                        error: 'User already exists.',
                        result: false
                     })
                }
            })
            .catch(err => {
                echo(err);
                return res.send('error: '+err)
            })
}


//edit user info
exports.edit = async (req, res, next) => {

  if ((!req.body.name) || (!req.body.email) || (!req.body.password) || (!req.body.location) ) {
        return res.json({error: 'Enter all fields'})
  }

         await bcrypt.hash(req.body.password, 10, function(err,hash){
              if(err) throw err;

              User.findOne({
                  email: req.body.email
              })
              .then( user1 => {
                  if (user1) {
                        User.updateOne( { email: req.body.email },
                                        { $set:     { name: req.body.name ,
                                                      location: req.body.location,
                                                      //experiance: req.body.experiance,
                                                      hobbies: req.body.hobbies ,
                                                      languages: req.body.languages ,
                                                      interests: req.body.interests ,
                                                      password: hash
                                                    }
                                         }
                                    ).exec((error, data) => {

                                      if (error) {
                                        console.log(error)
                                        return res.status(500).send("There was a problem finding the user.");
                                      } else {
                                        return res.status(201).json(
                                          {
                                            massage: 'user updated successfully!',
                                            result: data
                                          });
                                      }
                                   });
                  }
                  else {
                       return res.json({error: 'User dosent found.'})
                  }
              })
              .catch(err => {
                  console.log(err)
                  return res.send('error: '+err)
              })
         });
}

//get user
exports.get = async (req, res, next) => {

       if ((!req.body.email) ) {
           return res.json({error: 'Enter all fields'})
       }

            User.findOne({
                email: req.body.email
            })
            .then( user1 => {
                if (user1) {
                           return res.status(201).json(
                            {
                               result: user1
                            });
                }
                else {
                     return res.status(200).json(
                     {
                        error: 'User didnt found',
                        result: false
                     })
                }
            })
            .catch(err => {
                echo(err);
                return res.send('error: '+err)
            })

}

//list users
exports.users = async (req, res, next) => {
       let users = User.find({}).exec((error, data) => {
           if (error) {
                return res.status(500).send("There was a problem finding the data");
           }
           else  if (!data) return res.status(404).send("No data found.");
           else {
                return res.status(201).send(data);
           }
       })
 }