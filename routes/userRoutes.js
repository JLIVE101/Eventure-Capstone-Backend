var User = require('../Controllers/UserController');

module.exports = function(router) {
  router.get('/users/', function(req, res) {
    User.get(res);
  });
  router.get('/users/:id', function(req, res) {
    User.getById(req.params.id,res);
  });

  router.get('/users/getCategories/:id/', function(req, res) {
    User.getUserCategories(req.params.id, res);
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
};
