var Bookshelf = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var Event     = require('./Event');
var User      = require('./User');


var Rating =  Bookshelf.Model.extend({
  "tableName": 'ratings',

  users: function() {
    return this.belongs('User');
  },

  events: function() {
    return this.belongsTo('Event');
  },

});

module.exports = Bookshelf.model('Rating', Rating);
