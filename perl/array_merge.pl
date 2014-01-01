use strict;
use warnings;
use Data::Dumper;
use Hash::Merge qw( merge );

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



my @a0 = ();
my @a1 = ("red", "green");
my @a2 = ("red", "blue"); # repeated element "red"

my %m0 = ();

# composition of hashes http://docstore.mik.ua/orelly/perl3/prog/ch09_04.htm
my %m1 = (
		1000 => {
				"a11" => 111,
				"a12" => 112
    },
    1001 => {
				"b11" => 121,
				"b12" => 122
    },
    "asdf" => {
				"asdf11" => 131,
				"asdf12" => 132
    }
);

my %m2 = (
		1001 => { # repeated key
				"b11" => 121, # repeated key, repeated value
				"b12" => 222 # repeated key, different value
		},
		"asdf" => { # repeated key
				"asdf11" => 131, # repeated key, repeated value
				"asdf12" => 232 # repeated key, different value
    },
		1002 => {
				"c11" => 241,
				"c12" => 242
    }
);



print "Content-Type: text/html\n\n";
print "<pre>";

title("(a1, a2)");
my @merge = (@a1, @a2); # array and hash merge http://docstore.mik.ua/orelly/perl3/prog/ch09_04.htm
var_dump(\@merge);

title("(a0, a1)");
@merge = (@a0, @a1);
var_dump(\@merge);

title("(m1, m2)");
my %merge = (%m1, %m2);
var_dump(\%merge);
observation("numeric keys become string keys.");
observation("string keys of the second dimension are overwritten.");

title("Hash:Merge::merge(m1, m2) with RETAINMENT_PRECEDENT");
Hash::Merge::set_behavior('RETAINMENT_PRECEDENT');
%merge = %{ merge(\%m1, \%m2) };
var_dump(\%merge);
observation("numeric keys become string keys.");
observation("existing keys are merged.");

print "</pre>";

