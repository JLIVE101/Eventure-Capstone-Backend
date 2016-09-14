var queryHelper = require('../helpers/query-helper');

var connection = require('../connection');


function User() {

  this.tableName = 'users';

  //METHOD FOR GETTING ALL USERS
  this.get = queryHelper.get;

  //METHOD FOR GETTING USER BY ID
  this.getById = queryHelper.getById;

  //METHOD FOR CREATING A USER
  this.create = queryHelper.create;

  //METHOD FOR UPDATING A USER
  this.update = queryHelper.update;

  //METHOD FOR DELETING A USER
  this.delete = queryHelper.delete;

  //METHOD FOR GETTING A USERS PREFERRED CATEGORIES
  this.getUserCategories = function(id,res) {
    connection.acquire(function(err, con) {
      var query = 'select c.id as category_id,c.category_name from user_categories uc inner join categories c ON(uc.category_id = c.id) where uc.user_id = ?';

      con.query(query, [id], function(err, result) {
        con.release();
        res.send(result);
      });
    });
  };

}

module.exports = new User();
