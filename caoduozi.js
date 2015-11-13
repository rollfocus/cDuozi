
var app = require('./app.js');

// create a server and start
var server = require('http').createServer(app);
server.listen(8000);
console.log('you can visit caoduozi in http://127.0.0.1:8000/');
