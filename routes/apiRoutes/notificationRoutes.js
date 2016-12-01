var Bookshelf     = require('../../database').getBookShelf();
Bookshelf.plugin('registry');
var Notification  = require('../../models/Notifications');
var mw            = require('../../helpers/middleware');
var Notifications = Bookshelf.Collection.extend({
  model: Notification
});





module.exports = function (router) {



  router.route("/notifications")

  .get(mw.isLoggedIn, function (req, res) {

    Notifications.query(function (qb) {
      qb.where('receiver_id', '=', req.user.id);
      qb.where('is_read', '=', '0');
    })
    .fetch()
    .then(function (notifications) {

      return res.send({success: true, data: notifications});
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  })


  .post(mw.isLoggedIn, function (req, res) {
    Notification.forge({
      receiver_id: req.user.id,
      type: req.body.type,
      message: req.body.message,
    })
    .save()
    .then(function () {
      return res.send({success: true, data: "notification saved"});
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });

  })


  router.route("/notifications/mark_read/:id")

  .post(mw.isLoggedIn, function (req, res) {

    Notification.query(function (qb) {
      qb.where('id', '=', req.params.id);
    })
    .fetch({require: true, withRelated: 'receiver'})
    .then(function (notification) {

      if(notification && notification.related && notification.related('receiver').id != req.user.id) {
        res.status(401).json({success: false, message: "You cannot edit this notification"});
      }

      notification.save({
        'is_read': 1
      }).then(function () {
        res.json({success: true, data: 'Notification updated'});
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });

  });


  router.route("/notifications/mark_unread/:id")

  .post(mw.isLoggedIn, function (req, res) {

    Notification.query(function (qb) {
      qb.where('id', '=', req.params.id);
    })
    .fetch({require: true, withRelated: 'user'})
    .then(function (notification) {

      if(notification && notification.related && notification.related('user').id != req.user.id) {
        res.status(401).json({success: false, message: "You cannot edit this notification"});
      }

      notification.save({
        'is_read': 0
      }).then(function () {
        res.json({success: true, data: 'Notification updated'});
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });

  });








};
