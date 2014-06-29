var StrictlyTriangularMatrix = {

  createFromMap: function(map, aggregationFunction)
  {
    return this._createFromMap(map, aggregationFunction, null);
  },

  createFromMapAndFilter: function(map, 
      aggregationFunction, 
      testFunction) {
    return this._createFromMap(map, aggregationFunction, testFunction);
  },

  _createFromMap: function(map,
      aggregationFunction,
      testFunction) {
    var aggregationResult;
    var res = [];
    for (var ki in map)
    {
      res[ki] = [];
      for (var kj in map)
      {
        if (ki === kj)
        {
          break;
        }
        aggregationResult = aggregationFunction(map[ki], map[kj]);
        if (testFunction === null || testFunction(aggregationResult)) {
          res[ki][kj] = aggregationResult;;
        }
      }
    }
    return res;
  },

  filter: function(STM, testFunction)
  {
    var res = [];
    for (var ki in STM)
    {
      res[ki] = [];
      for (var kj in STM[ki])
      {
        if (ki === kj)
        {
          break;
        }
        if (testFunction(STM[ki][kj]))
        {
          res[ki][kj] = STM[ki][kj];
        }
      }
    }
    return res;
  } 
};

