package Foo;

use strict;
use warnings;

require "bar.pl";


sub foo_function {
	bar_function();
}

1;

