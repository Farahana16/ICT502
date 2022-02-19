var express = require('express');
var app = express();
var mysql = require('mysql');

//dab connection
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "takatry"
});

//first page of system
var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));

app.get('/', function (req, res) {
    res.sendFile('index.html', { root:__dirname });
});

//for read css
app.use(express.static(__dirname));

//for login
app.post('/submit-data', function (req, res) {
    var username = req.body.username;
    var pass = req.body.pass;

    var sql = 'SELECT * FROM customers WHERE custUsername = ? OR custPwd = ?';
    con.query(sql, [username, pass], function (err, result) {
    if (err) throw err;
        res.sendFile('sucessfullylogin.html', { root:__dirname });
    });

});


//for signup
app.post('/signup', function (req, res) {
    var username = req.body.username;
    var phoneNumber= req.body.phoneNumber;
    var email = req.body.email;
    var pass = req.body.pass;

    con.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
        var sql = "INSERT into customers(custPwd, custPhoneNum, custEmail, custUsername) values('"+pass+"','"+phoneNumber+"','"+email+"','"+username+"')";
        con.query(sql, function (err, result) {
          if (err) throw err;
          res.sendFile('index.html', { root:__dirname });
        });
      });

    
});

//port or server
var server = app.listen(8085, function () {
    console.log('Node server is running..');
});
