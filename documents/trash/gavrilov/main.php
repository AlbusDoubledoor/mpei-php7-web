
<html>
<head>
	<title>Учебный портал по курсу "WEB-Технологии"</title>
	<meta  charset="utf-8">
	<link rel="stylesheet" rev="stylesheet" type="text/css" href="style.css" />	
	 
	<?php  
	
	require_once 'functions.php';
	$id=0;
	
	

	if(isset($_GET['id']))
	{
		global $id;
		$id = $_GET['id'];
	}
	$text = selectText();
	if(count($text)!=0)
	{
		if($id<count($text))
		{
			$text1 = $text[$id]["text"];
			$nam = $text[$id]["name"];
		}else
		{
			$text1 = $text[0]["text"];
			$nam = $text[0]["name"];
		}

	}else
	{
		$nam="Нет статей!";
		$text1="";
	}
	

	?>
</head>
<body>
<form action=edit.php method=post target=edit.php>

	<table height=100% width=80% border = 0 cellspacing=0 align='center'>
		<tr height=20% >
			<td width=10%>
			<a href=https://www.php.net/manual/ru/book.mysqli.php><img src="P_H_P.png" width = "160" height = "80"></a>
			</td>
			
			<td align='center' class=header>
			Учебный портал по курсу "WEB-Технологии"<br>
			Функции PHP для работы с MySQL/MySQLi. Примеры запросов.
			</td>
			
			<td width=10% align='center'>
			<a href=https://www.mysql.com/><img src="mysql.png" width = "110" height = "120"></a>
			</td>
		</tr>
		
		<tr height =70%>
			<td width=10% valign=top align='left'>
				<div align='center' class=menu>МЕНЮ</div>
				<div class=names>
				<?php 
				for($i=0;$i<count($text);$i++)
				{
					echo "<div><a href=main.php?id=".$i." href >"."|>".$text[$i]["name"]."</a></div>";
				}
				?>
				</div>
			</td>
			<td width=80% class="content" align='center' valign=top>
				<div class="nam" align=left >
					
					<?php 
					echo "<h3 >".$nam."</h3>"; 
					?>
					
				</div>
				<div class="text">
					
					<?php  
					echo $text1; 
					?>
					
				</div>
			</td>
			
			<td width=10% valign=top align='center'>
			<div align='center' class=menu>Инструменты</div>
				<div class=names>
					<input class=tools type=submit value="Редактировать" name = "edit">
					<input class=tools type=submit value="Добавить статью" name = "add">
					<input type="hidden" name="id" value="<?php echo $id ?>" />
				</div>
			</td>
		</tr>
		
		<tr height =10% >
			<td width=10% valign=top align='center'>
				
			</td>
			
			<td>
				<div align=left class=down>
					Выполнил: Гаврилов Александр<br> 
					Группа А-08-17
				</div>
			</td>
			
			<td width=10% valign=top align='center'>
				
			</td>
		</tr>
		
	</table>

</form>
</body>
</html>