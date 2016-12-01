// ========================
// get the packages we need
// ========================

var config = require('./config');
var express = require('express');
var app = express();
var port = process.env.PORT || 9000;
var passport = require('passport');
var mw = require('./helpers/middleware');

var apiRoutes = require('./routes/api');
var morgan = require('morgan');
var cookieParser = require('cookie-parser');
var bodyparser = require('body-parser');
var session = require('express-session');
// TODO : SETUP MONGODB FOR COMMENTS BETWEEN USERS
// TODO : SETUP SOCKET SERVER



// =======================
// configuration =========
// =======================

app.set('jwt-secret', config.jwt.secret); // secret variable
app.set('port', port);

// allow cross origin requests
app.all("*", function (req, res, next) {
	var allowedOrigins = ['http://localhost:3000', 'http://jlive.me', 'http://67.205.153.9'];
	var origin = req.headers.origin;
	console.log("host is: " + req.host);

	if(allowedOrigins.indexOf(origin) > -1) {
		res.setHeader('Access-Control-Allow-Origin', origin);
	}
	res.header("Access-Control-Allow-Credentials", "true");
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	res.header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE, OPTIONS");
	return next();
});
//set up static server to server any uploaded images
app.use('/uploads', express.static('uploads'));

// use body parser so we can get info from POST and/or URL parameters
app.use(morgan('dev'));
app.use(cookieParser());
app.use(bodyparser.urlencoded({
	extended: true,
	limit: '10mb',
}));
app.use(bodyparser.json());



//required for passport
app.use(session({
	secret: config.passport.secret
})); // session secret
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
require('./passport/index')(passport);


// ========================
// setup routes for app ===
// ========================

//allow only api calls within the array of accepted domains
app.use(mw.rejectUnwantedDomains);

//wire up passsport.js routes
require('./routes/index')(app, passport);




//all api routes
app.use('/api/v1', apiRoutes);


module.exports = app;
