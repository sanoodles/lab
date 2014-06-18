<?php

function title($v)
{
    echo "\n\n\n\n$v\n\n";
}

function observation($v)
{
    echo "\n$v";
}



echo "<pre>";



title('today as ISO');
$res1 = date("Y-m-d");
var_export($res1);
observation("");

title('yesterday as ISO');
$res2 = date("Y-m-d", strtotime("-1 day"));;
var_export($res2);
observation("");

title('last day of this month as ISO');
$res3 = date("t");
var_export($res3);
observation("");

title('last day of given month as ISO');
$res4 = date("t", strtotime("2014-02"));
var_export($res4);
observation("");



echo "</pre>";

?>
