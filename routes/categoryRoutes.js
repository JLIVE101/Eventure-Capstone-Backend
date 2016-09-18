var Bookshelf  = require('../database').getBookShelf();
var Category   = require('../models/Category');
var _ = require('lodash');
var Categories = Bookshelf.Collection.extend({
  model: Category
});

module.exports = function(router) {

  //fetch all categories
  router.get('/categories/', function(req, res) {
    Categories.forge()
    .fetch()
    .then(function (collection) {
      res.json({error: false, data: collection.toJSON()});
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  });

  //fetch specific category
  router.get('/categories/:id', function(req, res) {
    Category.forge({"id" : req.params.id})
    .fetch()
    .then(function (collection) {
      res.json({error: false, data: collection.toJSON()});
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  });
  /*

  router.post('/categories/', function(req, res) {
    Category.create(req.body, res);
  });

  router.put('/categories/', function(req, res) {
    Category.update(req.body, res);
  });

  router.delete('/categories/:id/', function(req, res) {
    Category.delete(req.params.id, res);
  }); */
};
