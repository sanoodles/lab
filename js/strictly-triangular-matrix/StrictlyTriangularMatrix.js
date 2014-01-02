var StrictlyTriangularMatrix = {
  createFromMap: function(map, aggregationFunction)
  {
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
        res[ki][kj] = aggregationFunction(map[ki], map[kj]);
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

