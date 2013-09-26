package C1;
sub new 
{
  my $class = shift;
  my $self = {
      _a1 => shift
  };
  # Print all the values just for clarification.
  print "a1 is $self->{_a1}\n";
  bless $self, $class;
  return $self;
}
sub setA1 {
    my ( $self, $a1 ) = @_;
    $self->{_a1} = $a1;
}
1;
