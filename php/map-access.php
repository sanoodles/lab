<?php

function title($v)
{
    echo "\n\n\n\n$v\n\n";
}

function observation($v)
{
    echo "\n$v";
}

$a = array(
		array(
			"a" => 10,
			"b" => 20,
		),
);

echo "<pre>";

title("a");
print_r($a);

title("a[0]");
print_r($a[0]);

title("a[0]['a']");
print_r($a[0]["a"]);

title("a[0][3]");
print_r($a[0][3]);
observation("Nothing is printed, and this error is generated: <q>PHP Notice:  Undefined offset: 3</q>");

title("current(a[0]) to access the first value of a hash without knowing the key");
print_r(current($a[0]));

echo "</pre>";

if (!class_exists('PHPUnit_Framework_TestCase')) exit;

class Test extends PHPUnit_Framework_TestCase
{
  public function test1()
  {
    global $a;
    $this->assertEquals([['a' => 10, 'b' => 20]], $a);
  }

  public function test2()
  {
    global $a;
    $this->assertEquals(['a' => 10, 'b' => 20], $a[0]);
  }

  public function test3()
  {
    global $a;
    $this->assertEquals(10, $a[0]['a']);
  }

  /**
   * @expectedException PHPUnit_Framework_Error_Notice
   */
  public function test4()
  {
    global $a;
    $this->assertEquals(null, $a[0][3]);
  }

  public function test5()
  {
    global $a;
    $this->assertEquals(10, current($a[0]));
  }

}

?>
