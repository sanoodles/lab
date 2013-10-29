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
iobservation("Nothing is printed, and this error is generated: <q>PHP Notice:  Undefined offset: 3</q>");

title("current(a[0]) to access the first value of a hash without knowing the key");
print_r(current($a[0]));

echo "</pre>";

?>
