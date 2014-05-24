<?php
function page_head() {
  xhprof_enable(
      XHPROF_FLAGS_CPU + 
      XHPROF_FLAGS_MEMORY +
      XHPROF_FLAGS_NO_BUILTINS);
}

function page_footer($profiling_name) {
  $xhprof_data = xhprof_disable();

  $XHPROF_ROOT = "/usr/share/php/xhprof_lib";
  include_once $XHPROF_ROOT . "/utils/xhprof_lib.php";
  include_once $XHPROF_ROOT . "/utils/xhprof_runs.php";

  $xhprof_runs = new XHProfRuns_Default();
  $run_id = $xhprof_runs->save_run($xhprof_data, $profiling_name);

  $href_prefix = "http://localhost/php/profiling/xhprof_html/index.php";
  $href_sufix = "?run=$run_id&source=$profiling_name";
  echo '<a href="' . $href_prefix . $href_sufix . '">Results</a>';
}

?>

