var Bookshelf  = require('../../database').getBookShelf();
Bookshelf.plugin('registry');
var Category   = require('../../models/Category');
var mw         = require('../../helpers/middleware'); //load api middleware function
var Categories = Bookshelf.Collection.extend({
  model: Category
});
var User      = require('../../models/User');
var Event     = require('../../models/Event');
var Events     = Bookshelf.Collection.extend({
  model: Event
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
      .fetch({require: true, withRelated: [{'events': function (qb) {
        if(req.query.start_date && req.query.end_date) {
          qb.where('start_date', '>=', new Date(req.query.start_date))
          .andWhere('start_date', '<=', new Date(req.query.end_date));

          qb.orWhere('end_date', '>', new Date(req.query.end_date))
          .andWhere('start_date', '<', new Date(req.query.start_date));
        } else {
          qb.where('end_date', '>=', new Date());
        }
      }}]})
      .then(function (categories) {
        if(categories && categories.related) {
         return res.json({success: true, data: categories.toJSON()});
       }
       return res.json({success: true, data: []});
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });
    });

    router.route("/interests/categories/events")
    .get(mw.isLoggedIn, function (req, res) {

      User.forge({"id": req.user.id})
      .query(function (qb) {
        return qb.select('id');
      })
      .fetch({ withRelated: [{'categories': function(qb){
          if(req.query.name)
            qb.where('name', 'like', '%' + req.query.name + '%');
        }
      }]})
      .then(function( user ){

        if(!user.related && user.related('categories').length === 0)
          return res.status(500).json({success: false, message: "no categories found for this user, update profile settings"});


        user.related('categories').fetch({withRelated: ['events']})
        .then(function (categories) {

          var c = categories.toJSON();

          //all event ids
          var ids = [];

          for(var i in c) {
            for(var y in c[i].events) {
              ids.push(c[i].events[y].id);
            }
          }


          Events.query(function (qb) {
            qb.where("id", "in", ids);
            if(req.query.start_date && req.query.end_date) {
              qb.where('start_date', '>=', new Date(req.query.start_date))
              .andWhere('start_date', '<=', new Date(req.query.end_date));

              qb.orWhere('end_date', '>', new Date(req.query.end_date))
              .andWhere('start_date', '<', new Date(req.query.start_date));
            } else {
              qb.where('end_date', '>=', new Date());
            }
          })
          .fetch({withRelated: ['users','categories']})
          .then(function (evts) {
            //push event into events array
            if(evts)
              return res.send({success: true, data: evts});

            return res.send({success: true, data: []});
          })
          .catch(function (err) {
            res.status(500).json({success: false, message: err.message});

          });
        })
        .catch(function (err) {
          res.status(500).json({success: false, message: err.message});

        });

    }).catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  });
};
