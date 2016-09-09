var Event = require('../models/Events');

module.exports = function(router) {
  router.get('/events/', function(req, res) {
    Event.get(res);
  });

  router.get('/events/:id', function(req, res) {
    Event.getById(req.params.id,res);
  });

  router.post('/events/', function(req, res) {
    Event.create(req.body, res);
  });

  router.put('/events/', function(req, res) {
    Event.update(req.body, res);
  });

  router.delete('/events/:id/', function(req, res) {
    Event.delete(req.params.id, res);
  });
};
