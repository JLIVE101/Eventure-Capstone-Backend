// load all the things we need
var LocalStrategy    = require('passport-local').Strategy;
var FacebookStrategy = require('passport-facebook').Strategy;
var TwitterStrategy  = require('passport-twitter').Strategy;
var GoogleStrategy   = require('passport-google-oauth').OAuth2Strategy;

// load up the user model
var User   = require('../models/User');

// load bcrypt for hashing passwords
var bcrypt = require('bcrypt-nodejs');

// load config file for social media strategies
var config = require('../config');

// expose this function to our app using module.exports
module.exports = function(passport) {

    // =========================================================================
    // passport session setup ==================================================
    // =========================================================================
    // required for persistent login sessions
    // passport needs ability to serialize and unserialize users out of session

    // used to serialize the user for the session
    passport.serializeUser(function(user, done) {
        done(null, user.id);
    });

    // used to deserialize the user
    passport.deserializeUser(function(id, done) {
      User.forge({ "id" : id})
        .fetch()
        .then(function (user) {
          done(null, user.toJSON());
        })
        .catch(function (err) {
          done(err, null);
        });
    });

    // =========================================================================
    // LOCAL SIGNUP ============================================================
    // =========================================================================
    // we are using named strategies since we have one for login and one for signup
    // by default, if there was no name, it would just be called 'local'

    passport.use('local-signup', new LocalStrategy({
      passReqToCallback : true // allows us to pass back the entire request to the callback
    },
    function(req, username, password, done) {

      // asynchronous
      // User.forge() wont fire unless data is sent back
      process.nextTick(function() {

        User.forge({ "username" : username })
        .fetch()
        .then(function (user) {
          if(user) {
            //user already exists
            return done(null, false, {success:false, message: 'That username is already taken.'});
          } else {
            //user doesnt exist and no errors happens

            //check to see if all required fields are set, then save else return error
            if(username && password && req.body.email && req.body.first_name && req.body.last_name && req.body.gender && req.body.date_of_birth) {
              User.forge({
                "gender"          : req.body.gender,
                "date_of_birth"   : req.body.date_of_birth,
                "username"        : username,
                "password"        : bcrypt.hashSync(password, bcrypt.genSaltSync(10), null), //generate hash
                "email"           : req.body.email,
                "first_name"      : req.body.first_name,
                "last_name"       : req.body.last_name,
                "primary_account" : "local",
                "phone_number"    : req.body.phone_number || "" //replace phone # with empty string if null
              })
              .save()
              .then(function(newUser){

                return done(null, newUser);
              })
              //if an error happens when saving the user
              .catch(function(err){
                return done(null, false, err);
              });
            } else {
              //not all fields were sent
              return done(null, false, {success:false, message: 'All required fields must be filled out.'});
            }
          }
        })
        //if an error happens when searching for the user
        .catch(function (err) {
          return done(err.message);
        });

      });

    }));

    // =========================================================================
    // LOCAL LOGIN =============================================================
    // =========================================================================
    // we are using named strategies since we have one for login and one for signup
    // by default, if there was no name, it would just be called 'local'
    passport.use('local-login', new LocalStrategy({
      passReqToCallback : true // allows us to pass back the entire request to the callback
    },
    function(req, username, password, done) {
      //find user who has same username
      User.forge({ "username" : username })
        .fetch()
        .then(function(user){
          // if no user is found, return the message
          if(!user)
            return done(null,false, {success:false, message: "No user found with the name: " + username});

          // if the user is found but the password is wrong
          if(!(bcrypt.compareSync(password, user.attributes.password.toString())))
            return done(null, false, {success:false, message: "Oops! Wrong password."});

          // all is well, return successful user
          return done(null, user.attributes);
        })
        .catch(function(err){
          // if there are any errors, return the error before anything else
          return done(err.message);
        });
    }));



    // =========================================================================
    // FACEBOOK ================================================================
    // =========================================================================
    passport.use(new FacebookStrategy({

        // pull in our app id and secret from our config.json file
        clientID        : config.passport.facebookAuth.clientID,
        clientSecret    : config.passport.facebookAuth.clientSecret,
        callbackURL     : config.passport.facebookAuth.callbackURL

    },
    // facebook will send back the token and profile
    function(token, refreshToken, profile, done) {
      // asynchronous
      process.nextTick(function() {

        // find the user in the database based on their facebook id
        User.forge({"facebook_id" : profile.id})
        .fetch()
        .then(function (user) {

          // if the user is found, then log them in
          if (user)
            return done(null, user);
            console.log(profile);
            User.forge({
              // set all of the facebook information in our user model
              "facebook_id"    : profile.id, // set the users facebook id
              "facebook_token" : token, // we will save the token that facebook provides to the user
              "facebook_name"  : (profile.name.givenName && profile.name.familyName) ? profile.name.givenName + ' ' + profile.name.familyName : profile.displayName, // look at the passport user profile to see how names are returned
              "facebook_email" : (profile.emails) ? profile.emails[0].value : "no email defined", // facebook can return multiple emails so we'll take the first
            })
            .save()
            .then(function (user) {
              return done(null, newUser);
            })
            //if an error happens when saving the user
            .catch(function(err){
              return done(null, false, err);
            });

        })
        .catch(function (err) {
          // if there are any errors, return the error before anything else
          return done(err.message);
        });

      });


  }));
};
