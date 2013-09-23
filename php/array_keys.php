<?php 

function title($v)
{
  echo "\n\n\n\n" . $v . "\n\n";
}

function observation($v)
{
  echo "\n$v";
}

$a1 = array("a", "b");
$a2 = array("a", "b"); // same value, different reference
$a3 = array("a", "c"); // different value (and different reference)
$a4 = array("b", "a"); // different order

$m1 = array();

/*
 * some dummy value is put at position 3 to act as an arbitrary offset 
 * that ensures that tests do not work just for the corner 
 * case of the needle being at first position of the haystack
 */  
$m1[3] = array("dummy1", "dummy2");
 
$m1[5] = $a1;



echo "<pre>";

title('$a1');
var_export($a1);

title('$m1');
var_export($m1);

$a1 = array_reverse($a1);

title('after array_reverse($a1)');

title('$a1');
var_export($a1);

title('$m1');
var_export($m1);
observation('a1 is not reversed in m1. so a1 was put into m1 by value.');

$a1 = array_reverse($a1);
title('array_reverse($a1) again');

title('$a1');
var_export($a1);

title('array_keys($a1, "b")');
var_export(array_keys($a1, "b"));
observation('vanilla array_keys');

title('array_keys($m1, $a1)');
var_export(array_keys($m1, $a1));
observation('can find same array in matrix');

title('array_keys($m1, $a2)');
var_export(array_keys($m1, $a2));
observation('different array with same values is evaluated as a hit. so it works by value');

title('array_keys($m1, $a3)');
var_export(array_keys($m1, $a3));
observation('different array with different values is evaluated as a miss. of course.');

title('array_keys($m1, $a4)');
var_export(array_keys($m1, $a4));
observation('different order of elements is evaluated as a miss.');

echo "</pre>";

?>
