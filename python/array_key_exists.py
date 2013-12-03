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

    d1 = {}
    d1["k1"] = "v1"
    d1["k2"] = "v2"

    o.append("<pre>")

    title("d1")
    var_dump(d1)

    title("k2 in d1")
    res = 'k2' in d1
    var_dump(res)
    observation("vanilla in")
    
    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

