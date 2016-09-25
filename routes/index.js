var jwt = require('jsonwebtoken');

module.exports = function(app, passport) {
  // =====================================
  // WELCOME MESSAGE =====================
  // =====================================
  app.get('/', function(req, res) {
      res.send('Hello! The API is at http://localhost:9000/api/v1');
  });
  // =====================================
  // SIGNUP ==============================
  // =====================================
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

        return res.send({
          success: true,
          data: {
            //user: user,
            token: token
          }
        });
      });
    })(req, res, next);
  });
  // =====================================
  // LOGIN ===============================
  // =====================================
  app.post('/local_login', function(req, res, next){
    passport.authenticate('local-login', function(err, user, info){
      if(err)
        return next(err);
      if( !user )
        return res.send(401, info);

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

        return res.send({
          success: true,
          credentials: {
            //user: user,
            token: token
          }
        });
      });
    })(req, res, next);
  });

  // =====================================
  // LOGOUT ==============================
  // =====================================
  app.get('/logout', function(req, res) {
      req.logout();
      //After clearing user object in session send back a null user
      //clear any jsonwebtokens
      res.send({
        user: null
      });
  });

};
