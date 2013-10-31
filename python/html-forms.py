import pprint
import os
from webob import Request 
  # http://docs.webob.org/en/latest/index.html#request
  # sudo apt-get install python-webob

def title(o, v):  
    o.append("\n\n\n\n" + v + "\n")

def observation(o, v):
    o.append("\n\n" + v)

def var_dump(o, v):
    o.append("\n" + pprint.pformat(v))

# wsgi header
def application(environ, start_response):
    status = '200 OK'
    o = [] # output
    o.append(
'''<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Test to see the contents of form fields</title>
</head>
<body>
''')

    if (environ['REQUEST_METHOD'] == 'POST'):
        o.append("<h2>webob.Request(environ).params.items()</h2><pre>")
        req = Request(environ)
        var_dump(o, req.params.items())
        if req.params.get("file") != "":
            uploadedFile = req.params.get("file").file
            uploadedFile.seek(0, os.SEEK_END)
            uploadedFileSize = uploadedFile.tell()
            var_dump(o, uploadedFileSize)
        o.append("</pre>")

    o.append(
'''<form method="post" enctype="multipart/form-data">
  <p>
    checkbox <input type="checkbox" name="checkbox">
  </p>
  <p>
    checkboxCheckedDisabled <input type="checkbox" name="checkboxCheckedDisabled" checked disabled>
  </p>
  <p>
    checkboxCheckedReadonly <input type="checkbox" name="checkboxCheckedReadonly" checked readonly>
  </p>
  <p>
    file <input type="file" name="file">
  </p>
  <p>
  submit <input type="submit" name="submit">
  </p>
</form>
</body>
</html>
''')

# wsgi footer
    response_headers = [('Content-type', 'text/html')]
    start_response(status, response_headers)
    return o

