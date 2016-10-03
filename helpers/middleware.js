var jwt          = require('jsonwebtoken');
var config       = require('../config');
ACCEPTED_DOMAINS = ["localhost","jlive.me","local.host"];


module.exports = {


  //check if user is an admin
  isAdmin : function(req, res, next) {
    var user = req.user; //store user variable

    //if user is admin go to next route
    if(user.admin === 1)
      return next();

    //user is not admin send message
    res.send({
      success: false,
      message: "sorry this endpoint requires admin privileges"
    });
    return;


  },

  //check if a user is logged in and has a session with passportJS
  isLoggedIn : function (req, res, next) {

    if(req.isAuthenticated())
      return next();

    return res.status(500).json({success: false, message: "You need to be logged in at http://www.eventure.com"});

  },

  //function to block unwanted domains
  rejectUnwantedDomains : function(req, res, next) {
    if(ACCEPTED_DOMAINS.indexOf(req.hostname) < 0) {
      res.send({
        success: false,
        message: "sorry this domain is not accepted"
      });
      return;
    } else {
      //accepted domain sent a request
      next();
    }
  },

  //function to verify jsonwebtoken
	verifyToken: function (req, res, next) {
		// check header or url parameters or post parameters for token
		var token = req.body.token || req.query.token || req.headers['x-access-token'];
		// decode token
		if(token) {
			// verifies secret and checks exp
			jwt.verify(token, config.jwt.secret, function (err, decoded) {
				if(err) {
					return res.json({
            success: false,
						message: 'Error. Failed to authenticate token.'
					});
				} else {
					// if everything is good, save to request for use in other routes
					req.decoded = decoded;
					next();
				}
			});
		} else {
			// if there is no token
			// return an error
			return res.send(403, {
				success: false,
				message: 'Error. No token provided. Please authenticate'
			});
		}
	},

  //check if the User is the same user, used when someone tries to edit user profiles
  verifyUser : function (req, res, next) {
    var id = Number(req.params.id); //grab id from url
    var user = req.user; //store user variable

    //check if user is the same user performing the action of the endpoint
    if(user.id === id)
      return next();

    //may want to store user details who performed this action so we know if someone is trying to do something malicious
    return res.status(500).json({success: false, message: "You do not have the privileges to perform this action"});
  },

};
