
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




console.log("-");
console.log("a1");
console.log(a1);

console.log("-");
console.log("m1");
console.log(m1);

console.log("-");
console.log("a1.indexOf('b')");
console.log(a1.indexOf('b'));
console.log("vanilla indexOf");

console.log("-");
console.log("m1.indexOf(a1)");
console.log(m1.indexOf(a1));
console.log("can find same array in matrix");

console.log("-");
console.log("m1.indexOf(a2)");
console.log(m1.indexOf(a2));
console.log("different array with same values is evaluated as a miss. so it works by reference.");

console.log("-");
console.log("m1.indexOf(a3)");
console.log(m1.indexOf(a3));
console.log("different array with different values is evaluated as a miss. of course.");

a1.reverse();

console.log("-");
console.log("a1");
console.log(a1);

console.log("-");
console.log("m1");
console.log(m1);
console.log("value appears changed in the matrix as well. works by reference.");

console.log("-");
console.log("m1.indexOf(a1)");
console.log(m1.indexOf(a1));
console.log("the array is also found.");

