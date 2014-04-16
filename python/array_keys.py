import pprint
import unittest

o = [] # output

a1 = ["a", "b"];
a2 = ["a", "b"] # same value, different reference
a3 = ["a", "c"] # different value (and different reference)
a4 = ["b", "a"] # different order

m1 = []

'''
some dummy value is put at position 3 to act as an arbitrary offset 
that ensures that tests do not work just for the corner 
case of the needle being at first position of the haystack
'''  
m1.insert(3, ["dummy1", "dummy2"])
m1.insert(5, a1)



def title(v):  
    o.append("\n\n\n\n" + v + "\n")

def observation(v):
    o.append("\n\n" + v)

def var_dump(v):
    o.append("\n" + pprint.pformat(v))

def vanillaIn():
    return 'b' in a1

def canFindSameArrayInMatrix():
    return a1 in m1

def hitDifferentArraySameValues():
    return a2 in m1

def missDifferentArrayDifferentValues():
    return a3 in m1

def findArrayAfterReverse():
    return a1 in m1



# wsgi header
def application(environ, start_response):
    status = '200 OK'
    
    o.append("<pre>")

    title("a1")
    var_dump(a1)

    title("m1")
    var_dump(m1)

    title("b in a1")
    res = vanillaIn()
    var_dump(res)
    observation("vanilla in")
    
    title("a1 in m1")
    res = canFindSameArrayInMatrix()
    var_dump(res)
    observation("can find same array in matrix")

    title("a2 in m1")
    res = hitDifferentArraySameValues()
    var_dump(res)
    observation("different array with same values is evaluated as a hit. so it works by value.")

    title("a3 in m1")
    res = missDifferentArrayDifferentValues()
    var_dump(res)
    observation("different array with different values is evaluated as a miss. of course.")

    a1.reverse()

    title("a1")
    var_dump(a1)

    title("m1")
    var_dump(m1)
    observation("value appears changed in the matrix as well. works by reference.")

    title("a1 in m1")
    res = findArrayAfterReverse()
    var_dump(res)
    observation("the array is also found this time.")

    o.append("</pre>")



# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

class UnitTests(unittest.TestCase):
  def testA(self):
    self.assertTrue(vanillaIn())
  
  def testB(self):
    self.assertTrue(canFindSameArrayInMatrix())

  def testC(self):
    self.assertTrue(hitDifferentArraySameValues())

  def testD(self):
    self.assertFalse(missDifferentArrayDifferentValues())
  
  def testE(self):
    a1.reverse()
    self.assertTrue(findArrayAfterReverse())

if __name__  == '__main__':
  unittest.main()

