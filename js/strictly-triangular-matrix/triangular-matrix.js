function title(text)
{
  console.log();
  console.log(text);
}

function var_dump(v)
{
  console.log(v);
}

var MAX_MATCH_DISTANCE = 2;

var map = {
  a: '10',
  b: '20',
  c: '30',
  d: '40'
};

function some_aggregation()
{
  return Math.floor(Math.random() * 3) + 1;
}

function getDistanceIsAMatchFunction(maxMatchDistance)
{
  return function(distance)
  {
    return distance <= maxMatchDistance;
  }
}

title("Strictly triangular matrix");
var stm = StrictlyTriangularMatrix.createFromMap(map, some_aggregation);
var_dump(stm);

title("Filtered strictly triangular matrix");
var filteredStm1 = StrictlyTriangularMatrix.filter(stm, getDistanceIsAMatchFunction(MAX_MATCH_DISTANCE));
var_dump(filteredStm1);

title("Create and filter strictly triangular matrix");
var filteredStm2 = StrictlyTriangularMatrix.createFromMapAndFilter(map, some_aggregation, getDistanceIsAMatchFunction(MAX_MATCH_DISTANCE));
var_dump(filteredStm2);

