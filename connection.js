
var DATABASE_NAME = 'eventure';
var HOST = '127.0.0.1';
var USER = 'root';
var PASSWORD = '';

var mysql = require('mysql');

function Connection() {
  this.pool = null;

  this.init = function() {
    this.pool = mysql.createPool({
      connectionLimit: 10,
      host: HOST,
      user: USER,
      password: PASSWORD,
      database: DATABASE_NAME
    });
  };

  this.acquire = function(callback) {
    this.pool.getConnection(function(err, connection) {
      callback(err, connection);
    });
  };
}

module.exports = new Connection();
