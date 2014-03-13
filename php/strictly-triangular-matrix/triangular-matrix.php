<?php

function title($v)
{
    echo "\n\n\n\n" . $v . "\n\n";
}

function observation($v)
{
    echo "\n$v";
}

/*
 * Tests for class StrictlyTriangularMatrix
 */

define("MAX_MATCH_DISTANCE", 2);

require "StrictlyTriangularMatrix.class.php";

$map = array(
		"a" => "10",
		"b" => "20",
		"c" => "30",
		"d" => "40"
);

function some_aggregation($x, $y)
{
	return rand(1, 4);
}

/**
 * Explanation to make some sense of this example.
 * Suppose we are using the STM to store distances betwen
 * locations. This function would filter the pairs of 
 * locations with a distance in between below $maxMatchDistance.
 */
function getIsDistanceAMatchFunction($maxMatchDistance)
{
	return function($distance) use ($maxMatchDistance)
	{
		return $distance <= $maxMatchDistance;
	};
};


echo "<table><tr><td>";

echo "<pre>";
title("Strictly triangular matrix");
$stm = StrictlyTriangularMatrix::createFromMap($map, "some_aggregation");
var_dump($stm);
echo "</pre>";

echo "</td><td style='padding-left: 2em; vertical-align: top;'>";

echo "<pre>";
title("Filtered strictly triangular matrix");
$filteredStm = StrictlyTriangularMatrix::filter($stm, getIsDistanceAMatchFunction(MAX_MATCH_DISTANCE));
var_dump($filteredStm);
echo "</pre>";

echo "</td></tr></table>";

if (!class_exists('PHPUnit_Framework_TestCase')) exit;

class Test extends PHPUnit_Framework_TestCase
{
  public function testCreateFromMap()
  {
    global $map, $stm;
    next($map); // skip first position
    while (list($key, $value) = each($map)) {
      $this->assertTrue(array_key_exists($key, $stm));
    }
  }

  public function testFilter()
  {
    global $filteredStm;
    foreach ($filteredStm as $rowKey => $row) {
      foreach ($row as $colKey => $value) {
        $this->assertTrue($value <= MAX_MATCH_DISTANCE);
      }
    }
  }
}

?>
