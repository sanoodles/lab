<?php
error_reporting(E_ALL);

require "credentials.php";
require "page.php";

function light_query() {
  global $db;
  $query = "
    SELECT * 
    FROM table1, table2
  ";
  $result = pg_query($db, $query);
  while ($row = pg_fetch_assoc($result)) {
    
  }
}

function heavy_query() {
  global $db;
  
  // table1 does not contain an index for field1
  $query = "
    SELECT * 
    FROM table1, table2
    ORDER BY table1.field1";

  $result = pg_query($db, $query);
  while ($row = pg_fetch_assoc($result)) {
    
  }
}

function mid_tier() {
  light_query();
  heavy_query();
}

function top_tier() {
  mid_tier();
}

page_head();

$db = pg_connect(
    "host=" . DB_HOST  .
    " dbname=" . DB_NAME  . 
    " user=" . DB_USER .
    " password=" . DB_PASS)
    or die('Could not connect: ' . pg_last_error());

top_tier();

page_footer("db");
?>
