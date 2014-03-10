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

title("int");
$int1 = 3;
var_dump($int1);
$arr1 = array($int1);
var_dump($arr1);
$int1 = 5;
var_dump($int1);
$res1 = $arr1;
var_dump($arr1);
observation("does not change <-> by value");

title("string");
$str1 = "a";
var_dump($str1);
$arr1 = array($str1);
var_dump($arr1);
$str1 = "b";
var_dump($str1);
$res2 = $arr1;
var_dump($arr1);
observation("does not change <-> by value");

title("array");
$arr2 = array("a");
var_dump($arr2);
$arr1 = array($arr2);
var_dump($arr1);
$arr2[] = "b";
var_dump($arr2);
$res3 = $arr1;
var_dump($arr1);
observation("does not change <-> by value");

title("map");
$map1 = array("k1" => "a");
var_dump($map1);
$arr1 = array($map1);
var_dump($arr1);
$map1["k1"] = "b";
var_dump($map1);
$res4 = $arr1;
var_dump($arr1);
observation("does not change <-> by value");

class C1
{
  private $a1;

  function __construct($v)
  {
    $this->a1 = $v;
  }

  function setA1($v)
  {
    $this->a1 = $v;
  }
}

title("new object");
$obj1 = new C1("a");
var_dump($obj1);
$arr1 = array($obj1);
var_dump($arr1);
$obj1 = new C1("b");
var_dump($obj1);
$res5 = $arr1;
var_dump($arr1);
observation("does not change");

title("modified object");
$obj1 = new C1("a");
var_dump($obj1);
$arr1 = array($obj1);
var_dump($arr1);
$obj1->setA1("b");
var_dump($obj1);
$res6 = $arr1;
var_dump($arr1);
observation("changes");

echo "</pre>";

if (!class_exists('PHPUnit_Framework_TestCase')) exit;

class Test extends PHPUnit_Framework_TestCase
{
  public function test1()
  {
    global $res1;
    $this->assertEquals([3], $res1);
  }

  public function test2()
  {
    global $res2;
    $this->assertEquals(['a'], $res2);
  }

  public function test3()
  {
    global $res3;
    $this->assertEquals([['a']], $res3);
  }

  public function test4()
  {
    global $res4;
    $this->assertEquals([['k1' => 'a']], $res4);
  }

  public function test5()
  {
    global $res5;
    $this->assertEquals([new C1('a')], $res5);
  }

  public function test6()
  {
    global $res6;
    $this->assertEquals([new C1('b')], $res6);
  }
}

?>
