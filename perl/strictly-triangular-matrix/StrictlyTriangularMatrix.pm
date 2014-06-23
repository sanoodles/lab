=pod
Methods for using Perl matrices as strictly lower triangular matrices.

They allow users to abstract from the bulky iteration syntax needed
for this data type (two nested fors, and the diagonal test).

The keys of the arrays and matrices involved in the operations are
preserved.

The ability to createFromMapAndFilter at once was created as 
performance optimization to the otherwise sequence of calls to
createFromMap and filter.
=cut
package StrictlyTriangularMatrix;

use strict;
use warnings;

sub createFromMap {
  my $map = shift;
  my $aggregationFunction = shift;

  return _createFromMap($map, $aggregationFunction, undef);
}

sub createFromMapAndFilter {
  my $map = shift;
  my $aggregationFunction = shift;
  my $testFunction = shift;

  return _createFromMap($map, $aggregationFunction, $testFunction);
}

sub _createFromMap {
  my $map = shift;
  my $aggregationFunction = shift;
  my $testFunction = shift;

  my %res;
  my $aggregationResult;
  foreach my $ki (keys $map)
  {
    foreach my $kj (keys $map)
    {
      if ( $ki eq $kj )
      {
        last;
      }
      $aggregationResult = &$aggregationFunction($map->{$ki}, $map->{$kj});
      if (not defined $testFunction or &$testFunction($aggregationResult)) {
        $res{$ki}{$kj} = $aggregationResult;
      }
    }
  }
  return \%res;
}

sub filter {
  my $STM = shift;
  my $testFunction = shift;

  my %res;
  while ((my $ki, my $row) = each $STM)
  {
    while ((my $kj, my $v) = each %{$row})
    {
      if ( $ki eq $kj )
      {
        last;
      }
      if ( &$testFunction($v) )
      {
        $res{$ki}{$kj} = $v;
      }
    }
  }
  return \%res;
}

1;

