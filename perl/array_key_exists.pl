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

my $hashref1 = {
  "k1" => "v1",
  "k2" => "v2"
};

my %hashval1 = (
  "k1" => "v1",
  "k2" => "v2"
);

print "Content-Type: text/html\n\n";
print "<pre>";

title("exists hashref1->{'k2'}");
my $res = exists $hashref1->{'k2'};
sca_dump($res);
observation("If exists, returns number one");

title("exists hashref1->{'nonono'}");
my $res = exists $hashref1->{'nonono'};
sca_dump($res);
observation("If does not exist, returns empty string");

title("exists hashval1->{'k2'}");
my $res = exists %hashval1->{'k2'};
sca_dump($res);
observation("The same over a hash value.");

title("exists hashval1->{'nonono'}");
my $res = exists %hashval1->{'nonono'};
sca_dump($res);
observation("The same over a hash value.");

title("shorter syntax: exists hashref1{k2}");
my $res = exists $$hashref1{k2};
sca_dump($res);
observation("same");

title("shorter syntax: exists hashref1{'nonono'}");
my $res = exists $$hashref1{nonono};
sca_dump($res);
observation("same");

title("shorter syntax: exists hashval1{'k2'}");
my $res = exists $hashval1{'k2'};
sca_dump($res);
observation("same");

title("shorter syntax: exists hashval1{'nonono'}");
my $res = exists $hashval1{'nonono'};
sca_dump($res);
observation("same");



print "</pre>";

