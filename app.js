// ========================
// get the packages we need
// ========================

var config       = require('./config');
var express      = require('express');
var app          = express();
var port         = process.env.PORT || 9000;
var passport     = require('passport');
var mw           = require('./helpers/middleware');

var apiRoutes    = require('./routes/api');
var morgan       = require('morgan');
var cookieParser = require('cookie-parser');
var bodyparser   = require('body-parser');
var session      = require('express-session');
// TODO : SETUP MONGODB FOR COMMENTS BETWEEN USERS
// TODO : SETUP SOCKET SERVER



// =======================
// configuration =========
// =======================

app.set('jwt-secret', config.jwt.secret); // secret variable
app.set('port', port);

// allow cross origin requests
app.all("*", function (req, res, next) {
    res.header("Access-Control-Allow-Credentials", "true");
    res.header("Access-Control-Allow-Origin", "http://localhost:3000");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.header("Access-Control-Allow-Methods", "GET, PUT, POST");
    return next();
});
// use body parser so we can get info from POST and/or URL parameters
app.use(morgan('dev'));
app.use(cookieParser());
app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json());

//required for passport
app.use(session({ secret: config.passport.secret })); // session secret
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
