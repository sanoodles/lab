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
				"asdf11" => 131, // repeated key, repeated value
				"asdf12" => 232 // repeated key, different value
		),
		1002 => array(
				"c11" => 241,
				"c12" => 242
		),
);



echo "<pre>";

echo "\n\n\narray_merge(a1, a2)\n\n";
$merge1 = array_merge($a1, $a2);
var_dump($merge1);

echo "\n\n\narray_merge(a0, a1)\n\n";
$merge2 = array_merge($a0, $a1);
var_dump($merge2);

echo "\n\n\narray_merge(m1, m2)\n\n";
$merge3 = array_merge($m1, $m2);
var_dump($merge3);
echo "\n";
echo "numeric keys are NOT preserved.\n";
echo "numeric keys are NOT merged.\n";
echo "string keys of the second dimension are overwritten.\n";

echo "\n\n\narray_merge_recursive(m1, m2)\n\n";
$merge4 = array_merge_recursive($m1, $m2);
var_dump($merge4);
echo "\n";
echo "numeric keys are NOT preserved.\n";
echo "numeric keys are NOT merged.\n";
echo "string keys of the second dimension are merged.\n";

echo "</pre>";

if (!class_exists('PHPUnit_Framework_TestCase')) exit;

class Test extends PHPUnit_Framework_TestCase
{
  public function test()
  {
    global $merge1;
    $this->assertEquals(["red", "green", "red", "blue"], $merge1);
  }

  public function test2()
  {
    global $merge2;
    $this->assertEquals($merge2, ["red", "green"]);
  }

  public function test3()
  {
    global $merge3;
    $this->assertEquals($merge3, [
        0 => [
          "a11" => 111, 
          "a12" => 112], 
        1 => [
          "b11" => 121, 
          "b12" => 122], 
        "asdf" => [
          "asdf11" => 131, 
          "asdf12" => 232],
        2 => [
          "b11" => 121, 
          "b12" => 222],
        3 => [
          "c11" => 241, 
          "c12" => 242]
    ]);
  }

  public function test4()
  {
    global $merge4;
    $this->assertEquals($merge4, [
        0 => [
          "a11" => 111, 
          "a12" => 112], 
        1 => [
          "b11" => 121, 
          "b12" => 122], 
        "asdf" => [
          "asdf11" => [
            131, 131], 
          "asdf12" => [
            132, 232]],
        2 => [
          "b11" => 121, 
          "b12" => 222],
        3 => [
          "c11" => 241, 
          "c12" => 242]
    ]);
  }

}

?>
