import pprint

o = [] # output

def title(v):  
    o.append("\n\n\n\n" + v + "\n")

def observation(v):
    o.append("\n\n" + v)

def var_dump(v):
    o.append("\n" + pprint.pformat(v))

# wsgi header
def application(environ, start_response):
    status = '200 OK'
    

    
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



    o.append("<pre>")

    title("a1")
    var_dump(a1)

    title("m1")
    var_dump(m1)

    title("b in a1")
    res = 'b' in a1
    var_dump(res)
    observation("vanilla in")
    
    title("a1 in m1")
    res = a1 in m1
    var_dump(res)
    observation("can find same array in matrix")

    title("a2 in m1")
    res = a2 in m1
    var_dump(res)
    observation("different array with same values is evaluated as a hit. so it works by value.")

    title("a3 in m1")
    res = a3 in m1
    var_dump(res)
    observation("different array with different values is evaluated as a miss. of course.")

    a1.reverse()

    title("a1")
    var_dump(a1)

    title("m1")
    var_dump(m1)
    observation("value appears changed in the matrix as well. works by reference.")

    title("a1 in m1")
    res = a1 in m1
    var_dump(res)
    observation("the array is also found this time.")

    o.append("</pre>")



# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

