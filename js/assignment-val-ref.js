
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
var arr2 = [str1];
var_dump(arr2);
str1 = "b";
var_dump(str1);
var_dump(arr2);
observation("does not change <-> by value");

title("array");
var arr3 = ["a"];
var_dump(arr3);
var arr4 = [arr3];
var_dump(arr4);
arr3.push("b");
var_dump(arr3);
var_dump(arr4);
observation("changes <-> by reference");

title("map/object");
var map1 = {"k1": "a"};
var_dump(map1);
var arr5 = [map1];
var_dump(arr5);
map1["k1"] = "b";
var_dump(map1);
var_dump(arr5);
observation("changes <-> by reference");

