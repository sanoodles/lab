<?php

$a0 = array();
$a1 = array("red", "green");
$a2 = array("red", "blue");


$m0 = array();
$m1 = array(
		1000 => array(
				"a11" => 111,
				"a12" => 112
		),
		1001 => array(
				"b11" => 121,
				"b12" => 122
		),
		"asdf" => array(
				"asdf11" => 131,
				"asdf12" => 132
		)
);
$m2 = array(
		1001 => array(
				"b11" => 221,
				"b12" => 222
		),
		"asdf" => array(
				"asdf11" => 231,
				"asdf12" => 232
		),
		1002 => array(
				"c11" => 241,
				"c12" => 242
		),
);

/*
$merge = array_merge($a1, $a2);
var_dump($merge);

$merge = array_merge($a0, $a1);
var_dump($merge);

$merge = array_merge($m1, $m2);
var_dump($merge);
*/
$merge = array_merge_recursive($m1, $m2);
var_dump($merge);

?>