var express = require('express');
var router = express.Router();


require('./userRoutes')(router);
require('./eventRoutes')(router);
require('./categoryRoutes')(router);







module.exports = router;
