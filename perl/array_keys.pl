use strict;
use Data::Dumper;

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



my @a1 = ("a", "b");
my @a2 = ("a", "b"); # same value, different reference
my @a3 = ("a", "c"); # different value (and different reference)
my @a4 = ("b", "a"); # different order
my @a5 = ();

my %m1 = ();
$m1{3} = ("dummy1", "dummy2");
$m1{5} = \@a1;



print "Content-Type: text/html\n\n";
print "<pre>";

title("a1");
arr_dump(@a1);

title("m1");
aar_dump(%m1);

title('"b" ~~ a1');
my $res = "b" ~~ @a1;
sca_dump($res);
observation("smart match string in array works");

title('a1 ~~ m1');
my $res = @a1 ~~ [values %m1];
sca_dump($res);
observation("smart match array in hash does not work");

title('grep madness a1 in m1');
my ($res) = grep { $m1{$_} eq \@a1 } keys %m1;
sca_dump($res);
observation("can find same array in hash");

title('grep madness a2 in m1');
my ($res) = grep { $m1{$_} eq \@a2 } keys %m1;
sca_dump($res);
observation("the hash actually stores the reference, so a different reference will not be a match");

print "</pre>";

