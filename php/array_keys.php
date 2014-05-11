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

title('$a1');
var_export($a1);

title('array_keys($a1, "b")');
$res1 = array_keys($a1, "b");
var_export($res1);
observation('vanilla array_keys');

title('array_keys($m1, $a1)');
$res2 = array_keys($m1, $a1);
var_export($res2);
observation('can find same array in matrix');

title('array_keys($m1, $a2)');
$res3 = array_keys($m1, $a2);
var_export($res3);
observation('different array with same values is evaluated as a hit. so it works by value');

title('array_keys($m1, $a3)');
$res4 = array_keys($m1, $a3);
var_export($res4);
observation('different array with different values is evaluated as a miss. of course.');

title('array_keys($m1, $a4)');
$res5 = array_keys($m1, $a4);
var_export($res5);
observation('different order of elements is evaluated as a miss.');

$a1 = array_reverse($a1);
title('after array_reverse($a1)');

title('$a1');
var_export($a1);

title('$m1');
var_export($m1);
observation('a1 is not reversed in m1. so a1 was put into m1 by value.');

title('array_keys($m1, $a1)');
$res6 = array_keys($m1, $a1);
var_export($res6);
observation('can not find reversed array in matrix, since it works by value.');



echo "</pre>";

if (!class_exists('PHPUnit_Framework_TestCase')) exit;

class Test extends PHPUnit_Framework_TestCase
{
  public function test()
  {
    global $res1;
    $this->assertEquals([0 => 1], $res1);
  }

  public function test2()
  {
    global $res2;
    $this->assertEquals([0 => 5], $res2);
  }

  public function test3()
  {
    global $res3;
    $this->assertEquals([0 => 5], $res3);
  }

  public function test4()
  {
    global $res4;
    $this->assertEquals([], $res4);
  }

  public function test5()
  {
    global $res5;
    $this->assertEquals([], $res5);
  }

  public function test6()
  {
    global $res6;
    $this->assertEquals([], $res6);
  }

}

?>
