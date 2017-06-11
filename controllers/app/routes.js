// app/routes.js
var express = require('express')
var formidable = require('express-formidable');
path = require('path'),
app = express();
app.use(formidable());
module.exports = function(app, passport) {

    // caching disabled for every route
    app.use(function(req, res, next) {
        res.set('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
        next();
    });
    app.post('/adhProfile', function(req, res) {
        console.log("req.files");
        console.log(req);
        if (!req.files)
            return res.status(400).send('No files were uploaded.');

        // The name of the input field (i.e. "sampleFile") is used to retrieve the uploaded file
        let sampleFile = req.files.cinfile;

        // Use the mv() method to place the file somewhere on your server
        sampleFile.mv('/', function(err) {
            if (err)
                return res.status(500).send(err);

            res.send('File uploaded!');
        });
        res.render('../../views/adhProfile.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    // =====================================
    // HOME PAGE (with login links) ========
    // =====================================
    // =====================================
    // LOGIN ===============================
    // =====================================
    // show the login form
    app.get('/', function(req, res) {
        // if user is authenticated in the session, redirect them to the home page
        if (req.isAuthenticated())
            res.redirect('/home');
        // render the page and pass in any flash data if it exists
        res.render('../../views/index.ejs', {
            message: req.flash('loginMessage'),
            user: req.user
        });
    });
    app.post('/', passport.authenticate('local-login', {
        successRedirect: '/home', // redirect to the secure profile section
        failureRedirect: '/', // redirect back to the signup page if there is an error
        failureFlash: true // allow flash messages
    }));

    // process the login form
    // app.post('/login', do all our passport stuff here);

    // =====================================
    // SIGNUP ==============================
    // =====================================
    // show the signup form
    app.get('/signup', function(req, res) {
        // if user is authenticated in the session, redirect them to the home page
        if (req.isAuthenticated())
            res.redirect('/home');
        // render the page and pass in any flash data if it exists
        res.render('../../views/signup.ejs', {
            message: req.flash('signupMessage')
        });
    });
    // process the signup form
    app.post('/signup', passport.authenticate('local-signup', {
        successRedirect: '/', // redirect to the secure profile section
        failureRedirect: '/signup', // redirect back to the signup page if there is an error
        failureFlash: true // allow flash messages
    }));

    // process the signup form
    // app.post('/signup', do all our passport stuff here);

    // =====================================
    // PROFILE SECTION =====================
    // =====================================
    // we will want this protected so you have to be logged in to visit
    // we will use route middleware to verify this (the isLoggedIn function)
    app.get('/home', isLoggedIn, function(req, res) {

        if (req.user.type == "admin") {
            res.render('../../views/home.ejs', {
                user: req.user // get the user out of session and pass to template
            });
        } else {
            // console.log(req.user);
            res.render('../../views/adhHome.ejs', {
                user: req.user // get the user out of session and pass to template
            });
        }

    });
    // =====================================
    // LOGOUT ==============================
    // =====================================
    app.get('/logout', function(req, res) {
        req.logout();
        res.redirect('/');
    });
    app.get('/adherentList', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/adherentList.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/eventList', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/eventList.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/internshipList', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/internshipList.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/newsList', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/newsList.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/addEvent', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/addEvent.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/addInternship', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/addInternship.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/addNEWS', requireRole, isLoggedIn, function(req, res) {
      console.log("add news");
        res.render('../../views/addNEWS.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/locOfficeList', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/locOfficeList.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/regOfficeList', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/regOfficeList.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/natOffice', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/natOffice.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/addLocOffice', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/addLocOffice.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/addRegOffice', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/addRegOffice.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/illegitimateAdherentList', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/illegitimateAdherentList.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/statsAnalysis', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/statsAnalysis.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/stat1', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/stat1.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/stat2', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/stat2.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/stat3', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/stat3.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/checkAdherentHistory/:adhID/:firstName/:lastName', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/checkAdherentHistory.ejs', {
            user: req.user, // get the user out of session and pass to template
            adhID : req.params.adhID,
            firstName: req.params.firstName,
            lastName: req.params.lastName
        });
    });
    app.get('/internshipAdherentsList/:internshipID/:type', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/internshipAdherentsList.ejs', {
            user: req.user, // get the user out of session and pass to template
            internshipID : req.params.internshipID,
            type: req.params.type
        });
    });
    app.get('/locOfficeList/:id/:city/:address', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/locOfficeList.ejs', {
            user: req.user, // get the user out of session and pass to template
            id : req.params.id,
            city : req.params.city,
            address : req.params.address,
        });
    });
    app.get('/locOffAdherents/:id/:city/:address', requireRole, isLoggedIn, function(req, res) {
        res.render('../../views/locOffAdherents.ejs', {
            user: req.user, // get the user out of session and pass to template
            id : req.params.id,
            city : req.params.city,
            address : req.params.address,
        });
    });
    app.get('/history', isLegitimate, isLoggedIn, function(req, res) {
        console.log("tètttyigfgiggyu");
        res.render('../../views/history.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });

    app.get('/info', isLoggedIn, function(req, res) {
        if (req.user.type == "admin") {
            res.render('../../views/info.ejs', {
                user: req.user // get the user out of session and pass to template
            });
        } else {
            res.render('../../views/adhInfo.ejs', {
                user: req.user // get the user out of session and pass to template
            });
        }

    });
    app.get('/location', isLoggedIn, function(req, res) {
        if (req.user.type == "admin") {
            res.render('../../views/location.ejs', {
                user: req.user // get the user out of session and pass to template
            });
        } else {
            res.render('../../views/adhLocation.ejs', {
                user: req.user // get the user out of session and pass to template
            });
        }

    });
    app.get('/internshipsToSupervise', isLegitimate, isLoggedIn, function(req, res) {
        res.render('../../views/internshipsToSupervise.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });
    app.get('/adhProfile', isLoggedIn, function(req, res) {
        // console.log(req);
        res.render('../../views/adhProfile.ejs', {
            user: req.user // get the user out of session and pass to template
        });
    });


    app.get('/cin/:imgName', function(req, res) {
        res.sendFile(__dirname + '/uploads/cins/' + req.params.imgName);
    });


    app.use(express.static('static'))
};

function isLegitimate(req, res, next) {

    try {
        // if user is legitimate, carry on
        if (req.user.legitimate == "1")
            return next();

        // if they aren't redirect them to the profile
        res.redirect('/home');
    } catch (e) {
        res.redirect('/home');
    }
}
//route middleware to make sure a user is admin
function requireRole(req, res, next) {

    try {
        // if user is admin, carry on
        if (req.user.type == "admin")
            return next();

        // if they aren't redirect them to the profile
        res.redirect('/home');
    } catch (e) {
        res.redirect('/home');
    }

}
// route middleware to make sure a user is logged in
function isLoggedIn(req, res, next) {
    try {
        // if user is authenticated in the session, carry on
        if (req.isAuthenticated())
            return next();

        // if they aren't redirect them to the home page
        res.redirect('/');
    } catch (e) {
        res.redirect('/');
    }

}
