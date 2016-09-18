
var Bookshelf = require('../database').getBookShelf();
var Event = require('./Event');

var User = Bookshelf.Model.extend({
  tableName: 'users',

  hasTimestamps: true,

  events: function() {
    return this.belongsToMany(Event, 'users_events', 'user_id', 'event_id');
  }




});

module.exports = User;
