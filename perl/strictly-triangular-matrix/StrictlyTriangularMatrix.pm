=pod
Methods for using PHP matrices as strictly lower triangular matrices.

They allow users to abstract from the bulky iteration syntax needed
for this data type (two nested fors, and the diagonal test).

The keys of the arrays and matrices involved in the operations are
preserved.
=cut
package StrictlyTriangularMatrix;

use strict;
use warnings;

sub createFromMap {
  my $map = shift;
  my $aggregationFunction = shift;

  my %res;
  foreach my $ki (keys $map)
  {
    foreach my $kj (keys $map)
    {
      if ( $ki eq $kj )
      {
        last;
      }
      $res{$ki}{$kj} = &$aggregationFunction($map->{$ki}, $map->{$kj});
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

