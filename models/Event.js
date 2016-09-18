var Bookshelf = require('../database').getBookShelf();
var User = require('./User');

var Event = Bookshelf.Model.extend({
  tableName: 'events',

  hasTimestamps: true,

  user: function() {
    return this.belongsTo(User, 'user_id');
  }


});

module.exports = Event;
