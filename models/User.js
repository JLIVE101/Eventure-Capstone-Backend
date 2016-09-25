var Bookshelf = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var Event     = require('./Event');
var Comment   = require('./Comment');
var Category  = require('./Category');

var User = Bookshelf.Model.extend({
  tableName: 'users',

  hasTimestamps: true,

  joinedEvents: function() {
    return this.belongsToMany('Event', 'users_events', 'user_id', 'event_id');
  },

  createdEvents: function () {
    return this.hasMany('Event', 'user_id');
  },

  categories: function() {
    return this.belongsToMany('Category', 'users_categories', 'user_id', 'category_id');
  },

  comments: function() {
    return this.hasMany('Comment', 'user_id');
  },

  ratings: function() {
    return this.hasMany('Rating', 'user_id');
  },

  friends: function() {
    return this.belongsToMany('User', 'users_friends', 'user_id', 'friend_id');
  },

});

module.exports = Bookshelf.model('User', User);
