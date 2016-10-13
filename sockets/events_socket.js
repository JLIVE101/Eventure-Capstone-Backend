var Bookshelf  = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var Event      = require('../models/Event');

module.exports = function (io) {

  EVENTS_NAMESPACE = '';
  var namespace = io.of(EVENTS_NAMESPACE);
  var rooms = [];

  namespace.on('connection', function (socket) {

    console.log("socket connected: " + socket.id);

    var event = "new event";

    socket.emit('hello', 'hello');

    socket.on('createdEvent', function (id) {
      Event.forge({"id": id})
      .fetch()
      .then(function (event) {
        namespace.emit('eventCreated', event);
      })
      .catch(function (err) {
        console.log(err.message);
      })
    });



  });

}
