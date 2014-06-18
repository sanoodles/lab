use strict;
use warnings;

use Time::Piece;
use Time::Seconds;
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



print "Content-Type: text/html\n\n";
print "<pre>";



title('today as ISO');
my $res1 = localtime->ymd;
var_dump($res1);

title('yesterday as ISO');
my $res2 = (Time::Piece->new - ONE_DAY)->ymd;
var_dump($res2);

title('last day of this month as ISO');
my $res3 = localtime->month_last_day;
var_dump($res3);

title('last day of given month as ISO');
my $res4 = Time::Piece->strptime("2014-02", "%Y-%m")->month_last_day;
var_dump($res4);



print "</pre>";

