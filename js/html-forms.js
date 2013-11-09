function onSubmitClick(e)
{
  e.preventDefault();

  var elsInput = document.getElementsByTagName("input");
  for ( var i = 0, max = elsInput.length; i < max; i++ )
  {
    console.log("name: " + elsInput[i].name
        + ". value: " + elsInput[i].value
        + ". checked: " + elsInput[i].checked);
    // console.dir(elsInput[i]);
  }
}

var elSubmit = document.getElementById("submit");
elSubmit.addEventListener("click", onSubmitClick);
