// server.js

// set up ======================================================================
// get all the tools we need
var express  = require('express');
var MySQL = require('mysql');
var passport = require('passport');
var app      = express();
var port     = process.env.PORT || 8000;
var flash    = require('connect-flash');
// Load the bcrypt module
var bcrypt = require('bcrypt');
var morgan       = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser   = require('body-parser');
var session      = require('express-session');

//var configDB = require('./config/database.js');
var connection = MySQL.createConnection({
     host: '127.0.0.1',
     user: 'root',
     password: '',
     database: 'onet'
});

// configuration ===============================================================
connection.connect();
require('./config/passport')(passport, connection); // pass passport for configuration

// set up our express application
app.use(morgan('dev')); // log every request to the console
app.use(cookieParser()); // read cookies (needed for auth)
//app.use(bodyParser()); // get information from html forms
app.use(bodyParser.urlencoded({
  extended: true
}));
app.set('view engine', 'ejs'); // set up ejs for templating

// required for passport
app.use(session({ secret: 'adherentroutesecret',resave: true,saveUninitialized: true })); // adherent session secret
app.use(session({ secret: 'adminroutesecret',resave: true,saveUninitialized: true })); // admin session secret
//app.use(express.cookieSession({ secret: 'tobo!', maxAge: 360*5 }));
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(flash()); // use connect-flash for flash messages stored in session

// routes ======================================================================
require('./app/routes.js')(app, passport); // load our routes and pass in our app and fully configured passport

// launch ======================================================================
app.listen(port);
console.log('The magic happens on port ' + port);
