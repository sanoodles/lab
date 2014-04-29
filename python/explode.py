import pprint
import unittest

o = [] # output
s0 = ""
s1 = "asdf,qwer"
s2 = "asdf,"
s3 = ",qwer"
s4 = "asdf"

def title(v):
    o.append("\n\n\n\n" + v + "\n")

def observation(v):
    o.append("\n\n" + v)

def var_export(v):
    o.append("\n" + pprint.pformat(v))

def vanillaSplit():
    return s1.split(",")

def splitEmptyString():
    return s0.split(",")

def explodeDelitAtEnd():
    return s2.split(",")

def explodeDelitAtBeg():
    return s3.split(",")

def explodeNoDelit():
    return s4.split(",")

# wsgi header
def application(environ, start_response):
    status = '200 OK'

    o.append("<pre>")

    title('vanilla split')
    res = vanillaSplit()
    var_export(res)

    title('split empty string')
    res = splitEmptyString()
    var_export(res)

    title('explode on delimiter at the end')
    res = explodeDelitAtEnd()
    var_export(res)

    title('explode on delimiter at the beginning')
    res = explodeDelitAtBeg()
    var_export(res)

    title('explode on no delimiter')
    res = explodeNoDelit()
    var_export(res)

    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

class UnitTests(unittest.TestCase):
    def testA(self):
        self.assertEqual(vanillaSplit(), ['asdf', 'qwer'])

    def testB(self):
        self.assertEqual(splitEmptyString(), [''])

    def testC(self):
        self.assertEqual(explodeDelitAtEnd(), ['asdf', ''])

    def testD(self):
        self.assertEqual(explodeDelitAtBeg(), ['', 'qwer'])

    def testE(self):
        self.assertEqual(explodeNoDelit(), ['asdf'])

if __name__  == '__main__':
    unittest.main()
