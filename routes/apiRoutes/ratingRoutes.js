
var Bookshelf  = require('../../database').getBookShelf();
Bookshelf.plugin('registry');
var Event      = require('../../models/Event');
var Rating     = require('../../models/Rating');
var mw         = require('../../helpers/middleware');
var Ratings    = Bookshelf.Collection.extend({
  model: Rating
});





module.exports = function(router) {

  //route to like an event
  router.route('/rate/event/:id')
    .post([mw.isLoggedIn], function (req, res) {

      Rating.forge({
        "user_id"  : req.user.id,
        "event_id" : req.params.id,
      })
      .fetch({withRelated: 'event'})
      .then(function (rating) {

        //if rating exists but no event
        if(rating && !rating.related && rating.related('event').length < 0)
          return res.json({success: false, message: "event not found."});

        //if rating is found for specified user and event update like column
        if(rating) {
          rating.save({
            "event_id" : req.params.id,
            "user_id"  : req.user.id,
            "like"     : req.body.rating,
            "dislike"  : !req.body.rating
          })
          .then(function (rating) {
            delete rating.related('events');
            res.json({success: true, data: rating.id});
          })
          .catch(function (err) {
            res.status(500).json({success: false, message: err.message});
          });
        }
        else {





          //else rating is not found create a record
          Rating.forge({
            "event_id" : req.params.id,
            "user_id"  : req.user.id,
            "like"     : req.body.rating,
            "dislike"  : !req.body.rating
          }).save()
          .then(function (rating) {
            delete rating.related('events');
            res.json({success: true, data:  rating.id});
          })
          .catch(function (err) {
            res.status(500).json({success: false, message: err.message});
          });
        }
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });



    });

    router.route('/ratings/event/:id/likes')
      .get(function (req, res) {

        Rating.query(function (qb) {
          qb.where('like','=', 1);
          qb.andWhere('event_id','=', req.params.id);
        })
        .count()
        .then(function (count) {
          res.json({success: true, data: count});
        })
        .catch(function (err) {
          res.status(500).json({success: false, message: err.message});
        });

      });

    router.route('/ratings/event/:id/dislikes')
      .get(function (req, res) {

        Ratings.query(function (qb) {
          qb.where('dislike','=', 1);
          qb.andWhere('event_id','=', req.params.id);
        })
        .count()
        .then(function (count) {

          res.json({success: true, data: count});
        })
        .catch(function (err) {
          res.status(500).json({success: false, message: err.message});
        });

      });

};
