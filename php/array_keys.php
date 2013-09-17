<?php 

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

echo "\n\n\n\n" . '$a1' . "\n\n";
var_dump($a1);

echo "\n\n\n\n" . '$m1' . "\n\n";
var_dump($m1);

echo "\n\n\n\n" . 'in_array($a1, "b")' . "\n\n";
var_dump(array_keys($a1, "b"));
echo "\nvanilla in_array";

echo "\n\n\n\n" . 'in_array($m1, $a1)' . "\n\n";
var_dump(array_keys($m1, $a1));
echo "\ncan find same array in matrix";

echo "\n\n\n\n" . 'in_array($m1, $a2)' . "\n\n";
var_dump(array_keys($m1, $a2));
echo "\ndifferent array with same values is evaluated as a hit";

echo "\n\n\n\n" . 'in_array($m1, $a3)' . "\n\n";
var_dump(array_keys($m1, $a3));
echo "\ndifferent array with different values is evaluated as a miss";

echo "\n\n\n\n" . 'in_array($m1, $a4)' . "\n\n";
var_dump(array_keys($m1, $a4));
echo "\ndifferent order of elements is evaluated as a miss";

echo "</pre>";

?>
