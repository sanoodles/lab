use strict;
use warnings;

use DBI;
use Carp;
use Credentials qw(DB_NAME DB_HOST DB_USER DB_PASS);

sub light_query {
  my $st = qq{
    SELECT *
    FROM table1, table2
  };
  my $sth = $main::dbh->prepare($st);
  $sth->execute();
  while (my $row = $sth->fetchrow_hashref) {

  }
}

sub heavy_query {
  my $st = qq{
    SELECT *
    FROM table1, table2
    ORDER BY table1.field1
  };
  my $sth = $main::dbh->prepare($st);
  $sth->execute();
  while (my $row = $sth->fetchrow_hashref) {

  }
}

sub mid_tier {
  light_query();
  heavy_query();
}

sub top_tier {
  mid_tier();
}

our $dbh = DBI->connect(
    "dbi:Pg:dbname=" . DB_NAME . ";" .
    "host=" . DB_HOST . ";",
    DB_USER, 
    DB_PASS) or croak $DBI::errstr;

top_tier();

print "Content-Type: text/html\n\n";
print "<p>Done</p>";

