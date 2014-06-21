var credentials = require('konphyg')(__dirname + '/config')('credentials');
var pg = require('pg');

function heavy_query() {
  client.query(
    "SELECT * FROM table1, table2 ORDER BY table1.field1", 
    function(err, result) {
      
      client.end();
    }
  );
}

function light_query() {
  client.query(
    "SELECT * FROM table1, table2", 
    function(err, result) {
      
      heavy_query();
    }
  );
}

function mid_tier() {
  light_query();
}

function top_tier() {
  mid_tier();
}

function onConnect(err) {
  top_tier();
}

var client = new pg.Client("postgres://" + 
    credentials.db_user + ":" +
    credentials.db_pass + "@" + 
    credentials.db_host + "/" +
    credentials.db_name);

client.connect(function(err) { onConnect(err) });

