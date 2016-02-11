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



function get_array()
{
  return ['a', 'b', 'c'];
}



title('what get_array returns');
var_dump(get_array());



title('assign from array');
var [x1, y1, z1] = get_array();
var_dump(x1);
var_dump(y1);
var_dump(z1);


