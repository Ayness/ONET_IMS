'use strict';
//Hapi : The Restful APIs.
const Hapi = require('hapi');
const MySQL = require('mysql');
//Joi : For valid inputs
const Joi = require('joi');
const fs = require('fs');
var pathc = require("path");
// Create a server with a host and port
const server = new Hapi.Server();

const connection = MySQL.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  database: 'onet',
  dateStrings: 'date'
});
server.connection({
  routes: {
    cors: true
  },
  host: '127.0.0.1',
  port: 8081
});
connection.connect();
// Add the route

//All the GETTERS
// Get ALL adherents
server.route({
  method: 'GET',
  path: '/adherents',
  handler: function(request, reply) {
    connection.query('SELECT * FROM adherent WHERE legitimate = 1',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(results);
      });
  }
});
// Get adherent type
server.route({
  method: 'GET',
  path: '/adherenttype/{id}',
  handler: function(request, reply) {
    var id = request.params.id;
    var q = "SELECT MAX(I.type) as type FROM internship I ,participation P WHERE I.internshipID = P.internshipID and adhID = '" + id + "' and validation = 1;";
    connection.query(q,
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(results[0].type);
      });
  }
});

//To know if the current adherent participated in the current internship
server.route({
  method: 'GET',
  path: '/participation/{id}/{internshipID}',
  handler: function(request, reply) {
    var id = request.params.id;
    var internshipID = request.params.internshipID;
    var q = "SELECT count(*) as c FROM participation WHERE adhID = '" + id + "' and internshipID = '" + internshipID + "';";
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(result[0].c);
      });
  }
});
//Get the illegitimate Adherents
server.route({
  method: 'GET',
  path: '/illegitimateAdherent',
  handler: function(request, reply) {
    var id = request.params.id;
    var q = "SELECT * FROM adherent WHERE legitimate = 0";
    connection.query(q,
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(results);
      });
  }
});
//Turn an illegitimate Adherent into a legitimate one
server.route({
  method: 'GET',
  path: '/legitimate/{id}',
  handler: function(request, reply) {
    var id = request.params.id;
    var q = "UPDATE adherent SET legitimate = 1 WHERE adhID = '" + id + "';";
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//Validate the success of an adherent at the current internship
server.route({
  method: 'GET',
  path: '/success/{adhID}/{internshipID}',
  handler: function(request, reply) {
    var adhID = request.params.adhID;
    var internshipID = request.params.internshipID;
    var q = "UPDATE participation SET validation = 1 WHERE adhID = '" + adhID + "' and internshipID = '" + internshipID + "';";
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//Validate the success of an adherent at the current internship
server.route({
  method: 'GET',
  path: '/payment/{adhID}/{internshipID}',
  handler: function(request, reply) {
    var adhID = request.params.adhID;
    var internshipID = request.params.internshipID;
    var q = "UPDATE participation SET payment = 1 WHERE adhID = '" + adhID + "' and internshipID = '" + internshipID + "';";
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//search for legitimate adherants based on a string
server.route({
  method: 'GET',
  path: '/search/{s}',
  handler: function(request, reply) {
    var s = request.params.s;
    var q = 'SELECT * FROM adherent WHERE legitimate = 1 and (address like "%' + s + '%" OR nationalIDcard like "%' + s + '%" OR lastName like "%' + s + '%" OR email like "%' + s + '%" OR firstName like "%' + s + '%" OR birthDate like "%' + s + '%")'
    connection.query(q,
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//search for non legitimate adherants based on a string
server.route({
  method: 'GET',
  path: '/searchnonlegit/{s}',
  handler: function(request, reply) {
    var s = request.params.s;
    var q = 'SELECT * FROM adherent WHERE legitimate = 0 and (address like "%' + s + '%" OR nationalIDcard like "%' + s + '%" OR lastName like "%' + s + '%" OR email like "%' + s + '%" OR firstName like "%' + s + '%" OR birthDate like "%' + s + '%")'
    connection.query(q,
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//upload an adherent national id card image
server.route({
  method: 'post',
  path: '/submitcin/{adhID}',
  config: {
    payload: {
      output: 'stream',
      allow: "multipart/form-data",
      maxBytes: 209715200,
      parse: true
    },
    handler: function(request, reply) {
      const data = request.payload;
      const adhID = request.params.adhID;
      if (data.cinfile) {
        var name = data.cinfile.hapi.filename;
        var cinExt = pathc.extname(name);
        var imagePath = __dirname + "/app/uploads/cins/" + adhID + cinExt;
        var file = fs.createWriteStream(imagePath);
        file.on('error', function(err) {
          console.error(err)
        });
        data.cinfile.pipe(file);
        data.cinfile.on('end', function(err) {
          var ret = {
            filename: data.cinfile.hapi.filename,
            headers: data.cinfile.hapi.headers
          }
          var q = "UPDATE adherent SET hasCin = 1, cinExt = '" + cinExt + "' WHERE adhID = '" + adhID + "';";
          console.log(q);
          connection.query(q, (error, result, fields) => {
            if (error) {
              console.log(error);
              return reply(JSON.stringify({
                success: false,
                error
              }));
            } else if (result.affectedRows) return reply(JSON.stringify({
              success: true,
              msg: ret
            }));
            else return reply(JSON.stringify({
              success: false
            }));
          });
        })
      } else
        reply(JSON.stringify({
          success: false
        }));
    }
  }
});


//Participate in an Internship
server.route({
  method: 'GET',
  path: '/participate/{id}/{internshipID}',
  handler: function(request, reply) {
    var id = request.params.id;
    var internshipID = request.params.internshipID;
    var q = "INSERT INTO participation (adhID, internshipID, validation, payment) VALUES ('" + id + "', '" + internshipID + "','0' ,'0');";
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        if (result.affectedRows) reply(JSON.stringify({success: true}));
        else reply(JSON.stringify({success: false}));
      });
  }
});
//Cancel Participation
server.route({
  method: 'GET',
  path: '/cancelParticipation/{id}/{internshipID}',
  handler: function(request, reply) {
    var id = request.params.id;
    var internshipID = request.params.internshipID;
    var q = "DELETE FROM participation WHERE adhID = '" + id + "' and internshipID = '" + internshipID + "';";
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//Get All Admins
server.route({
  method: 'GET',
  path: '/admins',
  handler: function(request, reply) {
    connection.query('SELECT adminID,login,firstname,lastName,email,address FROM admin',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//Get News
server.route({
  method: 'GET',
  path: '/news',
  handler: function(request, reply) {
    connection.query('SELECT *,DATE_FORMAT(timestamp, "%d-%m-%Y %h:%m:%s") as ts FROM news ORDER BY timestamp DESC',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//Get ALL events
server.route({
  method: 'GET',
  path: '/events',
  handler: function(request, reply) {
    connection.query('SELECT *,DATE_FORMAT(timestamp, "%d-%m-%Y %h:%m:%s") as ts FROM event ORDER BY timestamp DESC',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//Get internships having level <= a given level(type)
server.route({
  method: 'GET',
  path: '/internships/{type}',
  handler: function(request, reply) {
    var type = Number(request.params.type) + 1;
    console.log("type");
    console.log(type);
    connection.query('SELECT internshipID,I.address,type,price,type,DATE_FORMAT(beginDate, "%d/%m/%Y") as beginDate,DATE_FORMAT(endDate, "%d/%m/%Y") as endDate,DATE_FORMAT(timestamp, "%d-%m-%Y %h:%m:%s") as ts,firstName,lastName FROM internship I,adherent A WHERE I.supervisorID = A.adhID and type <= "' + type + '" and DATE(beginDate)>=CURDATE()+7 ORDER BY type ,timestamp DESC',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(results);
      });
  }
});
//Get ALL internships
server.route({
  method: 'GET',
  path: '/internships',
  handler: function(request, reply) {
    connection.query('SELECT internshipID,I.address,type,price,type,DATE_FORMAT(beginDate, "%d/%m/%Y") as beginDate,DATE_FORMAT(endDate, "%d/%m/%Y") as endDate,DATE_FORMAT(timestamp, "%d-%m-%Y %h:%m:%s") as ts,firstName as supervisorFirstName,lastName as supervisorLastName, adhID as supervisorID FROM internship I,adherent A WHERE I.supervisorID = A.adhID  and DATE(beginDate)>=CURDATE() ORDER BY timestamp DESC',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(results);
      });
  }
});
//Get ALL local Offices
server.route({
  method: 'GET',
  path: '/locoffices',
  handler: function(request, reply) {
    connection.query('SELECT l.locOfficeID, l.address, l.city, r.city as gov FROM locoffice l, regoffice r where l.regOfficeID=r.regOfficeID order by r.city',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        var arr = {};
        for (var i = 0; i < results.length; i++) {
        // console.log(results[i].gov);
        if(!arr[results[i].gov]) arr[results[i].gov]= new Array();
        arr[results[i].gov].push(results[i]);
        console.log(arr);
        // console.log("r"+ results[i]);
       }
        reply(arr);
      });
  }
});
//Get ALL regional Offices
server.route({
  method: 'GET',
  path: '/regoffices',
  handler: function(request, reply) {
    connection.query('SELECT * FROM regoffice',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//Get ALL national Offices
server.route({
  method: 'GET',
  path: '/natoffices',
  handler: function(request, reply) {
    connection.query('SELECT * FROM natoffice',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//Get ALL Supervisors
server.route({
  method: 'GET',
  path: '/supervisors',
  handler: function(request, reply) {
    connection.query('SELECT DISTINCT(A.nationalIDcard), A.firstName, A.lastName from adherent A, internship I WHERE A.adhID = I.supervisorID',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//Scan the internship Costs
server.route({
  method: 'GET',
  path: '/internshipCosts',
  handler: function(request, reply) {
    connection.query('SELECT type, beginDate, price FROM internship',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//Get ALL Participations = every adherent with every internship she/he did
server.route({
  method: 'GET',
  path: '/allParticipations',
  handler: function(request, reply) {
    connection.query('SELECT A.nationalIDcard, A.firstName, A.lastName, I.type, P.validation, P.payment FROM internship I, participation P, adherent A WHERE I.internshipID = P.internshipID and A.adhID = P.adhID',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  }
});
//Get Adherent Data by his ID
server.route({
  method: 'GET',
  path: '/adherent/{adhid}',
  handler: function(request, reply) {
    const adhid = request.params.adhid;

    connection.query('SELECT firstName, lastName, birthDate, email, address, paid, nationalIDcard, locOfficeID FROM adherent WHERE adhID = "' + adhid + '"',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  },
  config: {
    validate: {
      params: {
        //validating the adherent id input.
        adhid: Joi.number().integer()
      }
    }
  }
});
//get Admin Data by his ID
server.route({
  method: 'GET',
  path: '/admin/{adminid}',
  handler: function(request, reply) {
    const adminid = request.params.adminid;

    connection.query('SELECT firstName, lastName, birthDate, email FROM admin WHERE adminID = "' + adminid + '"',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  },
  config: {
    validate: {
      params: {
        //validating the admin id input.
        adminid: Joi.number().integer()
      }
    }
  }
});
//Get all supervisor's internships by his ID
server.route({
  method: 'GET',
  path: '/internship/{adhid}',
  handler: function(request, reply) {
    const adhid = request.params.adhid;

    connection.query('SELECT type, beginDate, endDate, address FROM internship WHERE supervisorID = "' + adhid + '"',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  },
  config: {
    validate: {
      params: {
        //validating the adherent id input.
        adhid: Joi.number().integer()
      }
    }
  }
});
//Get an adherent's participations on internships by his ID (History)
server.route({
  method: 'GET',
  path: '/history/{adhid}',
  handler: function(request, reply) {
    const adhid = request.params.adhid;

    connection.query('SELECT A.nationalIDcard, A.firstName, A.lastName, I.type, I.internshipID, DATE_FORMAT(beginDate, "%d/%m/%Y") as beginDate, DATE_FORMAT(endDate, "%d/%m/%Y") as endDate, P.validation, P.payment FROM internship I, participation P, adherent A WHERE I.internshipID = P.internshipID and A.adhID = P.adhID and A.adhID = "' + adhid + '"',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  },
  config: {
    validate: {
      params: {
        //validating the adherent id input.
        adhid: Joi.number().integer()
      }
    }
  }
});
//Get internship adherent (giving the internship ID)
server.route({
  method: 'GET',
  path: '/internshipAdherentList/{id}',
  handler: function(request, reply) {
    const id = request.params.id;

    connection.query('SELECT * FROM internship I, participation P, adherent A WHERE I.internshipID = P.internshipID and A.adhID = P.adhID and P.internshipID = "' + id + '"',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  },
  config: {
    validate: {
      params: {
        //validating the adherent id input.
        id: Joi.number().integer()
      }
    }
  }
});
//Get local offices (giving the regional office ID)
server.route({
  method: 'GET',
  path: '/locOffPerReg/{id}',
  handler: function(request, reply) {
    const id = request.params.id;

    connection.query('SELECT L.* FROM regoffice R, locoffice L WHERE R.regOfficeID = L.regOfficeID and R.regOfficeID = "' + id + '"',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  },
  config: {
    validate: {
      params: {
        //validating the adherent id input.
        id: Joi.number().integer()
      }
    }
  }
});
//Get Adherents (giving the local office ID which they register in)
server.route({
  method: 'GET',
  path: '/locOffAdherents/{id}',
  handler: function(request, reply) {
    const id = request.params.id;

    connection.query('SELECT A.* FROM adherent A, locoffice L WHERE A.locOfficeID = L.locOfficeID and L.locOfficeID = "' + id + '"',
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        reply(results);
      });
  },
  config: {
    validate: {
      params: {
        //validating the adherent id input.
        id: Joi.number().integer()
      }
    }
  }
});
//ALL DELETERS
//Delete a news by its ID
server.route({
  method: 'GET',
  path: '/deleteNews/{id}',
  handler: function(request, reply) {
    var id = request.params.id;
    var q = "DELETE FROM news WHERE newsID =  " + id;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error)
          return reply(error);
        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//Cancel an event by its ID
server.route({
  method: 'GET',
  path: '/cancelEvent/{id}',
  handler: function(request, reply) {
    var id = request.params.id;
    var q = "DELETE FROM event WHERE eventID =  " + id;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error)
          return reply(error);
        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//Cancel an internship by its ID
server.route({
  method: 'GET',
  path: '/cancelInternship/{internshipID}',
  handler: function(request, reply) {
    var internshipID = request.params.internshipID;
    var q = "DELETE FROM internship WHERE internshipID = " + internshipID;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error)
          return reply(error);
        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//Close a local office by its ID
server.route({
  method: 'GET',
  path: '/closeLocOffice/{id}',
  handler: function(request, reply) {
    var id = request.params.id;
    var q = "DELETE FROM locoffice WHERE locOfficeID = " + id;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error)
          return reply(error);
        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//Close a regional office by its ID
server.route({
  method: 'GET',
  path: '/closeRegOffice/{id}',
  handler: function(request, reply) {
    var id = request.params.id;
    var q = "DELETE FROM regoffice WHERE regOfficeID = " + id;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error)
          return reply(error);
        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//Close a national office by its ID
server.route({
  method: 'DELETE',
  path: '/closeNatOffice',
  handler: function(request, reply) {
    const natOfficeID = request.payload.natOfficeID;
    connection.query('DELETE FROM natoffice WHERE natOfficeID = "' + natOfficeID + '"',
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the national office id input.
        natOfficeID: Joi.number().integer()
      }
    }
  }
});
//Banning an adherent by his ID
server.route({
  method: 'GET',
  path: '/deleteAdherent/{id}',
  handler: function(request, reply) {
    var id = request.params.id;
    var q = "DELETE FROM adherent WHERE adhID = " + id;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error)
          return reply(error);
        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//Update an event
server.route({
  method: 'POST',
  path: '/updateEvent',
  handler: function(request, reply) {
    const id = request.payload.eventID;
    const title = request.payload.title;
    const time = request.payload.time;
    const date = request.payload.date;
    const address = request.payload.address;
    const about = request.payload.about;
    var q = "UPDATE event SET title = '" + title + "',time = '" + time + "',date = '" + date + "',address = '" + address + "',about = '" + about + "' where eventID = " + id;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: true
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the event's information.
        eventID: Joi.number().integer(),
        title: Joi.number().integer(),
        time: Joi.number().integer(),
        date: Joi.number().integer(),
        address: Joi.number().integer()
      }
    }
  }
});
server.route({
  method: 'POST',
  path: '/updateNews',
  handler: function(request, reply) {
    const newsID = request.payload.newsID;
    const title = request.payload.title;
    const description = request.payload.description;
    const content = request.payload.content;
    var q = "UPDATE news SET title = '" + title + "',description = '" + description + "',content = '" + content + "' where newsID = " + newsID;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify(JSON.stringify({
            success: false
          })));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the news's information.
        newsID: Joi.number().integer(),
        title: Joi.number().integer(),
        description: Joi.number().integer(),
        content: Joi.number().integer()
      }
    }
  }
});
//update an internship
server.route({
  method: 'POST',
  path: '/updateInternship',
  handler: function(request, reply) {
    var id = request.payload.internshipID;
    var address = request.payload.address;
    var price = request.payload.price;
    var beginDate = request.payload.beginDate;
    var endDate = request.payload.endDate;
    var q = "UPDATE internship SET address = '" + address + "',price = '" + price + "',beginDate = '" + beginDate + "',endDate = '" + endDate + "' where internshipID = " + id;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true,
            message: "internship updated successfully"
          }));
        } else {
          reply(JSON.stringify({
            success: false,
            message: "An error occured while updating internship"
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the internship's information.
        type: Joi.number().integer(),
        price: Joi.number().integer(),
        beginDate: Joi.number().integer(),
        endDate: Joi.number().integer(),
        supervisorID: Joi.number().integer()
      }
    }
  }
});
//update local office
server.route({
  method: 'POST',
  path: '/updateLocOffice',
  handler: function(request, reply) {
    const locOfficeID = request.payload.locOfficeID;
    const address = request.payload.address;
    var q = "UPDATE locoffice SET address = '" + address + "' where locOfficeID = " + locOfficeID;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the internship's information.
        locOfficeID: Joi.number().integer(),
        address: Joi.number().integer()
      }
    }
  }
});
//update regional office
server.route({
  method: 'POST',
  path: '/updateRegOffice',
  handler: function(request, reply) {
    const regOfficeID = request.payload.regOfficeID;
    const address = request.payload.address;
    var q = "UPDATE regoffice SET address = '" + address + "' where regOfficeID = " + regOfficeID;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the internship's information.
        regOfficeID: Joi.number().integer(),
        address: Joi.number().integer()
      }
    }
  }
});
//upodate national office
server.route({
  method: 'POST',
  path: '/updateNatOffice',
  handler: function(request, reply) {
    const natOfficeID = request.payload.natOfficeID;
    const address = request.payload.address;
    var q = "UPDATE natoffice SET address = '" + address + "' where natOfficeID = " + natOfficeID;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the internship's information.
        natOfficeID: Joi.number().integer(),
        address: Joi.number().integer()
      }
    }
  }
});
//Change the Satus of an Adherent
server.route({
  method: 'GET',
  path: '/changeStatus/{id}',
  handler: function(request, reply) {
    var id = request.params.id;
    var q = "UPDATE adherent SET paid = 1 where adhID = " + id;
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error)
          return reply(error);
        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  }
});
//insert a news
server.route({
  method: 'POST',
  path: '/insertNews',
  handler: function(request, reply) {
    const title = request.payload.title;
    const content = request.payload.content;
    const adminID = request.payload.adminID;
    var q = "INSERT INTO news (title, content, adminID, timestamp) VALUES ('" + title + "', '" + content + "', '" + adminID + "' ,NOW());";
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    cors: {
      origin: ['*'],
      additionalHeaders: ['cache-control', 'x-requested-with']
    },
    validate: {
      params: {
        //validating the internship's information.
        title: Joi.number().integer(),
        description: Joi.number().integer(),
        content: Joi.number().integer()
      }
    }
  }
});
//insert an event
server.route({
  method: 'POST',
  path: '/insertEvent',
  handler: function(request, reply) {
    const title = request.payload.title;
    const time = request.payload.time;
    const date = request.payload.date;
    const address = request.payload.address;
    const about = request.payload.about;
    const adminID = request.payload.adminID;
    var q = "INSERT INTO event (eventID, title, time, date, address, about, timestamp, adminID) VALUES (NULL, '" + title + "', '" + time + "', '" + date + "', '" + address + "', '" + about + "', NOW(), '" + adminID + "');";
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error)
          return reply(JSON.stringify({
            success: false,
            message: error
          }));
        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the internship's information.
        title: Joi.number().integer(),
        time: Joi.number().integer(),
        date: Joi.number().integer(),
        address: Joi.number().integer()
      }
    }
  }
});
//insert an internship
server.route({
  method: 'POST',
  path: '/insertInternship',
  handler: function(request, reply) {
    const type = request.payload.type;
    const price = request.payload.price;
    const beginDate = request.payload.beginDate;
    const endDate = request.payload.endDate;
    const address = request.payload.address;
    const supervisorID = request.payload.supervisorID;
    var q = "INSERT INTO internship (internshipID, type, price, beginDate, endDate, supervisorID, address, timestamp) VALUES (NULL, '" + type + "', '" + price + "', '" + beginDate + "', '" + endDate + "', '" + supervisorID + "', '" + address + "', NOW());";
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the internship's information.
        type: Joi.number().integer(),
        price: Joi.number().integer(),
        beginDate: Joi.number().integer(),
        endDate: Joi.number().integer(),
        address: Joi.number().integer(),
        supervisorID: Joi.number().integer()
      }
    }
  }
});
//insert a new local office
server.route({
  method: 'POST',
  path: '/newLocOffice',
  handler: function(request, reply) {
    const address = request.payload.address;
    const city = request.payload.city;
    const regOfficeID = request.payload.regOfficeID;
    var q = "INSERT INTO locoffice (locOfficeID, address, city, regOfficeID) VALUES (NULL, '" + address + "', '" + city + "', '" + regOfficeID + "');";
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the internship's information.
        locOfficeID: Joi.number().integer(),
        address: Joi.number().integer(),
        regOfficeID: Joi.number().integer()
      }
    }
  }
});
//insert a reginal office
server.route({
  method: 'POST',
  path: '/newRegOffice',
  handler: function(request, reply) {
    const address = request.payload.address;
    const city = request.payload.city;
    var q = "INSERT INTO regoffice (regOfficeID, address, city) VALUES (NULL, '" + address + "', '" + city + "');";
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the internship's information.
        regOfficeID: Joi.number().integer(),
        address: Joi.number().integer(),
        natOfficeID: Joi.number().integer()
      }
    }
  }
});
//insert a national office
server.route({
  method: 'POST',
  path: '/newNatOffice',
  handler: function(request, reply) {
    const natOfficeID = request.payload.natOfficeID;
    const address = request.payload.address;
    var q = "INSERT INTO natoffice (natOfficeID, address) VALUES (NULL, '" + address + "');";
    console.log(q);
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };

        if (result.affectedRows) {
          reply(JSON.stringify({
            success: true
          }));
        } else {
          reply(JSON.stringify({
            success: false
          }));
        }
      });
  },
  config: {
    validate: {
      params: {
        //validating the internship's information.
        natOfficeID: Joi.number().integer(),
        address: Joi.number().integer()
      }
    }
  }
});
//Statistics and Analysis
//count the female adherents
server.route({
  method: 'GET',
  path: '/females',
  handler: function(request, reply) {
    var q = "SELECT count(*) as c FROM adherent WHERE gender = '1';";
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(result[0].c);
      });
  }
});
//count the female adherents
server.route({
  method: 'GET',
  path: '/males',
  handler: function(request, reply) {
    var q = "SELECT count(*) as c FROM adherent WHERE gender = '0';";
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(result[0].c);
      });
  }
});
//count the paid adherents
server.route({
  method: 'GET',
  path: '/paidAdherent',
  handler: function(request, reply) {
    var q = "SELECT count(*) as c FROM adherent WHERE paid = '1' and legitimate=1;";
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(result[0].c);
      });
  }
});
//count the not paid adherents
server.route({
  method: 'GET',
  path: '/notPaidAdherent',
  handler: function(request, reply) {
    var q = "SELECT count(*) as c FROM adherent WHERE paid = '0' and legitimate=1;";
    connection.query(q,
      function(error, result, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(result[0].c);
      });
  }
});
// count the number of registration through out the years
server.route({
  method: 'GET',
  path: '/registrationPerYear',
  handler: function(request, reply) {
    var year = request.params.year;
    var q = "SELECT YEAR(registration) as year,count(*) as count FROM adherent where legitimate = 1 GROUP BY YEAR(registration);";
    connection.query(q,
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(results);
      });
  }
});
// count the number of registration per governorate
server.route({
  method: 'GET',
  path: '/registrationPerGov',
  handler: function(request, reply) {
    var year = request.params.year;
    var q = "SELECT governorate as gov, count(*) as count FROM adherent where legitimate = 1 GROUP BY governorate;";
    connection.query(q,
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(results);
      });
  }
});
//get adherents havig level >= a given level
server.route({
  method: 'GET',
  path: '/supervisors/{type}',
  handler: function(request, reply) {
    var type = request.params.type;
    var q = "SELECT adhID, firstName, lastName ,(SELECT MAX(I.type) as l FROM internship I ,participation P WHERE I.internshipID = P.internshipID and P.adhID = A.adhID and validation = 1 having MAX(I.type)>=2 and  MAX(I.type) is not null) as type FROM adherent A where (SELECT MAX(I.type) as l FROM internship I ,participation P WHERE I.internshipID = P.internshipID and P.adhID = A.adhID and validation = 1 having MAX(I.type)>='" + request.params.type + "' and  MAX(I.type) is not null) is not null";
    connection.query(q,
      function(error, results, fields) {
        if (error) {
          reply(JSON.stringify(error));
          console.log(error);
          return
        };
        reply(results);
      });
    }
  });
//starting server
server.start((err) => {
  if (err) throw err;
  console.log('The Magic happens on Port :', server.info.uri);
});
