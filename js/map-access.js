
function title(v)
{
  console.log("-");
  console.log(v);
}

function observation(v)
{
  console.log(v);
}

function var_dump(v)
{
  console.log(v);
}

var a = [
  {
    "a": 10,
    "b": 20
  }
];

title("a");
var_dump(a);

title("a[0]");
var_dump(a[0]);

title("a[0][3]");
var_dump(a[0][3]);
observation("a[0][3] is 'undefined'. No error is generated.");

title("[0][Object.keys(a[0])[0]] to access the first property of an Object without knowing the key");
var_dump(a[0][Object.keys(a[0])[0]]);

