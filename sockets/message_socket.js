module.exports = function (io) {

  EVENTS_NAMESPACE = 'messages';
  var namespace = io.of(EVENTS_NAMESPACE);
  var rooms = [];

  namespace.on('connection', function (socket) {


    socket.emit('hello', 'hello user');

  });
}
