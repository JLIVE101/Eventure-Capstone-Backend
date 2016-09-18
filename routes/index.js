var express = require('express');
var router = express.Router();
var bcrypt = require('bcryptjs');

/*
//authenticate a user
router.post('/authenticate', function(req,res,next){
  res.json({api_key: ''});
});

//creating a new api user
router.post('/newUser', function(req,res,next){

  var params = req.body;

  // Create a password salt
  var salt = bcrypt.genSaltSync(10);
  // Salt and hash password
  var passwordToSave = bcrypt.hashSync(params.password, salt);


}); */

//ROUTES FOR ALL MODELS
//require('./userRoutes')(router);
//require('./eventRoutes')(router);
require('./categoryRoutes')(router);







module.exports = router;
