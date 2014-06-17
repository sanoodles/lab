import pprint
import unittest

o = [] # output
s0 = ""
s1 = "a"
s2 = "\n"
s3 = "a\nb"
s4 = "\nb"

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

    title('count empty string')
    res0 = s0.count("\n")
    var_export(res0)

    title('count empty string')
    res1 = s1.count("\n")
    var_export(res1)

    title('count empty string')
    res2 = s2.count("\n")
    var_export(res2)


    title('count empty string')
    res3 = s3.count("\n")
    var_export(res3)


    title('count empty string')
    res4 = s4.count("\n")
    var_export(res4)

    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

