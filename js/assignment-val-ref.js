
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

title("int");
var int1 = 3;
var_dump(int1);
var arr1 = [int1];
var_dump(arr1);
int1 = 5;
var_dump(int1);
var_dump(arr1);
observation("does not change <-> by value");

title("string");
var str1 = "a";
var_dump(str1);
var arr1 = [str1];
var_dump(arr1);
str1 = "b";
var_dump(str1);
var_dump(arr1);
observation("does not change <-> by value");

title("array");
var arr2 = ["a"];
var_dump(arr2);
var arr1 = [arr2];
var_dump(arr1);
arr2.push("b");
var_dump(arr2);
var_dump(arr1);
observation("changes <-> by reference");

title("map/object");
var map1 = {"k1": "a"};
var_dump(map1);
var arr1 = [map1];
var_dump(arr1);
map1["k1"] = "b";
var_dump(map1);
var_dump(arr1);
observation("changes <-> by reference");

