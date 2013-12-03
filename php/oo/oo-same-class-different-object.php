<?php

/**
 * This test shows that it is possible to access a private method
 * from a different object if both objects are from the same class.
 */

class C {

	public function publicFunction()
	{
		echo "<p>public function of C</p>";

		$other = new C();
		$other->privateFunction(); // this will work

		$other = new D();
		$other->privateFunction(); // this won't
	}

	private function privateFunction()
	{
		echo "<p>private function of C</p>";
	}

}

class D {

	private function privateFunction()
	{
		echo "<p>private function of D</p>";
	}
}

$o = new C();
$o->publicFunction();

?>
