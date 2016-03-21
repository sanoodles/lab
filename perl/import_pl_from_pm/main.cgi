use File::Basename;
use lib dirname(__FILE__);
use Foo;

print "Content-type: text/plain\n\n";

Foo::foo_function();

