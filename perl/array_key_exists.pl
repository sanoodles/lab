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

my $hashref1 = {
  "k1" => "v1",
  "k2" => "v2"
};

my %hashval1 = (
  "k1" => "v1",
  "k2" => "v2"
);

my $res;



print "Content-Type: text/html\n\n";
print "<pre>";

title("exists hashref1->{'k2'}");
$res = exists $hashref1->{'k2'};
ok($res eq 1, "If exists, returns number one");

title("exists hashref1->{'nonono'}");
$res = exists $hashref1->{'nonono'};
ok($res eq '', "If does not exist, returns empty string");

title("exists hashval1->{'k2'}");
$res = exists $%{hashval1}->{'k2'};
ok($res eq '', "The same over a hash value");
observation("\$%{...} syntax to avoid 'Using a hash as a reference is deprecated'");

title("exists hashval1->{'nonono'}");
$res = exists $%{hashval1}->{'nonono'};
ok($res eq '', "The same over a hash value");

title("shorter syntax like exists hashref1{k2}");
$res = exists $$hashref1{k2};
ok($res eq 1);
$res = exists $$hashref1{nonono};
ok($res eq '');
$res = exists $hashval1{k2};
ok($res eq 1);
$res = exists $hashval1{nonono};
ok($res eq '');
observation("same");

done_testing();

print "</pre>";

