function title(v)
{
  console.log("-");
  console.log(v);
}

function observation(v)
{
  console.log(v);
}

function var_export(v)
{
  console.log(v);
}

var s0 = "";
var s1 = "a";
var s2 = "a\n";
var s3 = "a\nb";
var s4 = "\nb";

title('count empty string');
var res0 = s0.split("\n").length - 1;
var_export(res0);

title('count no occurrences');
var res1 = s1.split("\n").length - 1;
var_export(res1);

title('count as suffix');
var res2 = s2.split("\n").length - 1;
var_export(res2);

title('count as infix');
var res3 = s3.split("\n").length - 1;
var_export(res3);

title('count as prefix');
var res4 = s4.split("\n").length - 1;
var_export(res4);

