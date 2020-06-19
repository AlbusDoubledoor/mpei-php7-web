<?php 

require_once 'functions.php'; 
$text= array();
$text1="";
$id=0;
$name="";
$stat="" ;
$butname="";
	if(isset($_POST['edit'])){
	$text = selectText();
	$text1 = $text[$_POST['id']]["text"];
	$name = $text[$_POST['id']]["name"];
	$id = $_POST['id'];
	$stat= "Редактор";
	$butname="Обновить";
	}
	if(isset($_POST['add']))
	{
		$stat="Добавление";
		$butname="Добавить";
	}
	if(isset($_POST['up'])&& $_POST['stat']=="Редактор")
	{
		update($_POST['art'],$_POST['id_'],$_POST['name_']);
	}
	if(isset($_POST['up'])&& $_POST['stat']=="Добавление")
	{
		add($_POST['art'],$_POST['name_']);
	}
	if(isset($_POST['del']))
	{
		del($_POST['id_']);
		echo '<script>window.open(localhost/portal/main.php)</script>';
		
	}
	
	


?>
<html>
<head>
	<meta  charset=utf-8">
	<title><?php echo $stat ; if(isset($_POST['up'])) echo $_POST['stat']?></title>	
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<link rel="stylesheet" rev="stylesheet" type="text/css" href="style.css" />
	
</head>

<body>
<form method="post" action=edit.php>
<table width=80% align=center>
	<tr>
		<td class=header>
		Название<br>
		<input type=text size=100 maxlength=100 name = "name_" 
		value="<?php echo $name ;if(isset($_POST['up'])) echo $_POST['name_']?>"><br>
		
				
		</td>
		
		<td>
			<div align='center' class=menu>
			<?php echo $stat ; if(isset($_POST['up'])) echo $_POST['stat']?>
			</div>
			
			<div class=names>
						<input class=tools type="submit" name="up" 
						value="<?php echo $butname; if(isset($_POST['up'])) echo $_POST['up']?>" />
						<?php 
							if(isset($_POST['edit']))
							{
								echo "<input class=tools type=submit name=del value=Удалить />";
							}
						?>
			</div>
		</td>
	</tr>
	
	<tr>
		<td colspan=2 class=header>
		Содержание<br>
					<div class=edit>
						<textarea id="editor1" name="art" cols="100" rows="1000" >
						<?php echo $text1 ?><?php if(isset($_POST['up'])) echo $_POST['art']?>
						</textarea>
					</div>
					<script type="text/javascript">
						CKEDITOR.replace( 'editor1' );
					</script>
					<input type="hidden" name="id_" value="<?php if(isset($_POST['up'])) {echo $_POST['id_'];} else echo $text[$id]["id"] ;?>" />
					<input type="hidden" name="stat" value="<?php echo $stat ; if(isset($_POST['up'])) echo $_POST['stat']?>" />
				
		</td>
		
	</tr>
</table>
</form>
</body>
</html>