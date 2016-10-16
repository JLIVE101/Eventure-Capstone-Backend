var Bookshelf  = require('../../database').getBookShelf();
Bookshelf.plugin('registry');
var Category   = require('../../models/Category');
var mw         = require('../../helpers/middleware'); //load api middleware function
var Categories = Bookshelf.Collection.extend({
  model: Category
});

// TODO : add documentation for all routes for categoryRoutes



module.exports = function(router) {

  //fetch all categories
  router.route('/categories').get( function(req, res) {
    Categories.query(function (qb) {
      //if name is sent as a parameter
      if(req.query.name)
        qb.where('name', 'like', '%' + req.query.name + '%');
    })
    .fetch()
    .then(function (collection) {
      res.json({success: true, data: collection});
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  })
  //create a new category
  .post([mw.isAdmin], function(req, res) {
    Category.forge({ name: req.body.name })
      .save()
      .then(function (category) {
        res.send({ success: true,  id: category.get('id')});
      })
      .catch(function (err) {
        res.send(500,{ success: false, message: err.message });
      });
  });

  //fetch category by id
  router.route('/categories/:id').get(function(req, res) {
    Category.forge({
      "id" : req.params.id
    })
    .fetch()
    .then(function (collection) {
      res.json({success: true, data: collection});
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  })
  //update category
  .put([mw.isAdmin], function(req, res) {
    Category.forge({id: req.params.id})
    .fetch({require: true})
    .then(function (category) {
      category.save({name: req.body.name || category.get('name')})
      .then(function () {
        res.json({success: true, message: 'Category updated'});
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  })
  //delete a category
  .delete([mw.isAdmin], function (req, res) {
    Category.forge({id: req.params.id})
    .fetch({require: true})
    .then(function (category) {
      category.destroy()
      .then(function () {
        res.json({success: false, message: 'Category successfully deleted'});
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  });

  router.route("/categories/:id/events")
    .get(function (req, res) {
      Category.forge({id: req.params.id})
      .fetch({require: true, withRelated: 'events'})
      .then(function (category) {
        if(category.related) {
         return res.json({success: true, data: category.related('events')});
       }
       return res.json({success: true, data: []});
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });
    });
};
