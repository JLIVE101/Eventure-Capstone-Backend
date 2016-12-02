// ========================
// get the packages we need
// ========================

var config = require('./config');
var express = require('express');
var app = express();
var port = process.env.PORT || 9000;
var passport = require('passport');
var mw = require('./helpers/middleware');
var cors = require('cors');

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


//setup cors
var whitelist =  ['http://localhost:3000', 'http://jlive.me', 'http://67.205.153.9', 'http://67.205.153.9:3000', 'http://localhost'];
var corsOptions = {
  origin: function(origin, callback){
    var originIsWhitelisted = !origin || whitelist.indexOf(origin) !== -1;
    callback(originIsWhitelisted ? null : 'Bad Request', originIsWhitelisted);
  },
	credentials: true,
};

//setup static upload folder
app.use('/uploads', express.static('uploads'));

//setup cors across server
app.all('*', cors(corsOptions));


//set up static server to server any uploaded images

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
