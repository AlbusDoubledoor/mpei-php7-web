<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Мои файлы</title>
		<link rel="shortcut icon" href="/resource/icon/favicon.png"> 
		<link rel="stylesheet" type="text/css" href="/resource/css/watch-my-files.css">
	</head>
	<body>
	<?php
		include_once "deploy_connection.php";
		function echo_fail() {
			echo "<h2><font color='red'>Failed to connect mysql database</font></h2>";
			exit;
		}
		
		if (!isset($_COOKIE['username'])) {
			echo "Пользователь не задан";
			log_put("[ERROR MY FILES] User is not defined");
			exit;
		}
		
		$hashed = hash('md5',$_COOKIE['username']);
		$userdir = "uploads/".$hashed;
		if (!file_exists("uploads"))
			mkdir("uploads");
		
		if (!file_exists($userdir))
			mkdir($userdir);
		
		if (isset($_GET['file'])) {
			if (file_exists($userdir."/".$_GET['file']))
				unlink($userdir."/".$_GET['file']);
		}
		
		$files = scandir($userdir);
		$count = 0;
		echo "Путь к моим файлам: ".$userdir."/<br>";
		echo "<b>Мой файлы:</b><br>";
		echo "<table cellspacing=0 cellpadding='5px'>";
		foreach($files as $instance) {
			if ($instance != "." && $instance != "..")
			{
				++$count;
				echo "<tr>";
				echo "<td><label class='file-name'>$instance</label></td><td><a class='link-file-operation' download href='".$userdir."/".$instance."'>Скачать файл</a></td>";
				echo "<td><a class='link-file-operation' target='_self' href='?file=".$instance."'>Удалить файл</a><br></td></tr>";
			}
		}
		if ($count == 0)
			echo "<i>файлов нет</i>";
		echo "</table>";
		
	?>
	<button onclick='window.close()' style="position: absolute; bottom:10px; right:10px">Закрыть</button>
	</body>
</html>