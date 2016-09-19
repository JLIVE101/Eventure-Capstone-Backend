var jwt          = require('jsonwebtoken');
var config       = require('../config');
var dateFormat   = require('dateformat');
ACCEPTED_DOMAINS = ["localhost","jlive.me"];


module.exports = {

  //check if user is an admin
  isAdmin : function(req, res, next) {
    var user = req.user || req.decoded; //store user variable

    //if user is admin go to next route
    if(user.admin === 1)
      return next();

    //user is not admin send message
    res.send({
      error: "sorry this endpoint requires admin privileges"
    });
    return;


  },

  //parse any date fields send through req.body or query
  parseDateFields: function (req, res, next) {
    var obj = {};

    if(req.method === "GET") {
      obj = req.query;
    } else {
      obj = req.body;
    }

    Date.prototype.isValid = function () {
      // An invalid date object returns NaN for getTime() and NaN is the only
      // object not strictly equal to itself.
      return this.getTime() === this.getTime();
    };
    //loop through data params and parse any fields that have `date` into a javascript date
    for(var key in obj) {
      if(key.indexOf("date") > 0) {
        if(((new Date(obj[key]))).isValid())
          obj[key] = new Date(obj[key]);
        else
          return res.send({success: false, message: key + " is an invalid date"});
      }
      console.log("\n\n\n\n\n"+dateFormat(req.query.start_date,'yyyy-mm-d')+"\n\n\n\n");
      

    }
    next();
  },

  //function to block unwanted domains
  rejectUnwantedDomains : function(req, res, next) {
    if(ACCEPTED_DOMAINS.indexOf(req.hostname) < 0) {
      res.send({
        error: "sorry this domain is not accepted"
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

};
