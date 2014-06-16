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
my $s1 = "a";
my $s2 = "a\n";
my $s3 = "a\nb";
my $s4 = "\nb";



print "Content-Type: text/html\n\n";
print "<pre>";

title("count empty string");
my $res0 = () = $s0 =~ /\n/g;
var_dump($res0);

title("count no occurrences");
my $res1 = () = $s1 =~ /\n/g;
var_dump($res1);

title("count as sufix");
my $res2 = () = $s2 =~ /\n/g;
var_dump($res2);

title("count as infix");
my $res3 = () = $s3 =~ /\n/g;
var_dump($res3);

title("count as prefix");
my $res4 = () = $s4 =~ /\n/g;
var_dump($res4);

print "</pre>";

