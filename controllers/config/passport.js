// config/passport.js
// load all the things we need
var LocalStrategy = require('passport-local').Strategy;
// Load the bcrypt module
var bcrypt = require('bcrypt');
// Generate a salt
// load up the user model
//var User            = require('../app/models/user');

// expose this function to our app using module.exports
module.exports = function(passport, connection) {
    // =========================================================================
    // passport session setup ==================================================
    // =========================================================================
    // required for persistent login sessions
    // passport needs ability to serialize and unserialize users out of session

    // used to serialize the user for the session
    passport.serializeUser(function(user, done) {
      console.log("serialize");
      // console.log(user);
      done(null, user);
    });

    // used to deserialize the user
    passport.deserializeUser(function(user, done) {
      console.log("deserialize");
        var key;
        var id;
        if(user.type=="admin"){
          key = "adminID"
          id = user.adminID;
        }else {
          var key = "adhID";
          var id = user.adhID;

        }
        var q = "select * from " + user.type + " where " + key + " = " + id;
        // console.log(q);
        connection.query(q, function(err, rows) {
          if (rows[0]) {
            rows[0]["type"] = user.type;
            var q="SELECT MAX(I.type) as level FROM internship I ,participation P WHERE I.internshipID = P.internshipID and adhID = '" + rows[0].adhID + "' and validation = 1;";
            console.log(q);
            connection.query(q ,
            function (error, results, fields) {
              if (error) throw error;
              // console.log(results[0].level);
              rows[0]["level"]=results[0].level;
              if(!results[0].level)
                  rows[0]["level"]=0;
              // console.log(rows[0]["level"]);
              return done(null, rows[0]);
            });
          }

        });

    });

    // =========================================================================
    // LOCAL SIGNUP ============================================================
    // =========================================================================
    // we are using named strategies since we have one for login and one for signup
    // by default, if there was no name, it would just be called 'local'

    passport.use('local-signup', new LocalStrategy({
            // by default, local strategy uses username and password, we will override with email
            usernameField: 'email',
            passwordField: 'password',
            passReqToCallback: true // allows us to pass back the entire request to the callback
        },
        function(req, email, password, done) {
          // console.log(email);
            // find a user whose email is the same as the forms email
            // we are checking to see if the user trying to login already exists
            connection.query("select * from adherent where email = '" + email + "' or nationalIDcard = '"+ req.body.nationalIDcard+"'", function(err, rows) {
                // console.log(rows);
                if (err)
                    return done(err);
                if (rows.length) {
                    return done(null, false, req.flash('signupMessage', 'Votre email ou numero CIN existe déja.'));
                } else {
                    // if there is no user with that email
                    if(req.body.cinfile) console.log(cinfile);
                    var firstName = req.body.firstName;
                    var lastName = req.body.lastName;
                    var birthDate = req.body.birthDate;
                    var address = req.body.address;
                    var locOfficeID = req.body.locOfficeID;
                    var nationalIDcard = req.body.nationalIDcard;
                    var gender = req.body.gender;
                    var governorate = req.body.governorate;
                    var tel = req.body.tel;
                    var salt = bcrypt.genSaltSync(10);
                    var hashedPass = bcrypt.hashSync(password, salt);
                    var q = "INSERT INTO adherent (password, firstName, lastName, birthDate, email, address, locOfficeID, nationalIDcard, gender, governorate, tel, paid, legitimate, registration) VALUES ('" + hashedPass + "', '" + firstName + "','" + lastName + "', '" + birthDate + "','" + email + "', '" + address + "','" + locOfficeID + "', '" + nationalIDcard + "', '" + gender + "','" + governorate + "', '" + tel + "','0' ,'0', NOW());";

                    console.log(q);
                    connection.query(q, function(err, rows) {
                        if(err) return done(null, false, req.flash('signupMessage', err.message));
                        var user = req.body;
                        user["type"] = "adherent";
                        user["adhID"] = rows.insertId ;
                        // console.log("registration succeded");
                        return done(null, user);
                    });
                }
            });

        }));
    // =========================================================================
    // LOCAL LOGIN =============================================================
    // =========================================================================
    // we are using named strategies since we have one for login and one for signup
    // by default, if there was no name, it would just be called 'local'

    passport.use('local-login', new LocalStrategy({
            // by default, local strategy uses username and password, we will override with email
            usernameField: 'email',
            passwordField: 'password',
            passReqToCallback: true // allows us to pass back the entire request to the callback
        },
        function(req, email, password, done) { // callback with email and password from our form

            connection.query("SELECT * FROM adherent WHERE email = '" + email + "'", function(err, rows) {
                if (err) return done(err);
                if (!rows.length) {//if not adherent test for admin
                  connection.query("SELECT * FROM admin WHERE email = '" + email +"' and password ='"+password+"'", function(err, rows) {
                      if (err)return done(err);
                      if(rows.length){ //admin found
                        rows[0]["type"]="admin";
                        return done(null, rows[0]);
                      }else //no admin no adherent
                        return done(null, false, req.flash('loginMessage', "Votre email ou mot de pass n'est pas correcte!"));
                  });
                }
                else {
                  //adherent found
                  rows[0]["type"]="adherent";
                  var q="SELECT MAX(I.type) as level FROM internship I ,participation P WHERE I.internshipID = P.internshipID and adhID = '" + rows[0].adhID + "' and validation = 1;";
                  var isTrue = bcrypt.compareSync(password, rows[0].password); //hashed password
                  if(isTrue){ //if password is correct we fetch his level
                    return done(null, rows[0]);
                  }
                  else { //password incorrect
                    return done(null, false, req.flash('loginMessage', "votre email ou mot de pass n'est pas correcte!"));
                  }
                }
            });

        }));


};
