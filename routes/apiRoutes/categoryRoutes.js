var Bookshelf  = require('../../database').getBookShelf();
var Category   = require('../../models/Category');
var mw         = require('../../helpers/middleware'); //load api middleware function
var Categories = Bookshelf.Collection.extend({
  model: Category
});


module.exports = function(router) {

  //fetch all categories
  router.route('/categories').get(mw.verifyToken, function(req, res) {
    Categories.query(function (qb) {
      //if name is sent as a parameter
      if(req.query.name)
        qb.where('name', 'like', '%' + req.query.name + '%');
    })
    .fetch()
    .then(function (collection) {
      res.json({error: false, data: collection.toJSON()});
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  })
  //create a new category
  .post([mw.verifyToken, mw.isAdmin], function(req, res) {
    Category.forge({ name: req.body.name })
      .save()
      .then(function (category) {
        res.send({ error: false, data: { id: category.get('id')}});
      })
      .catch(function (err) {
        res.send(500,{ error: true, data: {message: err.message }});
      });
  });

  //fetch category by id
  router.route('/categories/:id').get(function(req, res) {
    Category.forge({
      "id" : req.params.id
    })
    .fetch()
    .then(function (collection) {
      res.json({error: false, data: collection.toJSON()});
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  })
  //update category
  .put([mw.verifyToken, mw.isAdmin], function(req, res) {
    Category.forge({id: req.params.id})
    .fetch({require: true})
    .then(function (category) {
      category.save({name: req.body.name || category.get('name')})
      .then(function () {
        res.json({error: false, data: {message: 'Category updated'}});
      })
      .catch(function (err) {
        res.status(500).json({error: true, data: {message: err.message}});
      });
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  })
  //delete a category
  .delete([mw.verifyToken, mw.isAdmin], function (req, res) {
    Category.forge({id: req.params.id})
    .fetch({require: true})
    .then(function (category) {
      category.destroy()
      .then(function () {
        res.json({error: true, data: {message: 'Category successfully deleted'}});
      })
      .catch(function (err) {
        res.status(500).json({error: true, data: {message: err.message}});
      });
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  });
};
