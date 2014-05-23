<?php
xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY);

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

$xhprof_data = xhprof_disable();

$XHPROF_ROOT = "/usr/share/php/xhprof_lib";
include_once $XHPROF_ROOT . "/utils/xhprof_lib.php";
include_once $XHPROF_ROOT . "/utils/xhprof_runs.php";

$xhprof_runs = new XHProfRuns_Default();
$run_id = $xhprof_runs->save_run($xhprof_data, "xhprof_testing");

echo '<a href="http://localhost/php/profiling/xhprof_html/index.php?run=' . $run_id . '&source=xhprof_testing">Results</a>';

?>

