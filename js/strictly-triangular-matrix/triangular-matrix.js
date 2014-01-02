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
var filteredStm = StrictlyTriangularMatrix.filter(stm, getDistanceIsAMatchFunction(MAX_MATCH_DISTANCE));
var_dump(filteredStm);

