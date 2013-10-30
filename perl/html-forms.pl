use strict;
use Data::Dumper;
use CGI; # for accessing HTTP stuff: http://perldoc.perl.org/CGI.html

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
  arr_dump($q->param());
  print "</pre>";

  print "<h2>q->upload()</h2>";
  print "<pre>";
  my $filename = $q->param("file");
  arr_dump($q->uploadInfo($filename));
  sca_dump((-s $filename)); # http://stackoverflow.com/questions/2711860/
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

