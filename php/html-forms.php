<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Test to see the contents of form fields</title>
</head>
<body>
<?php
	if ( isset($_POST["submit"]) )
	{
?>
		<h2>$_POST</h2>
		<pre><?php echo print_r($_POST); ?></pre>
		<h2>$_FILES</h2>
		<pre><?php echo print_r($_FILES); ?></pre>
<?php
	}
?>
<form method="post" enctype="multipart/form-data">
	<p>
		checkbox <input type="checkbox" name="checkbox">
	</p>
	<p>
		checkboxCheckedDisabled <input type="checkbox" name="checkboxCheckedDisabled" checked disabled>
	</p>
	<p>
		checkboxCheckedReadonly <input type="checkbox" name="checkboxCheckedReadonly" checked readonly>
	</p>
	<p>
		file <input type="file" name="file">
	</p>
	<p>
		submit <input type="submit" name="submit">
	</p>
</form>
</body>
</html>

