var Bookshelf  = require('../../database').getBookShelf();
var Event      = require('../../models/Event');
var mw         = require('../../helpers/middleware');
var dateFormat = require('dateformat');
var Events     = Bookshelf.Collection.extend({
  model: Event
});

module.exports = function(router) {
  //fetch all events
  router.route('/events').get(mw.verifyToken, function(req, res) {
    Events.query(function (qb) {
      if(req.query.name)
        qb.where('name', 'like', '%' + req.query.name + '%');
      if(req.query.description)
        qb.where('html_description', 'like', '%' + req.query.description + '%');
      if(req.query.start_date)
        qb.where(Bookshelf.knex.raw("DATE(start_date) = DATE('" + dateFormat(req.query.start_date.toUTCString(),'yyyy-mm-d') + "')"));
      if(req.query.end_date)
        qb.where(Bookshelf.knex.raw("DATE(end_date) = DATE('" + dateFormat(req.query.end_date.toUTCString(),'yyyy-mm-d') + "')"));
      if(req.query.user_id)
        qb.where('user_id', '=', req.query.user_id);

      //select
    })

    .fetch()
    .then(function (events) {
      console.log(events);
      res.json({error: false, data: events.toJSON()});
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  })
  //create a new event
  .post(mw.verifyToken, function(req, res) {
    //check if any fields are missing
    if(!req.body.name || (!req.body.description || req.body.description.length < 15) || !req.body.start_date || !req.body.end_date)
      return res.send(401,{ error: true, data: {message: "Make sure to fill out all required fields" }});

    Event.forge({
      name            : req.body.name,
      html_description: req.body.description,
      start_date      : req.body.start_date,
      end_date        : req.body.end_date,
      user_id         : req.decoded.id,
    })
      .save()
      .then(function (event) {
        res.send({ error: false, data: { id: event.get('id')}});
      })
      .catch(function (err) {
        res.send(500,{ error: true, data: {message: err.message }});
      });
  });

  router.route('/events/:id')
  //fetch event by id
  .get(function(req, res) {
    Event.forge({
      "id" : req.params.id
    })
    .fetch()
    .then(function (event) {
      res.json({error: false, data: event.toJSON()});
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  })
  //update event by id
  .put(mw.verifyToken, function(req, res) {
    Event.forge({id: req.params.id})
    .fetch({require: true})
    .then(function (event) {
      //if the user isnt the event owner return error
      if(event.get('user_id') !== req.decoded.id)
        return res.json({error: true, data: {message: "You are not the owner of this event"}});
      event.save({
        name            : req.body.name || event.get('name'),
        html_description: req.body.description || event.get('html_description'),
        start_date      : req.body.start_date || event.get('start_date'),
        end_date        : req.body.end_date || event.get('end_date'),
      })
      .then(function () {
        res.json({error: false, data: {message: 'Event updated'}});
      })
      .catch(function (err) {
        res.status(500).json({error: true, data: {message: err.message}});
      });
    })
    .catch(function (err) {
      res.status(500).json({error: true, data: {message: err.message}});
    });
  })
  //delete a event
  .delete(mw.verifyToken, function (req, res) {
    Event.forge({id: req.params.id})
    .fetch({require: true})
    .then(function (event) {
      //if the user isnt the event owner return error
      if(event.get('user_id') !== req.decoded.id)
        return res.json({error: true, data: {message: "You are not the owner of this event"}});
      event.destroy()
      .then(function () {
        res.json({error: true, data: {message: 'Event successfully deleted'}});
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
