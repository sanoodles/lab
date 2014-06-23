package main;
use strict;
use warnings;
use Data::Dumper;
use File::Basename;
use lib dirname(__FILE__);
use StrictlyTriangularMatrix;
use Test::More;

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



use constant MAX_MATCH_DISTANCE => 2;

my $map = {
  a => '10',
  b => '20',
  c => '30',
  d => '40'
};

# @return int A random integer between 1 and 4
sub some_aggregation {
  return int(rand(4)) + 1;
}



=pod
Explanation to make some sense of this example.
Suppose we are using the STM to store distances betwen
locations. This function would filter the pairs of 
locations with a distance in between below $maxMatchDistance.
=cut
sub getIsDistanceAMatchFunction {
  my $maxMatchDistance = shift;
  return sub
  {
    my $distance = shift;
    return $distance <= $maxMatchDistance;
  }
}

print "Content-Type: text/html\n\n";
print "<table><tr><td><pre>";

title('Create STM from map');
my $stm = StrictlyTriangularMatrix::createFromMap($map, \&some_aggregation); # http://perldoc.perl.org/perlref.html
var_dump($stm);
my $isFirstElement = 1;
foreach my $key (keys $map)
{
  if ($isFirstElement) {
    $isFirstElement = 0;
    next;
  }
  ok(exists $stm->{$key});
}

print "</pre></td><td style='padding-left: 2em; vertical-align: top;'><pre>";

title('Filter STM');
my $filteredStm = StrictlyTriangularMatrix::filter($stm, getIsDistanceAMatchFunction(MAX_MATCH_DISTANCE));
var_dump($filteredStm);
while ((my $ki, my $row) = each $filteredStm)
{
  while ((my $kj, my $v) = each %{$row})
  {
    ok($v <= MAX_MATCH_DISTANCE);
  }
}

title('Create filtered STM from map');
$filteredStm = StrictlyTriangularMatrix::createFromMapAndFilter($map, 
		\&some_aggregation, 
		getIsDistanceAMatchFunction(MAX_MATCH_DISTANCE)
);
var_dump($filteredStm);
while ((my $ki, my $row) = each $filteredStm)
{
  while ((my $kj, my $v) = each %{$row})
  {
    ok($v <= MAX_MATCH_DISTANCE);
  }
}

done_testing();

print "</pre></td></tr></table>";

