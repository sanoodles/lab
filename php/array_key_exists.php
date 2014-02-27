<?php 

function title($v)
{
  echo "\n\n\n\n" . $v . "\n\n";
}

function observation($v)
{
  echo "\n$v";
}

$aa1 = array(
   "k1" => "v1",
   "k2" => "v2"
);

echo "<pre>";

title('array_key_exists("k2", h1)');
$res = array_key_exists("k2", $aa1);
var_export($res);
observation('');

echo "</pre>";

if (!class_exists('PHPUnit_Framework_TestCase')) exit;

class Test extends PHPUnit_Framework_TestCase
{
  public function test()
  {
    global $res;
    $this->assertTrue($res);
  }
}

?>
