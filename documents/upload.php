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
			$hashed = "";
			if (isset($_COOKIE['username']))
			{
				$hashed = hash('md5',$_COOKIE['username']);
				if(!file_exists("uploads/".$hashed)) mkdir("uploads/".$hashed);
				$uploaddir = 'uploads/'.$hashed.'/';
			}
			else if (!file_exists("uploads/no.user"))
			{
				mkdir("uploads/no.user");
				$uploaddir = 'uploads/no.user/';
			}
			
			foreach($_FILES['userfile']['error'] as $key=>$error) {
				$uploadfile = $uploaddir.basename($_FILES['userfile']['name'][$key]);

				echo "<pre>";
				if (move_uploaded_file($_FILES['userfile']['tmp_name'][$key], $uploadfile)) {
					echo "Файл корректен и был успешно загружен.\n";
					echo "Путь к файлу: ".$uploadfile."\n";
					log_put("[SUCCESS UPLOAD] ".$uploadfile." ".$_FILES['userfile']['size'][$key]." bytes");
				} else {
					echo "Ошибка загрузки файла.\n";
					if ($_FILES['userfile']['size'][$key] == 0)
					{
						echo "Файл слишком большой.\n";
						log_put("[ERROR UPLOAD] File is too large.");
					}
					else
					{
						log_put("[ERROR UPLOAD] ".$uploaddir." ".$_FILES['userfile']['size'][$key]);
					}
				}
				echo "</pre>";
			}
			echo "\n\n<a href='watch_my_files.php'>Мои файлы</a>\n";
	?>
	<button onclick='window.close()' style="position: absolute; bottom:10px; right:10px">Закрыть</button>
	</body>
</html>