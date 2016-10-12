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

        done(null, user);
    });

    // used to deserialize the user
    passport.deserializeUser(function(serializedUser, done) {
      User.forge({ "id" : serializedUser.id})
        .fetch()
        .then(function (user) {
          var obj = user;
          obj.loginType = serializedUser.loginType;
          done(null, obj);
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
      passReqToCallback : true, // allows us to pass back the entire request to the callback
      usernameField: 'email',
    },
    function(req, email, password, done) {

      // asynchronous
      // User.forge() wont fire unless data is sent back
      process.nextTick(function() {

        // TODO: check to see if username is allowed by checking negative characters

        User.query(function (qb) {
          qb.orWhere({ "email" : email });
          qb.orWhere({ "username" : req.body.username});
        })
        .fetch()
        .then(function (user) {
          if(user) {
            //user already exists
            return done(null, false, {success:false, message: "Check Email or Display Name"});
          } else {
            //user doesnt exist and no errors happens

            //check to see if all required fields are set, then save else return error
            if(req.body.username && password && email) {
              User.forge({
                "username"        : req.body.username,
                "password"        : bcrypt.hashSync(password, bcrypt.genSaltSync(10), null), //generate hash
                "email"           : email,
                "primary_account" : "local",
              })
              .save()
              .then(function(newUser){
                var obj = newUser;
                obj.loginType = 'local';
                return done(null, obj);
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
      passReqToCallback : true, // allows us to pass back the entire request to the callback
      usernameField : 'email'
    },
    function(req, email, password, done) {
      //find user who has same username
      User.forge({ "email" : email })
        .fetch()
        .then(function(user){
          // if no user is found, return the message
          if(!user)
            return done(null,false, {success:false, message: "Invalid Credentials"});

          // if the user is found but the password is wrong
          if(!(bcrypt.compareSync(password, user.attributes.password.toString())))
            return done(null, false, {success:false, message: "Invalid Credentials"});

            var obj = user.attributes;
            obj.loginType = 'local';

          // all is well, return successful user
          return done(null, obj);
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
          if (user) {
            var obj = user.attributes;
            obj.loginType = 'facebook';
            return done(null, obj);
          }
            console.log(profile);
            User.forge({
              // set all of the facebook information in our user model
              "facebook_id"    : profile.id, // set the users facebook id
              "facebook_token" : token, // we will save the token that facebook provides to the user
              "facebook_name"  : (profile.name.givenName && profile.name.familyName) ? profile.name.givenName + ' ' + profile.name.familyName : profile.displayName, // look at the passport user profile to see how names are returned
              "facebook_email" : (profile.emails) ? profile.emails[0].value : false, // facebook can return multiple emails so we'll take the first
            })
            .save()
            .then(function (newUser) {
              var obj = user;
              obj.loginType = 'facebook';

              return done(null, obj);
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
