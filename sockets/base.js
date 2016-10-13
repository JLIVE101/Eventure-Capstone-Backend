var events = require('./events_socket');
var messages = require('./message_socket');



module.exports = function (io) {

  events(io);
  messages(io);

};
