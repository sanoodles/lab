import os, sys
sys.path.append(os.path.dirname(__file__))

import json
import random
from StrictlyTriangularMatrix import StrictlyTriangularMatrix
import unittest



o = [] # output

def title(v):  
    o.append("\n\n\n\n" + v + "\n")

def observation(v):
    o.append("\n\n" + v)

def var_dump(v):
    o.append("\n" +json.dumps(v, indent=4))

MAX_MATCH_DISTANCE = 2;

dic = {
    "a": 10,
    "b": 20,
    "c": 30,
    "d": 40
};
 
def some_aggregation():
  return random.randint(1, 4)

def getDistanceIsAMatchFunction(maxMatchDistance):
  def distanceIsAMatch(distance):
    return distance <= maxMatchDistance
  return distanceIsAMatch

# wsgi header
def application(environ, start_response):
    status = '200 OK'

    o.append('<table><tr><td><pre>')
    title("Strictly triangular matrix")
    stm = StrictlyTriangularMatrix.createFromDict(dic, some_aggregation)
    var_dump(stm)

    o.append('</pre></td><td style="padding-left: 2em; vertical-align: top;"><pre>')

    title("Filtered strictly triangular matrix")
    filteredStm = StrictlyTriangularMatrix.filter(stm, getDistanceIsAMatchFunction(MAX_MATCH_DISTANCE))
    var_dump(filteredStm)
    o.append("</pre></td></tr></table>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

class UnitTests(unittest.TestCase):
    def testA(self):
      stm = StrictlyTriangularMatrix.createFromDict(dic, some_aggregation)
      isFirstElement = True
      for key in dic.keys():
        if (isFirstElement):
          isFirstElement = False
          continue
        self.assertTrue(key in stm)

    def testB(self):
      stm = StrictlyTriangularMatrix.createFromDict(dic, some_aggregation)
      filteredStm = StrictlyTriangularMatrix.filter(stm, getDistanceIsAMatchFunction(MAX_MATCH_DISTANCE))
      for ki, row in filteredStm.iteritems():
        for kj, v, in row.iteritems():
          self.assertLessEqual(v, MAX_MATCH_DISTANCE)

if __name__  == '__main__':
    unittest.main() 

