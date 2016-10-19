var Bookshelf  = require('../../database').getBookShelf();
Bookshelf.plugin('registry');
var bcrypt     = require('bcrypt-nodejs');
var Event      = require('../../models/Event');
var User       = require('../../models/User');
var Comment    = require('../../models/Comment');
var mw         = require('../../helpers/middleware');
var Events     = Bookshelf.Collection.extend({
  model: Event
});
var fs         = require('fs');

// TODO : add documentation for all routes for eventRoutes

module.exports = function(router) {

  router.route('/events')

  //fetch all events
  .get(function(req, res) {
    Events.query(function (qb) {
      if(req.query.name)
        qb.where('name', 'like', '%' + req.query.name + '%');
      if(req.query.description)
        qb.where('html_description', 'like', '%' + req.query.description + '%');
      if(req.query.user_id)
        qb.where('user_id', '=', req.query.user_id);
      if(req.query.limitTo)
        qb.limit(req.query.limitTo);
      qb.orderBy('start_date','DESC');
    })
    .fetch({withRelated: [{'categories': function (qb) {
      if(req.query.category_name) {
        qb.where('name', '=', req.query.category_name);
      }

    }},'ratings',{'users': function (qb) {
       qb.select('user_id','event_id');
    }},{'owner': function (qb) {
      qb.select('username', 'facebook_name','twitter_displayName','google_name');
    }}]})
    .then(function (events) {

      //if there are no events
      if(!events)
        return res.json({success: true, data: []});



      res.json({success: true, data: events});
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  })



  //create a new event
  .post([mw.isLoggedIn], function(req, res) {
    console.log(req.files);
    console.log("categories are: " + req.body.categories);
    console.log(req.body);
    //check if any fields are missing
    if(!req.body.name || (!req.body.description || req.body.description.length < 15) || !req.body.start_date || !req.body.end_date)
      return res.status(500).json({ success: false, message: "Missing some fields" });


    //get file and save it and store pathName to variable
    /*fs.readFile(req.files.eventImage.path, function (err, data) {
      // ...
      var newPath = "../../uploads/" + eventImage.name;
      fs.writeFile(newPath, data, function (err) {
        return res.send("filename is:" + eventImage.name);
      });
    });

    return;*/

    Event.forge({
      name            : req.body.name,
      html_description: req.body.description,
      start_date      : new Date(req.body.start_date),
      end_date        : new Date(req.body.end_date),
      user_id         : req.user.id || req.decoded.id,
      latitude        : req.body.latitude || "",
      longitude       : req.body.longitude || "",
      private         : req.body.private || false,
      password        : (req.body.password) ? bcrypt.hashSync(req.body.password, bcrypt.genSaltSync(10), null) : null,
      picture_url     : req.body.picture_url || null,
      address         : req.body.address || null,
      saved           : req.body.saved || false,
    })
      .save()
      .then(function (event) {

        //if the user added categories for this event insert records
        if(req.body.categories)
          event.categories().attach(req.body.categories);

        return res.json({ success: true, data: { id: event.get('id')}});
      })
      .catch(function (err) {
        res.status(500).json({ success: false, message: err.message });
      });
  });


  router.route('/events/:id')



  //get specific event by id
  .get(function(req, res) {
    Event.forge({
      "id" : req.params.id
    })
    .fetch({withRelated: [{'users': function (qb) {
      return qb.select('user_id','event_id');
    }},{'owner': function (qb) {
      qb.select('id');
    }}, {'ratings': function (qb) {
      qb.where('event_id','=',req.params.id);
    }},'categories','comments']})
    .then(function (event) {
      res.json({success: true, data: event});
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  })



  //update event by id
  .put([mw.isLoggedIn], function(req, res) {
    Event.forge({id: req.params.id})
    .fetch({require: true})
    .then(function (event) {
      //if the user isnt the event owner return error
      if(event.get('user_id') !== req.user.id)
        return res.json({success: false, data: "You are not the owner of this event"});

      event.save({
        name            : req.body.name || event.get('name'),
        html_description: req.body.description || event.get('html_description'),
        start_date      : req.body.start_date || event.get('start_date'),
        end_date        : req.body.end_date || event.get('end_date'),
        password        : (req.body.password) ? bcrypt.hashSync(req.body.password, bcrypt.genSaltSync(10), null) : event.get('password'),
        picture_url     : req.body.picture_url || event.get('picture_url'),
        address         : req.body.address || event.get('address'),
        latitude        : req.body.latitude || event.get('latitude'),
        longitude       : req.body.longitude || event.get('longitude'),
        saved           : req.body.saved || event.get('saved'),
        private         : req.body.private || event.get('private'),
      })
      .then(function () {
        res.json({success: true, data: 'Event updated'});
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message});
      });
    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message});
    });
  })




  //delete an event by id
  .delete([mw.isLoggedIn], function (req, res) {
    Event.forge({id: req.params.id})
    .fetch({require: true})
    .then(function (event) {
      //if the user isnt the event owner return error
      if(event.get('user_id') !== req.user.id)
        return res.json({success: false, data: "You are not the owner of this event"});

      event.destroy().then(function () {
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



  router.route('/events/join/:id')



  //join an event
  .post([mw.isLoggedIn], function (req, res) {
    Event.forge({id: req.params.id})
    .fetch({withRelated: [{'users': function (qb) {
      qb.where('user_id', '=', req.user.id);
      qb.select('user_id','event_id');
    }}]})
    .then(function (event) {

      //if event isn't found
      if(!event)
        return res.status(404).json({success: false, message: "Event not found"});

      //if user is the owner of the event
      if(event.get('user_id') == req.user.id)
        return res.status(200).json({success: false, message: "You are the owner of this event"});

      //if user already joined event
      if(event.related && event.related('users').length > 0)
        return res.status(200).json({success: false, message: "You already joined this event"});

      //check if event has password, and if it does check if password is correct
      if((event.get('password') !== null && event.get('password') !== "")) {
        if(!(bcrypt.compareSync(req.body.password || "", event.get('password'))))
          return res.status(200).json({success: false, message: "You've entered the wrong password"});
      }

      //else user hasnt joined this event so add them to event users list
      var eventName = event.get('name');
      event.save().then(function (newEvent) {
        newEvent.users().attach(req.user.id);
        return res.json({success: true, data: 'You joined ' + eventName + '!! '});
      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message || err});
      });

    })
    .catch(function (err) {
      res.status(500).json({success: false, message: err.message || err});
    });
  });




  //leave an event
  router.route('/events/leave/:id')
    .post([mw.isLoggedIn], function (req, res) {
      Event.forge({id: req.params.id})
      .fetch({withRelated: [{'users': function (qb) {
        qb.select('user_id','event_id');
        qb.where('user_id', '=', req.user.id);
      }}]})
      .then(function (event) {

        //if event isn't found
        if(!event)
          return res.status(404).json({success: false, message: "Event not found"});

        //if user is the owner of the event
        if(event.get('user_id') == req.user.id)
          return res.status(500).json({success: false, message: "Owner's can't leave their own event try deleting"});

        //check if user already joined event
        if(event.related && event.related('users').length === 0)
          return res.status(500).json({success: false, message: "You cannot leave an event you haven't joined"});

        //else user hasnt joined this event so add them to event users list
        event.save().then(function (newEvent) {
          newEvent.users().detach(req.user.id);
          return res.json({success: true, data: 'You left ' + event.get('name') + '!! '});
        })
        .catch(function (err) {
          res.status(500).json({success: false, message: err.message || err});
        });

      })
      .catch(function (err) {
        res.status(500).json({success: false, message: err.message || err});
      });
    });




  //add category to event
  router.route('/events/:id/categories/remove')
    .post([mw.isLoggedIn], function (req, res) {
      Event.forge({id: req.params.id})
        .fetch({withRelated: [{'categories': function (qb) {

          qb.where('category_id', '=', req.body.category_id);

        }}]})
        .then(function (event) {

          //if event isn't found
          if(!event)
            return res.status(404).json({success: false, message: "Event not found"});

          //if user is the owner of the event
          if(event.get('user_id') != req.decoded.id)
            return res.status(500).json({success: false, message: "You are not the owner of this event"});

          //if category isn't found for that event
          if(event.related && event.related('categories').length === 0)
            return res.status(500).json({success: false, message: "No Category found for `" + event.get("name") + "`"});

          //else delete the category from intersection table
          event.save().then(function (newEvent) {
            newEvent.categories().detach(req.body.category_id);
            return res.json({success: true, data: "Removed Category from " + newEvent.get('name')});
          })
          .catch(function (err) {
            res.status(500).json({success: false, message: err.message});
          });
        })
        .catch(function (err) {
          res.status(500).json({success: false, message: err.message});
        });
    });




    //add category to event
    router.route('/events/:id/categories/add')
      .post([mw.isLoggedIn], function (req, res) {
        Event.forge({id: req.params.id})
          .fetch({withRelated: [{'categories': function (qb) {

            qb.where('category_id', '=', req.body.category_id);

          }}]})
          .then(function (event) {

            //if event isn't found
            if(!event)
              return res.status(404).json({success: false, message: "Event not found"});

            //if user is the owner of the event
            if(event.get('user_id') != req.decoded.id)
              return res.status(500).json({success: false, message: "You are not the owner of this event"});

            //if selected category is found for that event
            if(event.related && event.related('categories').length > 0)
              return res.status(500).json({success: false, message: "This event already has that category"});

            //else add the category from intersection table
            event.save().then(function (newEvent) {
              newEvent.categories().attach(req.body.category_id);
              return res.json({success: true, data: "Added category to " + event.get('name')});
            })
            .catch(function (err) {
              res.status(500).json({success: false, message: err.message});
            });
          })
          .catch(function (err) {
            res.status(500).json({success: false, message: err.message});
          });
      });

      router.route("/events/:id/comments")



      //get all comments for event
        .get(function (req, res, next) {
          Comment.forge({"event_id" : req.params.id})
          .fetchAll()
          .then(function (comments) {
            res.json({success: true, data: comments});
          })
          .catch(function (err) {
            res.status(500).json({success: false, message: err.message});
          });
        })
        //create comment for event
        .post(function (req, res, next) {
          Comment.forge({
            html_comment: req.body.comment,
            user_id: req.user.id,
            event_id: req.params.id,
            likes: 0
          })
          .save()
          .then(function (comment) {
            res.json({success: true, data: comment});
          })
          .catch(function (err) {
            res.status(500).json({success: false, message: err.message});
          });
        });


        router.route("checkIfJoined/events/:event_id/:user_id")
          .get(function (req, res, next) {

            Event.forge({ id: req.params.event_id })
            .fetch({withRelated: [{'users': function (qb) {
              qb.where('user_id', '=', req.params.user_id);
            }}]})
            .then(function (event) {

              //if event is defined than user joined
              if(event) {
                return res.json({success: true, data: true});
              }
              // else user hasnt joined
              else {
                return res.json({success: true, data: false});
              }
            })
            .catch(function (err) {
              res.status(500).json({success: false, message: err.message});
            })

          });


          //get event categories
          router.route("/event/categories/:id")
            .get(function (req, res) {
              Event.forge({
                "id" : req.params.id
              })
              .fetch({withRelated: 'categories'})
              .then(function (event) {
                if(event.related)
                  res.json({success: true, data: event.related('categories')});
                else
                  res.json({success: true, data: []}); //event has no categories so return empty array
              })
              .catch(function (err) {
                res.status(500).json({success: false, message: err.message});
              });
            });


          //get amount of users attending event
          router.route("/event/users/:id/count")
            .get(function (req, res) {
              Event.forge({"id" : req.params.id})
              .fetch({withRelated: 'users'})
              .then(function (event) {
                if(event.related)
                  return res.json({success: true, data: event.related('users').length});
                else
                  return res.json({success: true, data: 0});
              })
              .catch(function (err) {
                res.status(500).json({success: false, message: err.message});
              });
            });
};
