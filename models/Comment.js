var Bookshelf = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var Event     = require('./Event');
var User      = require('./User');

var Comment =  Bookshelf.Model.extend({
  "tableName": 'comments',

  users: function() {
    return this.belongs('User');
  },

  events: function() {
    return this.belongsTo('Event');
  },

   hasTimestamps: true,
});

module.exports = Bookshelf.model('Comment', Comment);
