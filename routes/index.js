var express = require('express');
var router = express.Router();
var User = require('../models/Users');

console.log(User);



//require('./userRoutes')(router);

router.get('/users/', function(req, res) {
  User.get(res);
});
router.get('/users/:user_id', function(req, res) {
  User.getById(req.params.user_id,res);
});

router.post('/users/', function(req, res) {
  User.create(req.body, res);
});

router.put('/users/', function(req, res) {
  User.update(req.body, res);
});

router.delete('/users/:id/', function(req, res) {
  User.delete(req.params.id, res);
});




module.exports = router;
