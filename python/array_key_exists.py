import pprint
import unittest

o = [] # output
d1 = {}
d1["k1"] = "v1"
d1["k2"] = "v2"

def title(v):  
    o.append("\n\n\n\n" + v + "\n")

def observation(v):
    o.append("\n\n" + v)

def var_dump(v):
    o.append("\n" + pprint.pformat(v))

def vanillaIn():
    return 'k2' in d1

# wsgi header
def application(environ, start_response):
    status = '200 OK'

    o.append("<pre>")

    title("d1")
    var_dump(d1)

    title("k2 in d1")
    res = vanillaIn()
    var_dump(res)
    observation("vanilla in")
    
    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

class UnitTests(unittest.TestCase):
  def testOne(self):
    self.assertTrue(vanillaIn())

if __name__  == '__main__':
  unittest.main()

