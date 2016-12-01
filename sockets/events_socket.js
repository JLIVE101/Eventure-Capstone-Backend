var Bookshelf     = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var Event         = require('../models/Event');
var Notification = require('../models/Notifications');

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
      console.log("hi");
      socket.broadcast.emit("updateLikesDislikes","");
    });


    //when a user joins / leaves an event ON EVENT DETAILS PAGE
    socket.on('edUpdateAttendeesRequest', function () {
      console.log("hi");
      socket.broadcast.emit("updateAttendees","");
    });

    //when a user logs in then they join a room based on their id
    socket.on('join', function (id) {
      socket.join(id);
    });

    //when a user joins an event
    socket.on('event joined', function (data) {


      //check to see if the user already liked this event
      Notification.forge({
        event_id: data.event_id,
        type: 'event_joined',
        sender_id: data.senderId,
      })
      .fetch()
      .then(function (n) {

        //if notification exists, that means the user already liked this event, so in order to get rid of duplicates just update the current record
        if(n) {
          n.save({
            'is_read': 0
          })
          .then(function () {
            namespace.in(data.receiverId).emit('notify');
          });
        }
        //notification doesnt exist so create a new one
        else {
          Notification.forge({
            receiver_id: data.receiverId,
            sender_id:  data.senderId,
            event_id: data.event_id,
            type: 'event_joined',
            message: "<a href='/organizerProfile/"+data.senderId+"'>"+data.name+"</a> has joined your event <a href='/eventDetails/"+data.event_id+"'>"+data.event_name+"</a>",
          })
          .save()
          .then(function () {
            namespace.in(data.receiverId).emit('notify');
          });
        }

      });

    });


    //when a user likes an event
    socket.on('event liked', function (data) {

      //if the sender and receiver are the same return
      if(data.senderId == data.receiverId)
        return;

      //check to see if the user already liked this event
      Notification.forge({
        event_id: data.event_id,
        type: 'event_liked',
        sender_id: data.senderId,
      })
      .fetch()
      .then(function (n) {

        //if notification exists, that means the user already liked this event, so in order to get rid of duplicates just update the current record
        if(n) {
          n.save({
            'is_read': 0
          })
          .then(function () {
            namespace.in(data.receiverId).emit('notify');
          });
        }
        //notification doesnt exist so create a new one
        else {
          Notification.forge({
            receiver_id: data.receiverId,
            sender_id:  data.senderId,
            type: 'event_liked',
            event_id: data.event_id,
            message: "<a href='/organizerProfile/"+data.senderId+"'>"+data.name+"</a> has liked your event, <a href='/eventDetails/"+data.event_id+"'>"+data.event_name+"</a>",
          })
          .save()
          .then(function () {
            namespace.in(data.receiverId).emit('notify');
          });
        }

      })


    });

    socket.on('event edited', function (data) {
      Notification.forge({
        receiver_id: data.receiverId,
        sender_id:  data.senderId,
        type: 'event_edited',
        event_id: data.event_id,
        message: "An event you joined has been updated. Check <a href='/eventDetails/"+data.event_id+"'>"+data.event_name+"</a> for changes",
      })
      .save()
      .then(function () {
        namespace.in(data.receiverId).emit('notify');
      });

    });

    socket.on('event deleted', function (data) {
      Notification.forge({
        receiver_id: data.receiverId,
        sender_id:  data.senderId,
        type: 'event_deleted',
        event_id: data.event_id,
        message: "The event '"+data.event_name+"' you joined has been deleted. by the <a href='/organizerProfile/"+data.senderId+"'>Owner</a>",
      })
      .save()
      .then(function () {
        namespace.in(data.receiverId).emit('notify');
      });

    });


  });

}
