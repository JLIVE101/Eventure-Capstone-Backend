var multiparty           = require('connect-multiparty');
var multiPartyMiddleware = multiparty();
var mw                   = require('../../helpers/middleware');
var uuid                 = require('node-uuid');
var path                 = require('path');
var fs                   = require('fs');



module.exports = function (router) {


  router.post('/uploads/event/picture', multiPartyMiddleware,  function (req, res) {

    var file = req.files.file;

    if(file) {

      //generate new file name
      var newFileName = uuid.v4() + "." + file.name.split(".")[1];
      //generate new path to file name
      var newPath = path.join(__dirname,"..","..","uploads","events",newFileName);

      fs.readFile(file.path, function (err, data) {

        fs.writeFile(newPath, data, function (err) {
          if(err)
            return res.status(500).json({success: false, message: err.message});

          return res.json({success: true, data: "http://localhost:9000/uploads/events/" + newFileName});
        });
      });

    }

  });

  router.post('/uploads/profile/picture', multiPartyMiddleware,  function (req, res) {

    var file = req.files.file;

    if(file) {

      //generate new file name
      var newFileName = uuid.v4() + "." + file.name.split(".")[1];
      //generate new path to file name
      var newPath = path.join(__dirname,"..","..","uploads","users",newFileName);

      fs.readFile(file.path, function (err, data) {
        if(err)
          return res.status(500).json({success: false, message: err.message});

        fs.writeFile(newPath, data, function (err) {
          if(err)
            return res.status(500).json({success: false, message: err.message});

          return res.json({success: true, data: "http://localhost:9000/uploads/users/" + newFileName});
        });
      });
    }
  });


}
