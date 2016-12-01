var Bookshelf = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var User      = require('./User');
var Event     = require('./Event');


var Notification =  Bookshelf.Model.extend({
  "tableName": 'notifications',

  receiver: function() {
    return this.belongsTo('User', 'receiver_id');
  },

  sender: function () {
    return this.belongsTo('User', 'sender_id');
  },

  event: function () {
    return this.belongsTo('Event', 'event_id');
  },

  hasTimestamps: true,
});

module.exports = Bookshelf.model('Notification', Notification);
