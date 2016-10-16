var Bookshelf = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var Event     = require('./Event');
var User      = require('./User');


var Rating =  Bookshelf.Model.extend({
  "tableName": 'ratings',

  user: function() {
    return this.belongs('User');
  },

  event: function() {
    return this.belongsTo('Event');
  },

});

module.exports = Bookshelf.model('Rating', Rating);
