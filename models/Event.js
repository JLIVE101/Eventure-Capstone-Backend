var Bookshelf = require('../database').getBookShelf();
Bookshelf.plugin('registry');
var User      = require('./User');
var Comment   = require('./Comment');
var Category  = require('./Category');
var Rating    = require('./Rating');



var Event = Bookshelf.Model.extend({
  tableName: 'events',

  hasTimestamps: true,

  owner: function() {
    return this.belongsTo('User', 'user_id');
  },

  users: function () {
    return this.belongsToMany('User','users_events','event_id','user_id');
  },

  categories: function () {
    return this.belongsToMany('Category','events_categories','event_id','category_id');
  },

  comments: function() {
    return this.hasMany('Comment', 'event_id');
  },

  ratings: function() {
    return this.hasMany('Rating', 'event_id');
  },

  /*destroy: function () {
    // Call the destroy prototype method.
    Bookshelf.Model.prototype.destroy.apply(this, arguments);
  }*/

},
{
  dependents: ['ratings', 'comments', 'users', 'categories']
});

module.exports = Bookshelf.model('Event', Event);
