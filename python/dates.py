import pprint
import unittest

from datetime import date, timedelta
from calendar import monthrange



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



    title('today as ISO')
    res1 = str(date.today())
    var_export(res1)

    title('yesterday as ISO')
    res2 = str(date.today() - timedelta(days = 1))
    var_export(res2)

    title('last day of this month as ISO')
    res3 = monthrange(date.today().year, date.today().month)[1]
    var_export(res3)

    title('last day of given month as ISO')
    res4 = monthrange(2014, 2)[1]
    var_export(res4)



    o.append("</pre>")

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

