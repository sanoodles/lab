import pprint
import unittest

o = [] # output
a = [
    {
        "a": 10,
        "b": 20
    }
]

def title(v):  
    o.append("\n\n\n\n" + v + "\n")

def observation(v):
    o.append("\n\n" + v)

def var_dump(v):
    o.append("\n" + pprint.pformat(v))

# wsgi header
def application(environ, start_response):
    status = '200 OK'
    o.append("<pre>")
   
    title("a")
    var_dump(a)

    title("a[0]")
    var_dump(a[0])

    title("a[0][3]")
    # var_dump(a[0][3])
    observation("An exception and this error would be generated: <q>KeyError: 3</q>")

    title("a[0][a[0].keys()[0]] to access the first value of a dictionary without knowing the key")
    var_dump(a[0][a[0].keys()[0]])

    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

class UnitTests(unittest.TestCase):
    def testA(self):
      self.assertEqual(a, [{'a': 10, 'b': 20}])

    def testB(self):
      self.assertEqual(a[0], {'a': 10, 'b': 20})

    def testC(self):
      with self.assertRaises(KeyError):
        a[0][3]

    def testD(self):
      self.assertEqual(a[0][a[0].keys()[0]], 10)

if __name__  == '__main__':
    unittest.main() 
