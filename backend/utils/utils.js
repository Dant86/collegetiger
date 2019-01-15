var config = require('config');
var mysql = require('mysql');
var fs = require('fs');
var appRoot = require("app-root-path");

var exports = module.exports = {};

var createConnection = function(database) {
    var dbConfig = config.get("dbDetails");
    if (database !== "") {
        dbConfig["database"] = database;
    }
    return mysql.createConnection(dbConfig);
}

var makeQuery = function(query) {
    var conn = createConnection();
    conn.connect(function(err) {
        if (err) throw err;
        conn.query(query, function(err, result) {
            if (err) throw err;
        });
    });
}

exports.makeQuery = makeQuery;
exports.createConnection = createConnection;

exports.makeDB = function() {
    makeQuery("CREATE DATABASE collegetiger");
}

exports.loadMigrations = function() {
    var migration = fs.readFileSync(appRoot + "/backend/migrations/V1.0.sql").toString();
    console.log(migration);
    makeQuery(migration);
}
