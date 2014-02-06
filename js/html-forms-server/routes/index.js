exports.index = function(req, res){
  res.render('index', { 
    body: JSON.stringify(req.body, null, " "),
    files: JSON.stringify(req.files, null, " "),
  });
};
