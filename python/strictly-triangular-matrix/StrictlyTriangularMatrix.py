class StrictlyTriangularMatrix(object):

    @staticmethod
    def createFromDict(dic, aggregationFunction):
        return StrictlyTriangularMatrix._createFromDict(
                dic, 
                aggregationFunction, 
                None)

    @staticmethod
    def createFromDictAndFilter(dic, aggregationFunction, testFunction):
        return StrictlyTriangularMatrix._createFromDict(
                dic, 
                aggregationFunction, 
                testFunction) 

    @staticmethod
    def _createFromDict(dic, aggregationFunction, testFunction):
        res = AutoViviDict()
        for ki, vi in dic.iteritems():
            for kj, vj in dic.iteritems():
                if ki == kj:
                    break
                aggregationResult = aggregationFunction(vi, vj)
                if testFunction is None or testFunction(aggregationResult):
                    res[ki][kj] = aggregationResult
        return res

    @staticmethod
    def filter(STM, testFunction):
        res = AutoViviDict()
        for ki, row in STM.iteritems():
            for kj, v in row.iteritems():
                if ki == kj:
                    break
                if testFunction(v):
                    res[ki][kj] = v
        return res

# https://stackoverflow.com/questions/651794/whats-the-best-way-to-initialize-a-dict-of-dicts-in-python
class AutoViviDict(dict):
    """Implementation of perl's autovivification feature."""
    def __getitem__(self, item):
        try:
            return dict.__getitem__(self, item)
        except KeyError:
            value = self[item] = type(self)()
            return value
