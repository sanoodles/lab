<?php

function title($v)
{
    echo "\n\n\n\n$v\n\n";
}

function observation($v)
{
    echo "\n$v";
}

$s0 = "";
$s1 = "a";
$s2 = "a\n";
$s3 = "a\nb";
$s4 = "\nb";



echo "<pre>";

title('count empty string');
$res0 = substr_count($s0, "\n");
var_export($res0);
observation("");

title('count no occurrences');
$res1 = substr_count($s1, "\n");
var_export($res1);
observation("");

title('count as sufix');
$res2 = substr_count($s2, "\n");
var_export($res2);
observation("");

title('count as infix');
$res3 = substr_count($s3, "\n");
var_export($res3);
observation("");

title('count as prefix');
$res4 = substr_count($s4, "\n");
var_export($res4);
observation("");

echo "</pre>";

?>
