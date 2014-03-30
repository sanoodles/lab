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
is_deeply(\@a, [
          {
            'a' => 10,
            'b' => 20
          }
        ]);

title("a[0]");
is_deeply($a[0], {
          'a' => 10,
          'b' => 20
        });

title("a[0]{'a'}");
is($a[0]{"a"}, 10);

title("a[0][3]");
is($a[0]{3}, undef);
observation("No error is generated. The read value is <q>undef</q>.");

# http://stackoverflow.com/questions/7028145/find-key-name-in-hash-with-only-one-key
# http://www.perlmonks.org/?node_id=187772
title("a[0]{(keys a[0])[0]} to access the first value of a hash without knowing the key");
is($a[0]{(keys $a[0])[0]}, 10);

done_testing();

print "</pre>";

