// ========================
// get the packages we need
// ========================

var express    = require('express');
var bodyparser = require('body-parser');
var app        = express();
var config     = require('./config');
var routes     = require('./routes/index');

// =======================
// configuration =========
// =======================
app.set('superSecret', config.secret); // secret variable

// use body parser so we can get info from POST and/or URL parameters
app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json());

// ========================
// setup routes for app ===
// ========================

app.get('/', function(req, res) {
    res.send('Hello! The API is at http://localhost:' + port + '/api');
});
app.use('/api/v1', routes);


module.exports = app;
