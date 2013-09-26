use Data::Dumper;
use File::Basename;
use lib dirname(__FILE__);
use C1;

sub title
{
  my $v = shift;
  print "\n\n\n\n$v\n\n";
}

sub sca_dump
{
  my $v = shift;
  print Dumper $v;
}

sub arr_dump
{
  print "array {\n";
  my @v = @_;
  print Dumper @v;
  print "}\n";
}

sub aar_dump
{
  print "associative array {\n";
  my %v = @_;
  print Dumper %v;
  print "}\n";
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
sca_dump($int1);
my @arr1 = ($int1);
arr_dump(@arr1);
$int1 = 5;
sca_dump($int1);
arr_dump(@arr1);
observation("does not change <-> by value");

title("string");
my $str1 = "a";
sca_dump($str1);
my @arr1 = ($str1);
arr_dump(@arr1);
$str1 = "b";
sca_dump($str1);
arr_dump(@arr1);
observation("does not change <-> by value");

title("array");
my @arr2 = ("a");
arr_dump(@arr2);
my @arr1 = (@arr2);
arr_dump(@arr1);
push(@arr2, "b");
arr_dump(@arr2);
arr_dump(@arr1);
observation("does not change <-> by value");

title("map");
my %map1 = ("k1", "a");
aar_dump(%map1);
my @arr1 = (%map1);
arr_dump(@arr1);
$map1{"k1"} = "b";
aar_dump(%map1);
arr_dump(@arr1);
observation("does not change <-> by value");

title("new object");
my $obj1 = new C1("a");
=pod
sca_dump($obj1);
my @arr1 = array(@obj1);
arr_dump(@arr1);
$obj1 = new C1("b");
sca_dump($obj1);
arr_dump(@arr1);
observation("does not change");

=pod
title("modified object");
$obj1 = new C1("a");
var_dump($obj1);
$arr1 = array($obj1);
var_dump($arr1);
$obj1->setA1("b");
var_dump($obj1);
var_dump($arr1);
observation("changes");
=cut

print "</pre>";

