use strict;
use warnings;
use Data::Dumper;
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



my $s0 = "";
my $s1 = "asdf,qwer";
my $s2 = "asdf,";
my $s3 = ",qwer";
my $s4 = "asdf";



print "Content-Type: text/html\n\n";
print "<pre>";

title('vanilla split');
my @res = split(",", $s1);
is_deeply(\@res, ['asdf', 'qwer']);

title('split empty string');
@res = split(",", $s0);
is_deeply(\@res, []);
observation("no positions are returned.");

title('split on delimiter at the end');
@res = split(",", $s2);
is_deeply(\@res, ['asdf']);
observation("no ending position is returned.");

title('split on delimiter at the beginning');
@res = split(",", $s3);
is_deeply(\@res, ['', 'qwer']);
observation("initial position, with an empty string, is returned.");

title('split on no delimiter');
@res = split(",", $s4);
is_deeply(\@res, ['asdf']);
observation("");

done_testing();

print "</pre>";

