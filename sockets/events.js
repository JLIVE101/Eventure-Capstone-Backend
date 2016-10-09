

module.exports = function (io) {

  EVENTS_NAMESPACE = '/events/socket';
  var namespace = io.of(EVENTS_NAMESPACE);
  var rooms = [];

  namespace.on('connection', function (socket) {
    
    console.log("socket connected: " + socket.id);



  });

}
