use strict;
use warnings;
use Data::Dumper;

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



my $s0 = "";
my $s1 = "asdf,qwer";
my $s2 = "asdf,";
my $s3 = ",qwer";
my $s4 = "asdf";



print "Content-Type: text/html\n\n";
print "<pre>";

title('vanilla split');
my @res = split(",", $s1);
var_dump(\@res);

title('split empty string');
@res = split(",", $s0);
var_dump(\@res);
observation("no positions are returned.");

title('split on delimiter at the end');
@res = split(",", $s2);
var_dump(\@res);
observation("no ending position is returned.");

title('split on delimiter at the beginning');
@res = split(",", $s3);
var_dump(\@res);
observation("initial position, with an empty string, is returned.");

title('split on no delimiter');
@res = split(",", $s4);
var_dump(\@res);
observation("");

print "</pre>";

