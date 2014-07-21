use strict;
use warnings;

use Data::Dumper;

sub title
{
  my $v = shift;
  print "\n\n\n\n$v\n\n";
}

sub observation
{
  my $v = shift;
  print "\n$v";
}



sub get_array {
	return ('a', 'b', 'c');
}

sub get_array_ref {
	return ['d', 'e', 'f'];
}



title("what the functions return");
print Dumper(get_array());
print Dumper(get_array_ref());



title("assign from array");
my ($x1, $y1, $z1) = get_array();
print Dumper($x1);
print Dumper($y1);
print Dumper($z1);



title("assign from array reference, naive attempt");
my ($x2, $y2, $z2) = get_array_ref();
print Dumper($x2);
print Dumper($y2);
print Dumper($z2);



title("assign from array reference, casting into array");
my ($x3, $y3, $z3) = @{get_array_ref()};
print Dumper($x3);
print Dumper($y3);
print Dumper($z3);

