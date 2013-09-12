import pprint

# wsgi header
def application(environ, start_response):
    status = '200 OK'
    o = '' # output



    a0 = []
    a1 = ["red", "green"]
    a2 = ["red", "blue"]

    m0 = []
    m1 = {
        1000: {
          'a11': 111,
          'a12': 112
        },
        1001: {
          'b11': 121,
          'b12': 122
        },
        'asdf': {
          'asdf11': 131,
          'asdf12': 132
        }
    }
    m2 = {
        1001: { # repeated key
          'b11': 121, # repeated key, repeated value
          'b12': 222 # repeated key, different value
        },
        'asdf': {
          'asdf11': 131, # repeated key, repeated value
          'asdf12': 232 # repeated key, different value
        },
        1002: {
          'c11': 241,
          'c12': 242
        }
    }



    o += "<pre>"

    o += "\n\n\n\na1 + a2\n\n"
    merge = a1 + a2
    o += pprint.pformat(merge)

    o += "\n\n\n\na0 + a1\n\n"
    merge = a0 + a1
    o += pprint.pformat(merge)

    o += "\n\n\n\nm1.copy(), .update(m2)\n\n"
    merge = m1.copy()
    merge.update(m2)
    o += pprint.pformat(merge)
    o += "\nnumeric keys are preserved"
    o += "\nexisting keys are overwritten"

    ''' TODO
    o += "\n\n\n\nrecursive merge\n\n"
    merge = m1.copy()
    mergedicts(merge, m2)
    o += pprint.pformat(merge)
    '''


    o += "</pre>"



# wsgi footer
    response_headers = [('Content-type', 'text/html'),
                        ('Content-Length', str(len(o)))]
    start_response(status, response_headers)
    return [o]

# http://stackoverflow.com/questions/7204805/python-dictionaries-of-dictionaries-merge
def mergedicts(dict1, dict2):
    for k in set(dict1.keys()).union(dict2.keys()):
        if k in dict1 and k in dict2:
            yield (k, dict(mergedicts(dict1[k], dict2[k])))
        elif k in dict1: yield (k, dict1[k])
        else: yield (k, dict2[k])
