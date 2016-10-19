var multiparty           = require('connect-multiparty');
var multiPartyMiddleware = multiparty();
var mw                   = require('../../helpers/middleware');
var uuid                 = require('node-uuid');
var path                 = require('path');
var fs                   = require('fs');
EVENT_UPLOADS_PATH       = path.join(__dirname,"..","..","uploads","events");
PROFILE_PIC_UPLOADS_PATH = path.join(__dirname,"..","..","uploads","users");



module.exports = function (router) {


  router.post('/uploads/event/picture', multiPartyMiddleware,  function (req, res) {

    var file = req.files.file;

    if(file) {

      //generate new file name
      var newFileName = uuid.v4() + "." + file.name.split(".")[1];
      //generate new path to file name
      var newPath = path.join(EVENT_UPLOADS_PATH,newFileName);

      fs.readFile(file.path, function (err, data) {

        fs.writeFile(newPath, data, function (err) {
          if(err)
            return res.status(500).json({success: false, message: err.message});

          return res.json({success: true, data: "http://localhost:9000/uploads/events/" + newFileName});
        });
      });

    }

  });

  router.post('/uploads/profile/picture', multiPartyMiddleware, mw.isLoggedIn,  function (req, res) {

    var file = req.files.file;

    //current profile picture path
    var profile_pic_path = req.body.profile_pic_path;

    if(profile_pic_path) {
      //delete old profile pic
      var obj = profile_pic_path.split("/");
      var old_file_name = obj[obj.length - 1]; //store filename of old picture
      var old_file_path = path.join(PROFILE_PIC_UPLOADS_PATH, old_file_name);


      //check if file exists
      fs.stat(old_file_path, function (err, stats) {

        if(err) {
          return res.status(500).json({success: false, message: err.message});
        }
        //delete file
        fs.unlink(old_file_path, function (err) {
          if(err) {
            return res.status(500).json({success: false, message: err.message});
          }
        });
      });

    }


    if(file) {

      //generate new file name
      var newFileName = uuid.v4() + "." + file.name.split(".")[1];
      //generate new path to file name
      var newPath = path.join(PROFILE_PIC_UPLOADS_PATH, newFileName);

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
