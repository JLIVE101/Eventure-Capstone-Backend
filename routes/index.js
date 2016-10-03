var jwt = require('jsonwebtoken');
var mw  = require('../helpers/middleware');

module.exports = function(app, passport) {



  // =====================================
  // WELCOME MESSAGE =====================
  // =====================================
  app.get('/', function(req, res) {

    //res.send('Hello! The API is at http://localhost:9000/api/v1');
    res.send("url is: " + req.url);
  });

  // route to test if the user is logged in or not
  app.get('/loggedin', [mw.isLoggedIn], function(req, res) {
    res.status(200).send(req.user);
  });

  // ===========================================
  // LOCAL SIGNUP ==============================
  // ===========================================
  app.post('/local_signup', function(req, res, next){
    passport.authenticate('local-signup', function (err, user, info) {
      //if an err is thrown
      if(err)
        return next(err);
      //if an error happaned during registration process
      if( !user )
        return res.send(401, info);

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
        /*
        {
          success: true,
          data: {
            //user: user,
            token: token
          }
        }
         */
        return res.status(200).send({
          success: true,
          user   : {
            displayName: user.username,
          }
        });
      });
    })(req, res, next);
  });
  // ===========================================
  // LOCAL LOGIN ===============================
  // ===========================================
  app.post('/local_login', function(req, res, next){
    passport.authenticate('local-login', function(err, user, info){
      if(err)
        return next(err);
      if( !user )
        return res.status(401).json(info);

      //at this point there are no errors so initiate login.
      req.login(user, function (err) {
        if(err)
          return next(err);

        //delete password for security reasons
        delete user.password;
        delete user.admin;
        //create jsonwebtoken
        var token = jwt.sign(user, app.get("jwt-secret"), {
          "expiresIn" : 60*60*24 // expires in 24 hours
        });
        // TODO: change displayName for user based on their primary account
        return res.status(200).json({
          success: true,
          user   : {
            displayName: user.username,
          }
        });
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
