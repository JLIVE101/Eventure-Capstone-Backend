var config    = require('./config');
var knex      = require('knex')(config.db);
var bookshelf = require('bookshelf')(knex);
var cascadeDelete = require('bookshelf-cascade-delete');
bookshelf.plugin(cascadeDelete);

//add this in to stop circular dependencies
bookshelf.plugin('registry');

function getBookShelf(){
  return bookshelf;
}
module.exports = {
  getBookShelf: getBookShelf
};
