var Bookshelf = require('../../database').getBookShelf();
Bookshelf.plugin('registry');
var User      = require('../../models/User');
var Event  = require('../../models/Event');
var Category  = require('../../models/Category');
var Categories = Bookshelf.Collection.extend({
  model: Category
});
var mw        = require('../../helpers/middleware');
var Users     = Bookshelf.Collection.extend({
  model: User
});

// TODO : add documentation for all routes for userRoutes


module.exports = function(router) {

  //get all users
  router.route('/users')
  .get([mw.isAdmin], function(req, res) {
    Users.forge()
    .fetch()
    .then(function (users) {
      res.json({success: true, data: users});
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  });

  //get user by id
  router.route('/users/:id')
  .get(function(req, res) {
    User.forge({"id" : req.params.id})
    .fetch({withRelated: ['createdEvents','joinedEvents','categories','friends','comments']})
    .then(function (user) {
      //if user not found
      if(!user)
        return res.status(404).json({success:false, message: "User not found for id: " + req.params.id});


      //convert user into JSON
      var newUser = user;

      //delete these attributes
      delete newUser.password;
      delete newUser.admin;


      res.json({success: true, data: newUser });
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  })

  //update a user
  .put([mw.verifyUser], function (req, res) {


    User.forge({id: req.params.id})
      .fetch({require: true})



      .then(function (user) {
        user.save({
          gender              : req.body.gender || user.get('gender'),
          date_of_birth       : (req.body.date_of_birth) ? new Date(req.body.date_of_birth) : user.get('date_of_birth'),
          email               : req.body.email || user.get('email'),
          username            : req.body.username || user.get('username'),
          first_name          : req.body.first_name || user.get('first_name'),
          last_name           : req.body.last_name || user.get('last_name'),
          phone_number        : req.body.phone_number || user.get('phone_number'),
          facebook_id         : req.body.facebook_id || user.get('facebook_id'),
          facebook_token      : req.body.facebook_token || user.get('facebook_token'),
          facebook_name       : req.body.facebook_name || user.get('facebook_name'),
          facebook_email      : req.body.facebook_email || user.get('facebook_email'),
          twitter_id          : req.body.twitter_id || user.get('twitter_id'),
          twitter_token       : req.body.twitter_token || user.get('twitter_token'),
          twitter_username    : req.body.twitter_username || user.get('twitter_username'),
          twitter_displayName : req.body.twitter_displayName || user.get('twitter_displayName'),
          google_id           : req.body.google_id || user.get('google_id'),
          google_token        : req.body.google_token || user.get('google_token'),
          google_name         : req.body.google_name || user.get('google_name'),
          google_email        : req.body.google_email || user.get('google_email'),
          profile_pic_url     : req.body.profile_pic_url || user.get('profile_pic_url'),
          primary_account     : req.body.primary_account || user.get('primary_account'),
        })
        .then(function (u) {

          console.log(u);
          res.json({success: true, data: "User updated"});



        })
        .catch(function (err) {
          res.status(500).json({success: false, message: err.message});
        });
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });
  })
  //delete user
  .delete([mw.verifyUser], function (req, res) {
    User.forge({id: req.params.id})
    .fetch({require: true})
    .then(function (user) {
      user.destroy()
      .then(function () {
        res.json({success: true, data: 'Event successfully deleted'});
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  });


  //get users categories
  router.route('/users/:id/categories')
  .get( function (req, res) {
    User.forge({"id":  req.params.id})
    .query(function (qb) {
      return qb.select('id');
    })
    .fetch({ withRelated: [{'categories': function(qb){
        if(req.query.name)
          qb.where('name', 'like', '%' + req.query.name + '%');
      }
    }]})
    .then(function( user ){
      //if user doesnt exist
      if(!user)
        return res.send({success: false, message: "No user found with id " + req.params.id});
      //if user has no created events
      if(!user.related)
        return res.send({success: true, data: []});

      res.json({success: true, data: user.related('categories')});
    })
    .catch(function(err){
      res.status(500).json({success: false, message: err.message});
    });
  })
  //add favorited categories to specified user
  .post(function (req, res) {
    //if no categories are found in the request body
    if(!req.body.categories)
      return res.status(404).json({success: false, message: "Cannot find categories object"});


    User.forge({id: req.params.id})
      .fetch({withRelated: ['categories']})
      .then(function (user) {
        //if no user found
        if(!user)
          return res.status(404).json({success: false, message: "User not found"});




        if(req.body.categories && req.body.categories.length > 0) {
          //delete all user categories
          user.categories().detach();
          //and then add categories to list
          user.save().then(function (user) {

            user.categories().attach(req.body.categories);
            return res.json({success: true, data: "Saved categories!!"});
          })
          .catch(function(err){
            res.status(500).json({success: false, message: err.message});
          });
        } else {
          //delete all user categories
          user.categories().detach();
          user.save().then(function (user) {
            return res.json({success: true, data: "Cleared your categories"});
          })
          .catch(function(err){
            res.status(500).json({success: false, message: err.message});
          });
        }
      })
      .catch(function(err){
        res.status(500).json({success: false, message: err.message});
      });
  });

  //get user events
  router.route('/users/:id/createdEvents')
  .get( function (req, res) {
    Event.query(function (qb) {
      qb.where("user_id" , req.params.id);
      if(req.query.eventNotEqual)
        qb.where('id','!=', req.query.eventNotEqual);
    })
    .fetchAll({ withRelated: [{'users' : function (qb) {
        qb.select('user_id','event_id');
      }},'categories']})
    .then(function( events ){
      //if user doesnt exist
      if(!events || events.length === 0)
        return res.send({success: true, data: []});

      //else return users events
      res.json({success: true, data: events });
    })
    .catch(function(err){
      res.status(500).json({success: false, message: err.message});
    });
  });

  router.route('/users/:id/joinedEvents')
  .get(function (req, res) {
    User.forge({ "id" : req.params.id })
    .fetch({ withRelated: [{'joinedEvents' : function (qb) {
      if(req.query.name)
        qb.where('name', 'like', '%' + req.query.name + '%');
      }}]
    })
    .then(function( user ){
      //if user doesnt exist
      if(!user)
        return res.send({success: false, message: "No user found with id " + req.params.id});
      //if user has no created events
      if(!user.related || user.related('joinedEvents').length === 0)
        return res.send({success: true, data: []});

      //else return users events
      res.json({success: true, data: user.related('joinedEvents')});
    })
    .catch(function(err){
      res.status(500).json({success: false, message: err.message});
    });
  });


  router.route('/user/checkUsername')
    .get(function (req, res) {


      User.query(function (qb) {
        qb.where({"username" : req.query.username});
      })
      .fetch()
      .then(function (user) {
        console.log(user);
        //if a user is found with that username then return false
        if(user)
          return res.send(true);
        //else return true
        return res.send(false);
      })
      .catch(function(err){
        res.json({success: false, message: err.message});
      });

    });



};
