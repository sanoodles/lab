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
$res1 = explode(",", $s1);
var_export($res1);
observation("");

title('explode empty string');
$res2 = explode(",", $s0);
var_export($res2);
observation("one position, with an empty string is returned.");

title('explode on delimiter at the end');
$res3 = explode(",", $s2);
var_export($res3);
observation("one ending position, with an empty string, is returned.");

title('explode on delimiter at the beginning');
$res4 = explode(",", $s3);
var_export($res4);
observation("");

title('explode on no delimiter');
$res5 = explode(",", $s4);
var_export($res5);
observation("");

echo "</pre>";

if (!class_exists('PHPUnit_Framework_TestCase')) exit;

class Test extends PHPUnit_Framework_TestCase
{
  public function test1()
  {
    global $res1;
    $this->assertEquals(['asdf', 'qwer'], $res1);
  }

  public function test2()
  {
    global $res2;
    $this->assertEquals([''], $res2);
  }

  public function test3()
  {
    global $res3;
    $this->assertEquals(['asdf', ''], $res3);
  }

  public function test4()
  {
    global $res4;
    $this->assertEquals(['', 'qwer'], $res4);
  }

  public function test5()
  {
    global $res5;
    $this->assertEquals(['asdf'], $res5);
  }
}

?>
