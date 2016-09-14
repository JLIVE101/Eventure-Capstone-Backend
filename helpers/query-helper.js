var connection = require('../connection');

module.exports = {
  get: function(res) {
    var tablename = this.tableName;
    connection.acquire(function(err, con) {
      con.query('select * from ' + tablename, function(err, result) {
        con.release();
        res.send(result);
      });
    });
  },

  getById: function(id,res) {
    var tablename = this.tableName;
    connection.acquire(function(err, con) {
      con.query('select * from ' + tablename + ' where id = ?', [id], function(err, result) {
        con.release();
        res.send(result);
      });
    });
  },

  create: function(model, res) {
    var tablename = this.tableName;
    connection.acquire(function(err, con) {
      con.query('insert into ' + tablename + ' set ?', model, function(err, result) {
        con.release();
        if (err) {
          res.send({status: 1, message: 'TODO creation failed'});
        } else {
          res.send({status: 0, message: 'TODO created successfully'});
        }
      });
    });
  },

  update: function(model, res) {
    var tablename = this.tableName;
    connection.acquire(function(err, con) {
      con.query('update ' + tablename + ' set ? where id = ?', [model, model.id], function(err, result) {
        con.release();
        if (err) {
          res.send({status: 1, message: 'TODO update failed'});
        } else {
          res.send({status: 0, message: 'TODO updated successfully'});
        }
      });
    });
  },

  delete: function(id, res) {
    connection.acquire(function(err, con) {
      con.query('delete from ' + this.tablename + ' where id = ?', [id], function(err, result) {
        con.release();
        if (err) {
          res.send({status: 1, message: 'Failed to delete'});
        } else {
          res.send({status: 0, message: 'Deleted successfully'});
        }
      });
    });
  },
};
