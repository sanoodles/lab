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



# composition of hashes http://docstore.mik.ua/orelly/perl3/prog/ch09_04.htm
# perl data structures cookbook http://perldoc.perl.org/perldsc.html
my @a = (
  {
    a => 10, 
    b => 20
  }
);



print "Content-Type: text/html\n\n";
print "<pre>";

title("a");
var_dump(\@a);

title("a[0]");
var_dump($a[0]);

title("a[0]{'a'}");
var_dump($a[0]{"a"});

title("a[0][3]");
var_dump($a[0]{3});
observation("No error is generated. The read value is <q>undef</q>.");

# http://stackoverflow.com/questions/7028145/find-key-name-in-hash-with-only-one-key
# http://www.perlmonks.org/?node_id=187772
title("a[0]{(keys a[0])[0]} to access the first value of a hash without knowing the key");
var_dump($a[0]{(keys $a[0])[0]});



print "</pre>";

