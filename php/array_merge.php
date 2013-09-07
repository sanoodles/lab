<?php

$a0 = array();
$a1 = array("red", "green");
$a2 = array("red", "blue"); // repeated element "red"


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
		1001 => array( // repeated key
				"b11" => 121, // repeated key, repeated value
				"b12" => 222 // repeated key, different value
		),
		"asdf" => array( // repeated key
				"asdf11" => 231, // repeated key, different value
				"asdf12" => 232 // repeated key, different value
		),
		1002 => array(
				"c11" => 241,
				"c12" => 242
		),
);

echo "<pre>";

echo "\n\n\narray_merge(a1, a2)\n\n";
$merge = array_merge($a1, $a2);
var_dump($merge);

echo "\n\n\narray_merge(a0, a1)\n\n";
$merge = array_merge($a0, $a1);
var_dump($merge);

echo "\n\n\narray_merge(m1, m2)\n\n";
$merge = array_merge($m1, $m2);
var_dump($merge);
echo "\n";
echo "numeric keys are not preserved.\n";
echo "numeric keys are not merged.\n";
echo "string keys of the second dimension are overriden.\n";

echo "\n\n\narray_merge_recursive(m1, m2)\n\n";
$merge = array_merge_recursive($m1, $m2);
var_dump($merge);
echo "\n";
echo "numeric keys are not preserved.\n";
echo "numeric keys are not merged.\n";
echo "string keys of the second dimension are merged.\n";

echo "</pre>";

?>
