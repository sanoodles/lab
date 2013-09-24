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
var res = s1.split(",");
var_export(res);

title('split empty string');
res = s0.split(",");
var_export(res);

title('explode on delimiter at the end');
res = s2.split(",");
var_export(res);

title('explode on delimiter at the beginning');
res = s3.split(",");
var_export(res);

title('explode on no delimiter');
res = s4.split(",");
var_export(res);

