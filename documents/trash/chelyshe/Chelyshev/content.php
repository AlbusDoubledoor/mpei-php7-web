<?php
echo "<head>
	<meta http-equiv='content-type' content='text/html; charset=utf-8'>
	<link rel='stylesheet' rev='stylesheet' type='text/css' href='style.css' />	
	
	<script type='text/javascript' src='ckeditor/ckeditor.js'></script>
	
<script src='js/highlight.pack.js'></script>
<script>hljs.initHighlightingOnLoad();</script>
<link rel='stylesheet' rev='stylesheet' type='text/css' href='js/styles/darcula.css' />	
	
	
</head>";

require_once 'functions.php';
require "auth.php";
	$txt = selectText($id);
	$txt[0]['text'] = str_replace('&', '&amp;', $txt[0]['text']);
if($_POST['update']){
	updateText($_POST['txt'], $_POST['id']);
	header("Location: ".$_SERVER['PHP_SELF']);
	exit;
}
if($_POST['edit']){
echo "
<body>

<div class='content1'>

	<form method='post'>
		<textarea id='editor1' name='txt' cols='100' rows='50'>";
		echo $txt[0]['text'];
		echo "</textarea>
		<script type='text/javascript'>
			var ckeditor1 = CKEDITOR.replace('editor1');
		</script>
		<br />
		<input type='hidden' name='id' value=";
		echo $txt[0]['id'];
		echo " />";
		echo "<input type='submit' name='update' value='Обновить' />";
	echo "</form>
	
</div>


</body>";
	
	
}
else {
	echo "<div class='content'>";
	$txt[0]['text']=htmlspecialchars_decode($txt[0]['text']);
    echo $txt[0]['text'];
    echo "</div>";
	
	if ($_SESSION['user']=="admin"){
	echo "<form method='POST'>";
	echo "<input type='submit' name='edit' value='Редактировать'>";
	echo "</form>";
}}
?>