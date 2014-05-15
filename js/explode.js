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
var s1 = "asdf,qwer";
var s2 = "asdf,";
var s3 = ",qwer";
var s4 = "asdf";

title('vanilla split');
var res1 = s1.split(",");
var_export(res1);

title('split empty string');
var res2 = s0.split(",");
var_export(res2);

title('explode on delimiter at the end');
var res3 = s2.split(",");
var_export(res3);

title('explode on delimiter at the beginning');
var res4 = s3.split(",");
var_export(res4);

title('explode on no delimiter');
var res5 = s4.split(",");
var_export(res5);

