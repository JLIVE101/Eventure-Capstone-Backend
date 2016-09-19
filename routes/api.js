var express = require('express');
var router  = express.Router();
var bcrypt  = require('bcryptjs');
var mw      = require('../helpers/middleware');

//set global api middleware
router.route('/*').all(mw.parseDateFields);


//ROUTES FOR ALL MODELS
require('./apiRoutes/userRoutes')(router);
require('./apiRoutes/eventRoutes')(router);
require('./apiRoutes/categoryRoutes')(router);







module.exports = router;
