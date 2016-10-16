var jwt = require('jsonwebtoken');
var mw = require('../helpers/middleware');

module.exports = function (app, passport) {



// =====================================
// WELCOME MESSAGE =====================
// =====================================
app.get('/', function (req, res) {

	res.send('Hello! The API is at http://localhost:9000/api/v1');
});

// route to test if the user is logged in or not
app.get('/loggedin', function (req, res) {


	var obj = {};
	if(req.isAuthenticated()) {
		console.log(req.user);
		obj.success = true;
		obj.user = req.user;
	} else {
		obj.success = false;
		obj.user = null;
	}



	res.status(200).send(obj);
});

// ===========================================
// LOCAL SIGNUP ==============================
// ===========================================
app.post('/local_signup', function (req, res, next) {
	passport.authenticate('local-signup', function (err, user, info) {
		//if an err is thrown
		if(err)
			return next(err);
		//if an error happaned during registration process
		if(!user)
			return res.send(401, info);
		req.login(user, function (err) {
			if(err)
				return next(err);
		});

		//create token
		var token = jwt.sign(user, app.get("jwt-secret"), {
			"expiresIn": 60 * 60 * 24 // expires in 24 hours
		});
		res.status(200).send({
			success: true,
			user: user
		});
})(req, res, next);
});
// ===========================================
// LOCAL LOGIN ===============================
// ===========================================
app.post('/local_login', function (req, res, next) {
	passport.authenticate('local-login', function (err, user, info) {
		if(err)
			return next(err);
		if(!user)
			return res.status(401).json(info);


		//at this point there are no errors so initiate login.
		req.login(user, function (err) {
			if(err)
				return next(err);
    });

		//create jsonwebtoken
		var token = jwt.sign(user, app.get("jwt-secret"), {
			"expiresIn": 60 * 60 * 24 // expires in 24 hours
		});
		res.status(200).json({
			success: true,
			user: user
		});
	})(req, res, next);
});


// =============================================
// FACEBOOK AUTH ===============================
// =============================================
app.get('/auth/facebook', passport.authenticate('facebook', {
	scope: 'email'
}));

app.get('/auth/facebook/callback', passport.authenticate('facebook', {
	successRedirect: 'http://localhost:3000/#/',
	failureRedirect: 'http://localhost:3000/#/#login-modal'
}));





// =====================================
// LOGOUT ==============================
// =====================================
app.get('/logout', function (req, res) {
	req.logout();
	res.end();
	//After clearing user object in session send back a null user
	//clear any jsonwebtokens
});

};
