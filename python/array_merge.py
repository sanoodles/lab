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

    '''
    o += "\n\n\n\nm1\n\n"
    o += pprint.pformat(m1)

    o += "\n\n\n\nm2\n\n"
    o += pprint.pformat(m2)
    '''

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

    # WIP
    o += "\n\n\n\nrecursive merge\n\n"
    merge = m1.copy()
    merge = dict_merge_recursive(merge, m2)
    o += pprint.pformat(merge)
    o += "\nnumeric keys are preserved"
    o += "\nexisting keys are merged"



    o += "</pre>"



# wsgi footer
    response_headers = [('Content-type', 'text/html'),
                        ('Content-Length', str(len(o)))]
    start_response(status, response_headers)
    return [o]

def dict_merge_recursive(d1, d2):
    res = {}

    if (type(d1) != dict or
            type(d2) != dict):
        return [d1, d2]

    for p in d1:
        res[p] = d1[p]

    for p in d2:
        if p in res:
            res[p] = dict_merge_recursive(res[p], d2[p])
        else:
            res[p] = d2[p]

    return res

