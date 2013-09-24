import pprint

o = [] # output

def title(v):
    o.append("\n\n\n\n" + v + "\n")

def observation(v):
    o.append("\n\n" + v)

def var_export(v):
    o.append("\n" + pprint.pformat(v))

# wsgi header
def application(environ, start_response):
    status = '200 OK'

    o.append("<pre>")

    s0 = ""
    s1 = "asdf,qwer"
    s2 = "asdf,"
    s3 = ",qwer"
    s4 = "asdf"

    title('vanilla split')
    res = s1.split(",")
    var_export(res)

    title('split empty string')
    res = s0.split(",")
    var_export(res)

    title('explode on delimiter at the end')
    res = s2.split(",")
    var_export(res)

    title('explode on delimiter at the beginning')
    res = s3.split(",")
    var_export(res)

    title('explode on no delimiter')
    res = s4.split(",")
    var_export(res)

    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

