use strict;
use warnings;
use Data::Dumper;
use CGI; # for accessing HTTP stuff: http://perldoc.perl.org/CGI.html

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

my $q = CGI->new;

# how to print lots of HTML (or other thing)
# http://www.gossland.com/perlcourse/cgi_intro/printing
print <<EOF;
Content-Type: text/html

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Test to see the contents of form fields</title>
</head>
<body>
EOF

if ( $q->param("submit") )
{
  print "<h2>q->param()</h2>";
  print "<pre>";
  var_dump([$q->param()]);
  observation("Only square brackets seem to work to print the full param() array");
  print "</pre>";

  print "<h2>q->upload()</h2>";
  print "<pre>";
  my $filename = $q->param("file");
  var_dump($q->uploadInfo($filename));
  var_dump((-s $filename)); # http://stackoverflow.com/questions/2711860/
  print "</pre>";
}

print <<EOF;
<form method="post" enctype="multipart/form-data">
  <p>
    checkbox <input type="checkbox" name="checkbox">
  </p>
  <p>
    checkboxCheckedDisabled <input type="checkbox" name="checkboxCheckedDisabled" checked disabled>
  </p>
  <p>
    checkboxCheckedReadonly <input type="checkbox" name="checkboxCheckedReadonly" checked readonly>
  </p>
  <p>
    file <input type="file" name="file">
  </p>
  <p>
    submit <input type="submit" name="submit">
  </p>
</form>
</body>
</html>
EOF

