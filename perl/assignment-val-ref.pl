use strict;
use warnings;
use Data::Dumper;
use File::Basename;
use lib dirname(__FILE__);
use C1;

sub title
{
  my $v = shift;
  print "\n\n\n\n$v\n\n";
}

sub var_dump
{
  my $v = shift;
  print Dumper $v;
}

sub observation
{
  my $v = shift;
  print "\n$v";
}



print "Content-Type: text/html\n\n";
print "<pre>";

title("int");
my $int1 = 3;
var_dump($int1);
my @arr1 = ($int1);
var_dump(\@arr1);
$int1 = 5;
var_dump($int1);
var_dump(\@arr1);
observation("does not change <-> by value");

title("string");
my $str1 = "a";
var_dump($str1);
@arr1 = ($str1);
var_dump(\@arr1);
$str1 = "b";
var_dump($str1);
var_dump(\@arr1);
observation("does not change <-> by value");

title("array");
my @arr2 = ("a");
var_dump(\@arr2);
@arr1 = (@arr2);
var_dump(\@arr1);
push(@arr2, "b");
var_dump(\@arr2);
var_dump(\@arr1);
observation("assigning array between parentheses has no effect");
observation("does not change <-> by value");

title("reference to array");
@arr2 = ("a");
var_dump(\@arr2);
@arr1 = (\@arr2);
var_dump(\@arr1);
push(@arr2, "b");
var_dump(\@arr2);
var_dump(\@arr1);
observation("assigning array reference between parentheses nests it into array");
observation("changes <-> by reference");

title("hash");
my %aar1 = ("k1", "a");
var_dump(\%aar1);
@arr1 = (%aar1);
var_dump(\@arr1);
$aar1{"k1"} = "b";
var_dump(\%aar1);
var_dump(\@arr1);
observation("assigning hash between parenthesis flattens it to an array");
observation("does not change <-> by value");

title("reference to hash");
%aar1 = ("k1", "a");
var_dump(\%aar1);
@arr1 = (\%aar1);
var_dump(\@arr1);
$aar1{"k1"} = "b";
var_dump(\%aar1);
var_dump(\@arr1);
observation("assigning hash reference between parenthesis nests it into array");
observation("changes <-> by reference");

title("new object");
my $obj1 = new C1("a");
var_dump($obj1);
@arr1 = ($obj1);
var_dump(\@arr1);
$obj1 = new C1("b");
var_dump($obj1);
var_dump(\@arr1);
observation("does not change");

title("modified object");
$obj1 = new C1("a");
var_dump($obj1);
@arr1 = ($obj1);
var_dump(\@arr1);
$obj1->setA1("b");
var_dump($obj1);
var_dump(\@arr1);
observation("changes");

print "</pre>";

