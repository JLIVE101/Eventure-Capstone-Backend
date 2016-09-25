var config    = require('./config');
var knex      = require('knex')(config.db);
var bookshelf = require('bookshelf')(knex);

//add this in to stop circular dependencies
bookshelf.plugin('registry');

function getBookShelf(){
  return bookshelf;
}
module.exports = {
  getBookShelf: getBookShelf
};
