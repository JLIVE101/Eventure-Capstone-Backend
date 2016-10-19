var Bookshelf  = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var Event      = require('../models/Event');

module.exports = function (io) {

  EVENTS_NAMESPACE = '';
  var namespace = io.of(EVENTS_NAMESPACE);
  var rooms = [];

  namespace.on('connection', function (socket) {

    console.log("socket connected: " + socket.id);

    //when a user creates an event
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

    //when a user likes / dislikes an event ON EVENT DETAILS PAGE
    socket.on('edUpdateLikesDislikesRequest', function () {
      socket.broadcast.emit("updateLikesDislikes","");
    });

    //when a user joins / leaves an event ON EVENT DETAILS PAGE
    socket.on('edUpdateAttendeesRequest', function () {
      socket.broadcast.emit("updateAttendees","");
    });


  });

}
