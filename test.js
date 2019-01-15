process.env.NODE_CONFIG_DIR = "./config";

var dbUtils = require(__dirname + "/backend/utils/utils.js");

var arg = process.argv[2];
if (arg == "db") {
    dbUtils.makeDB();
    dbUtils.loadMigrations();
}
