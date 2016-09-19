var Bookshelf = require('../../database').getBookShelf();
var User      = require('../../models/User');
var mw     = require('../../helpers/middleware');
var Users     = Bookshelf.Collection.extend({
  model: User
});

module.exports = function(router) {

  //get all users
  router.get('/users/', [mw.verifyToken, mw.isAdmin], function(req, res) {
    Users.forge()
    .fetch()
    .then(function (collection) {
      res.json({error: false, data: collection.toJSON()});
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  });

  //get user by id
  router.get('/users/:id', function(req, res) {
    User.forge({"id" : req.params.id})
    .fetch()
    .then(function (user) {
      res.json({error: false, data: user });
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  });

};
