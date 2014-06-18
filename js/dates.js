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



title('today as ISO');
var res1 = (new Date()).toISOString().substr(0, 10);
var_export(res1);

title('yesterday as ISO');
var res2 = new Date();
res2.setDate(res2.getDate() - 1);
res2 = res2.toISOString().substr(0, 10);
var_export(res2);

title('last day of this month as ISO');
var res3 = (new Date((new Date()).getFullYear(), (new Date()).getMonth() + 1, 0)).getDate();
var_export(res3);

title('last day of given month as ISO');
var res4 = (new Date(2014, 2 - 1 + 1, 0)).getDate();
var_export(res4);

