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
    o.append("<pre>")

    a = [
        {
            "a": 10,
            "b": 20
        }
    ]
    
    title("a")
    var_dump(a)

    title("a[0]")
    var_dump(a[0])

    title("a[0][3]")
    # var_dump(a[0][3])
    observation("An exception and this error would be generated: <q>KeyError: 3</q>")

    # TODO
    title("a[0][a[0].keys()[0]] to access the first value of a dictionary without knowing the key")
    var_dump(a[0][a[0].keys()[0]])

    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

