<?php

/**
 * This test shows that it is possible to access a private method
 * from a different object of a different class if the method is
 * defined in a common superclass of both objects.
 *
 */

class C {

	public function publicFunction()
	{
		echo "<p>public function defined in C</p>";

		$other = new D();
		$other->privateFunction(); // this will work
		$other->privateFunction2(); // this won't
	}

	private function privateFunction()
	{
		echo "<p>private function defined in C</p>";
	}

}

class D extends C {

	private function privateFunction2()
	{
		echo "<p>private function defined in D</p>";
	}

}

class E extends C {

}

$o = new E();
$o->publicFunction();

?>
