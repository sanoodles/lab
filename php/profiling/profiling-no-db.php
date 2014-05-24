<?php
error_reporting(E_ALL);

require "page.php";

page_head();

function light_loop() {
  for ($i = 0; $i <= 10 * 1000; $i++) {
      $a = $i * $i;
  }
}

function heavy_loop() {
  for ($i = 0; $i <= 100 * 1000; $i++) {
      $a = $i * $i;
  }
}

function mid_tier() {
  light_loop();
  heavy_loop();
}

function top_tier() {
  mid_tier();
}

top_tier();

page_footer("no-db");
?>

