import pprint

o = [] # output

def title(v):  
    o.append("\n\n\n\n" + v + "\n")

def observation(v):
    o.append("\n\n" + v)

def var_dump(v):
    o.append("\n" + pprint.pformat(v))

class C1:
    def __init__(self, v):
        self.a1 = v
    def __repr__(self):
        return self.a1
    def setA1(self, v):
        self.a1 = v

# wsgi header
def application(environ, start_response):
    status = '200 OK'
    o.append("<pre>")

    title("int")
    int1 = 3
    var_dump(int1)
    arr1 = [int1]
    var_dump(arr1)
    int1 = 5
    var_dump(int1)
    var_dump(arr1)
    observation("does not change <-> by value")

    title("str")
    str1 = "a"
    var_dump(str1)
    arr1 = [str1]
    var_dump(arr1)
    str1 = "b"
    var_dump(str1)
    var_dump(arr1)
    observation("does not change <-> by value")

    title("list")
    arr2 = ["a"]
    var_dump(arr2)
    arr1 = [arr2]
    var_dump(arr1)
    arr2.append("b")
    var_dump(arr2)
    var_dump(arr1)
    observation("changes <-> by reference")

    title("dict")
    map1 = {"k1": "a"}
    var_dump(map1)
    arr1 = [map1]
    var_dump(arr1)
    map1["k1"] = "b"
    var_dump(map1)
    var_dump(arr1)
    observation("changes <-> by reference")

    title("new object")
    obj1 = C1("a")
    var_dump(obj1)
    arr1 = [obj1]
    var_dump(arr1)
    obj1 = C1("b")
    var_dump(obj1)
    var_dump(arr1)
    observation("does not change")

    title("modified object")
    obj1 = C1("a")
    var_dump(obj1)
    arr1 = [obj1]
    var_dump(arr1)
    obj1.setA1("b")
    var_dump(obj1)
    var_dump(arr1)
    observation("changes")

    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o


