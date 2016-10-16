var Bookshelf = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var User      = require('./User');
var Event     = require('./Event');

var Category = Bookshelf.Model.extend({
  "tableName": 'categories',

  users: function() {
    return this.belongsToMany('User', 'users_categories', 'category_id', 'user_id');
  },

  events: function() {
    return this.belongsToMany('Event', 'events_categories', 'category_id', 'event_id');
  },
});


module.exports = Bookshelf.model('Category', Category);
