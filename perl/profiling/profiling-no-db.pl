use strict;
use warnings;

sub light_loop {
  my $a;
  for (my $i = 0; $i <= 10 * 1000; $i++) {
    $a = $i * $i;
  }
}

sub heavy_loop {
  my $a;
  for (my $i = 0; $i <= 100 * 1000; $i++) {
    $a = $i * $i;
  }
}

sub mid_tier {
  light_loop();
  heavy_loop();
}

sub top_tier {
  mid_tier();
}

top_tier();

print "Content-Type: text/html\n\n";
print "<p>Done</p>";

