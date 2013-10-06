use strict;
use Data::Dumper;
use Hash::Merge qw( merge );

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

sub hash_merge_recursive
{
  my $a1 = shift;
  my $a2 = shift;

  my %res = ();

  if ( ref($a1) ne "HASH" or
      ref($a2) ne "HASH" )
  {
    # assuming they are scalars
    return ($a1, $a2); # dereferencing http://www.perlmeme.org/howtos/using_perl/dereferencing.html
  }

  while (my($k, $v) = each %$a1)
  {
    $res{$k} = $v;
  }

  while (my($k, $v) = each %$a2)
  {
    if (exists $res{$k})
    {
      $res{$k} = hash_merge_recursive(%res, $a2->{$k});
    } else
    {
      $res{$k} = $a2->{$k};
    }
  }

  return %res;
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
arr_dump(@merge);

title("(a0, a1)");
@merge = (@a0, @a1);
arr_dump(@merge);

title("(m1, m2)");
my %merge = (%m1, %m2);
aar_dump(%merge);
observation("numeric keys become string keys.");
observation("string keys of the second dimension are overwritten.");

title("Hash:Merge::merge(m1, m2) with RETAINMENT_PRECEDENT");
Hash::Merge::set_behavior('RETAINMENT_PRECEDENT');
%merge = %{ merge(\%m1, \%m2) };
aar_dump(%merge);
observation("numeric keys become string keys.");
observation("existing keys are merged.");

print "</pre>";

