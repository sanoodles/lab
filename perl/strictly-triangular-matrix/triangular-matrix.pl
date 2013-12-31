package main;
use strict;
use warnings;
use Data::Dumper;
require 'StrictlyTriangularMatrix.class.pl';

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

my $MAX_MATCH_DISTANCE = 2;

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

title('Strictly triangular matrix');
my $stm = StrictlyTriangularMatrix::createFromMap($map, 'main::some_aggregation');
var_dump($stm);

print "</pre></td><td style='padding-left: 2em; vertical-align: top;'><pre>";

title('Filtered strictly triangular matrix');
my $filteredStm = StrictlyTriangularMatrix::filter($stm, getIsDistanceAMatchFunction($MAX_MATCH_DISTANCE));
var_dump($filteredStm);

print "</pre></td></tr></table>";

