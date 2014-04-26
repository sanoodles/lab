import pprint
import unittest

class C1:
    def __init__(self, v):
        self.a1 = v
    def __repr__(self):
        return self.a1
    def __eq__(self, other):
        return self.__dict__ == other.__dict__
    def __ne__(self, other):
        return self.__dict__ != other.__dict__
    def setA1(self, v):
        self.a1 = v

o = [] # output

def title(v):  
    o.append("\n\n\n\n" + v + "\n")

def observation(v):
    o.append("\n\n" + v)

def var_dump(v):
    o.append("\n" + pprint.pformat(v))

def assignInt():
    int1 = 3
    arr1 = [int1]
    int1 = 5
    return arr1

def assignStr():
    str1 = "a"
    arr1 = [str1]
    str1 = "b"
    return arr1

def assignList():
    arr2 = ["a"]
    arr1 = [arr2]
    arr2.append("b")
    return arr1

def assignDict():
    map1 = {"k1": "a"}
    arr1 = [map1]
    map1["k1"] = "b"
    return arr1

def assignNewObject():
    obj1 = C1("a")
    arr1 = [obj1]
    obj1 = C1("b")
    return arr1

def assignModifiedObject():
    obj2 = C1("a")
    arr1 = [obj2]
    obj2.setA1("b")
    return arr1 

# wsgi header
def application(environ, start_response):
    status = '200 OK'
    o.append("<pre>")

    title("int")
    arr = assignInt()
    var_dump(arr)
    observation("does not change <-> by value")

    title("str")
    arr = assignStr()
    var_dump(arr)
    observation("does not change <-> by value")

    title("list")
    arr = assignList()
    var_dump(arr)
    observation("changes <-> by reference")

    title("dict")
    arr = assignDict()
    var_dump(arr)
    observation("changes <-> by reference")

    title("new object")
    arr = assignNewObject()
    var_dump(arr)
    observation("does not change")

    title("modified object")
    arr = assignModifiedObject()
    var_dump(arr)
    observation("changes")

    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

class UnitTests(unittest.TestCase):
  def testA(self):
    self.assertEqual(assignInt(), [3])
  def testB(self):
    self.assertEqual(assignStr(), ['a'])
  def testC(self):
    self.assertEqual(assignList(), [['a', 'b']])
  def testD(self):
    self.assertEqual(assignDict(), [{'k1': 'b'}])
  def testE(self):
    self.assertEqual(assignNewObject(), [C1('a')])
  def testF(self):
    self.assertEqual(assignModifiedObject(), [C1('b')])

if __name__  == '__main__':
  unittest.main()

