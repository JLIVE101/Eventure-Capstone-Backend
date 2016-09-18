// ========================
// get the packages we need
// ========================

var express    = require('express');
var bodyparser = require('body-parser');
var app        = express();
var config     = require('./config');
var knex       = require('knex')(config);
var BookShelf  = require('bookshelf')(knex);
var Routes     = require('./routes/index');






// =======================
// configuration =========
// =======================
var port = process.env.PORT || 9000; // used to create, sign, and verify tokens
connection.init(); // connect to database
app.set('superSecret', config.secret); // secret variable

// use body parser so we can get info from POST and/or URL parameters
app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json());




// ========================
// setup routes for app ===
// ========================
/*
app.get('/', function(req, res) {
    res.send('Hello! The API is at http://localhost:' + port + '/api');
});
app.use('/api/v1', routes);
*/

var server = app.listen(9000, function(){
  console.log('API Server listening on port ' + server.address().port);
});
