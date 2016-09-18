var Category = require('../Controllers/CategoryController');

module.exports = function(router) {
  router.get('/categories/', function(req, res) {
    Category.get(res);
  });
  router.get('/categories/:id', function(req, res) {
    Category.getById(req.params.id,res);
  });

  router.post('/categories/', function(req, res) {
    Category.create(req.body, res);
  });

  router.put('/categories/', function(req, res) {
    Category.update(req.body, res);
  });

  router.delete('/categories/:id/', function(req, res) {
    Category.delete(req.params.id, res);
  });
};
