<?php

function title($v)
{
    echo "\n\n\n\n$v\n\n";
}

function observation($v)
{
    echo "\n$v";
}

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

title("int");
$int1 = 3;
var_dump($int1);
$arr1 = array($int1);
var_dump($arr1);
$int1 = 5;
var_dump($int1);
var_dump($arr1);
observation("does not change <-> by value");

title("string");
$str1 = "a";
var_dump($str1);
$arr1 = array($str1);
var_dump($arr1);
$str1 = "b";
var_dump($str1);
var_dump($arr1);
observation("does not change <-> by value");

title("array");
$arr2 = array("a");
var_dump($arr2);
$arr1 = array($arr2);
var_dump($arr1);
$arr2[] = "b";
var_dump($arr2);
var_dump($arr1);
observation("does not change <-> by value");

title("map");
$map1 = array("k1" => "a");
var_dump($map1);
$arr1 = array($map1);
var_dump($arr1);
$map1["k1"] = "b";
var_dump($map1);
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
var_dump($arr1);
observation("does not change");

title("modified object");
$obj1 = new C1("a");
var_dump($obj1);
$arr1 = array($obj1);
var_dump($arr1);
$obj1->setA1("b");
var_dump($obj1);
var_dump($arr1);
observation("changes");



echo "</pre>";

?>
