var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  //res.send('用户中心');
  res.render('user', {title: '用户中心'});
});

module.exports = router;
