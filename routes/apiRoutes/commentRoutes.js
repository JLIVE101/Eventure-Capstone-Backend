var Bookshelf = require('../../database').getBookShelf();
Bookshelf.plugin('registry');
var Comment   = require('../../models/Comment');
var mw        = require('../../helpers/middleware');





module.exports = function (router) {

  router.route("/comments/:id")
    //update a comment
    .put(function (req, res, next) {
      Comment.forge({"id" : req.params.id})
      .fetch()
      .then(function (comment) {
        if(comment.get('user_id') !== req.user.id)
          return res.status(500).json({success: false, message: "You cannot edit this comment"});

        comment.save({
          html_comment: req.body.comment
        })
        .then(function (comment) {
          return res.json({success: true, data: comment});
        })
        .catch(function (err) {
          res.status(500).json({success: false, message: err.message});
        });
      });
    })
    //delete a comment
    .delete(function (req, res, next) {
      Comment.forge({id: req.params.id})
      .fetch({require: true})
      .then(function (comment) {
        //if the user isnt the event owner return error
        if(comment.get('user_id') !== req.user.id)
          return res.json({success: false, data: "You cannot delete this comment"});

        comment.destroy().then(function () {
          res.json({success: true, data: 'Comment deleted'});
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
