var config    = require('./config');
var knex      = require('knex')(config.db);
var bookshelf = require('bookshelf')(knex);

function getBookShelf(){
  return bookshelf;
}
module.exports = {
  getBookShelf: getBookShelf
};
