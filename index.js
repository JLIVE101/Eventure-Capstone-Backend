var express = require('express');
var bodyparser = require('body-parser');

var app = express();
var connection = require('./connection');
var routes = require('./routes/index');



app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json());

//connect to database
connection.init();

//setup routes for app
app.use('/api/v1', routes);

var server = app.listen(9000, function(){
  console.log('API Server listening on port ' + server.address().port);
});
