
var o1 = {
  "k1": "v1",
  "k2": "v2"
};

function vanillaHasOwnProperty() {
  return o1.hasOwnProperty('k2');
}

console.log("-");
console.log("o1");
console.log(o1);

console.log("-");
console.log("o1.hasOwnProperty('k2')");
console.log(vanillaHasOwnProperty());
console.log("vanilla hasOwnProperty");

