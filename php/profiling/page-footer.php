<?php
$xhprof_data = xhprof_disable();

$XHPROF_ROOT = "/usr/share/php/xhprof_lib";
include_once $XHPROF_ROOT . "/utils/xhprof_lib.php";
include_once $XHPROF_ROOT . "/utils/xhprof_runs.php";

$xhprof_runs = new XHProfRuns_Default();
$run_id = $xhprof_runs->save_run($xhprof_data, "xhprof_testing");

echo '<a href="http://localhost/php/profiling/xhprof_html/index.php?run=' . $run_id . '&source=xhprof_testing">Results</a>';
?>

