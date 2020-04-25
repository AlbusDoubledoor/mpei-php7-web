<html>
	<head>		
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<title>Загрузка файла</title>
			<link rel="shortcut icon" href="/resource/icon/favicon.png"> 
	</head>
	<body>
	<?php
			include_once "log.php";
			if (!isset($_FILES['userfile'])) {
				echo "ERROR";
				log_put("[ERROR UPLOAD] NO FILE");
				exit;
			}

			if (!file_exists("uploads"))
				mkdir("uploads");
			if (isset($_COOKIE['username']))
			{
				if(!file_exists("uploads/".$_COOKIE['username'])) mkdir("uploads/".$_COOKIE['username']);
				$uploaddir = 'uploads/'.$_COOKIE['username'].'/';
			}
			else if (!file_exists("uploads/no.user"))
			{
				mkdir("uploads/no.user");
				$uploaddir = 'uploads/no.user/';
			}
			
			$uploadfile = $uploaddir.basename($_FILES['userfile']['name']);

			echo "<pre>";
			if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
				echo "Файл корректен и был успешно загружен.\n";
				echo "Путь к файлу: ".$uploadfile."\n";
				echo "\n\n<a href='watch_my_files.php'>Мои файлы</a>\n";
				log_put("[SUCCESS UPLOAD] ".$uploadfile." ".$_FILES['userfile']['size']." bytes");
			} else {
				echo "Ошибка загрузки файла.\n";
				if ($_FILES['userfile']['size'] == 0)
				{
					echo "Файл слишком большой.\n";
					log_put("[ERROR UPLOAD] File is too large.");
				}
				else
				{
					log_put("[ERROR UPLOAD] ".$uploaddir." ".$_FILES['userfile']['size']);
				}
			}
			echo "</pre>";
	?>
	<button onclick='window.close()' style="position: absolute; bottom:10px; right:10px">Закрыть</button>
	</body>
</html>