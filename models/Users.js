var queryHelper = require('../helpers/query-helper');


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

}

module.exports = new User();
