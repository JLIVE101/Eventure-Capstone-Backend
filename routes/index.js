var jwt = require('jsonwebtoken');
var mw  = require('../helpers/middleware');

module.exports = function(app, passport) {



  // =====================================
  // WELCOME MESSAGE =====================
  // =====================================
  app.get('/', function(req, res) {

    res.send('Hello! The API is at http://localhost:9000/api/v1');
  });

  // route to test if the user is logged in or not
  app.post('/loggedin',  function(req, res) {

    console.log(req.user);

    var obj = {};
    console.log(req.isAuthenticated() + " for authenticated");
    if(req.isAuthenticated() == true) {
      obj.success = true;
      obj.user = {id: req.user.id, displayName: req.user.username};
    } else {
      obj.success = false;
      obj.user = null;
    }



    res.status(200).send(obj);
  });

  // ===========================================
  // LOCAL SIGNUP ==============================
  // ===========================================
  app.post('/local_signup', function(req, res, next){
    passport.authenticate('local-signup', {session: true}, function (err, user, info) {
      //if an err is thrown
      if(err)
        return next(err);
      //if an error happaned during registration process
      if( !user )
        return res.send(401, info);
      console.log("calling login from signup");
      req.login(user, function (err) {
        if(err)
          return next(err);

        //delete password for security reasons
        delete user.password;
        delete user.admin;
        //create token
        var token = jwt.sign(user, app.get("jwt-secret"), {
          "expiresIn" : 60*60*24 // expires in 24 hours
        });
        res.status(200).send({
          success: true,
          user   : {
            id: user.id,
            displayName: user.username,
          }
        });
        //res.end();
      });
    })(req, res, next);
  });
  // ===========================================
  // LOCAL LOGIN ===============================
  // ===========================================
  app.post('/local_login', function(req, res, next){
    passport.authenticate('local-login', {session: true}, function(err, user, info){
      if(err)
        return next(err);
      if( !user )
        return res.status(401).json(info);

      //at this point there are no errors so initiate login.
      console.log("calling login from login route");
      req.login(user, function (err) {
        if(err)
          return next(err);

        console.log("login worked!");
        //delete password for security reasons
        delete user.password;
        delete user.admin;
        //create jsonwebtoken
        var token = jwt.sign(user, app.get("jwt-secret"), {
          "expiresIn" : 60*60*24 // expires in 24 hours
        });
        // TODO: change displayName for user based on their primary account
        res.status(200).json({
          success: true,
          user   : {
            id: user.id,
            displayName: user.username,
          }
        });
        //res.end();
      });
    })(req, res, next);
  });


  // =============================================
  // FACEBOOK AUTH ===============================
  // =============================================
  app.get('/auth/facebook', passport.authenticate('facebook', { scope : 'email' }));

  app.get('/auth/facebook/callback', passport.authenticate('facebook',  {
    successRedirect : 'http://localhost:3000/#/',
    failureRedirect : 'http://localhost:3000/#/#login-modal'
  }));





  // =====================================
  // LOGOUT ==============================
  // =====================================
  app.get('/logout', function(req, res) {
      req.logout();
      res.redirect('http://localhost:3000/#/');
      //After clearing user object in session send back a null user
      //clear any jsonwebtokens
  });

};
