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
$s1 = "asdf,qwer";
$s2 = "asdf,";
$s3 = ",qwer";
$s4 = "asdf";

echo "<pre>";

title('vanilla explode');
$res = explode(",", $s1);
var_export($res);
observation("");

title('explode empty string');
$res = explode(",", $s0);
var_export($res);
observation("");

title('explode on delimiter at the end');
$res = explode(",", $s2);
var_export($res);
observation("");

title('explode on delimiter at the beginning');
$res = explode(",", $s3);
var_export($res);
observation("");

title('explode on no delimiter');
$res = explode(",", $s4);
var_export($res);
observation("");

echo "</pre>";

?>
