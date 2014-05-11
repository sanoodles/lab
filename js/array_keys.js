
var a1 = ["a", "b"];
var a2 = ["a", "b"]; // same value, different reference
var a3 = ["a", "c"]; // different value (and different reference)
var a4 = ["b", "a"]; // different order

var m1 = [];

/*
 * some dummy value is put at position 3 to act as an arbitrary offset 
 * that ensures that tests do not work just for the corner 
 * case of the needle being at first position of the haystack
 */  
m1[3] = ["dummy1", "dummy2"];
 
m1[5] = a1;


function title(text) {
  console.log(".");
  console.log(text);
}

function dump(v) {
  console.log(v);
}

function observation(text) {
  console.log(text);  
}

function vanillaIndexOf() {
  return a1.indexOf('b');
}

function canFindSameArrayInMatrix() {
  return m1.indexOf(a1);
}

function diffArrSameValues() {
  return m1.indexOf(a2);
}

function diffArrDiffValues() {
  return m1.indexOf(a3);
}

function diffOrderOfElements() {
  return m1.indexOf(a4);
}

function findArrayAfterReverse() {
 return m1.indexOf(a1);
}



title("a1");
dump(a1);

title("m1");
dump(m1);

title("a1.indexOf('b')");
dump(vanillaIndexOf());
observation("vanilla indexOf");

title("m1.indexOf(a1)");
dump(canFindSameArrayInMatrix());
observation("can find same array in matrix");

title("m1.indexOf(a2)");
dump(diffArrSameValues());
observation("different array with same values is evaluated as a miss. so it works by reference.");

title("m1.indexOf(a3)");
dump(diffArrDiffValues());
observation("different array with different values is evaluated as a miss. of course.");

title("m1.indexOf(a4)");
dump(diffOrderOfElements());
observation("different order of elements is evaluated as a miss.");

a1.reverse();
title("after a1.reverse");

title("a1");
dump(a1);

title("m1");
dump(m1);
observation("value appears changed in the matrix as well. works by reference.");

title("m1.indexOf(a1)");
dump(findArrayAfterReverse());
observation("can find reversed array in matrix, since it works by reference.");

a1.reverse(); // leave the things as you found them

