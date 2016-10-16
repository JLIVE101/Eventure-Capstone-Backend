
var Bookshelf  = require('../../database').getBookShelf();
Bookshelf.plugin('registry');
var Event      = require('../../models/Event');
var Rating     = require('../../models/Rating');
var mw         = require('../../helpers/middleware');





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
            res.json({success: true, data: rating.attributes});
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
            res.json({success: true, data: rating.attributes});
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

  //route to unlike an event




};
