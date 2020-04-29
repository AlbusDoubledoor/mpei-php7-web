<html>
	<head>		
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<title>Обратная связь</title>
			<link rel="shortcut icon" href="/resource/icon/favicon.png"> 
	</head>
	<body>
	<?php
			include_once "log.php";
			if (!isset($_POST['from']) || !isset($_POST['subject']) || !isset($_POST['message'])) {
				echo "ERROR";
				log_put("[ERROR FEEDBACK] Missing required attributes");
				exit;
			}

			if (!file_exists("feedback"))
				mkdir("feedback");
			chdir("feedback");
			$feedbackid = "";
			if (!isset($_COOKIE['username']))
			{
				$feedbackid = "nouser";
			}
			else
			{
				$feedbackid = $_COOKIE['username'];
			}
			
			$feedbackid = $feedbackid.uniqid(); 
			$timestamp = time();
			$feedbackmsg = "<b>Дата:</b> ".date('d.m.Y',$timestamp)."<br><b>Время:</b> ".date('H:i',$timestamp)."<br><b>От кого: </b>".$_POST['from']."<br><b>Тема:</b> ".$_POST['subject']."<br>".nl2br($_POST['message']);
			$newfeedback = fopen($feedbackid.".txt",'w+t');
			fputs($newfeedback,$feedbackmsg);
			fclose($newfeedback);
			log_put("[SUCCESS FEEDBACK] ".$feedbackid." registered");
			echo "Ваще сообщение успешно сохранено\n<div style='margin: 10px;word-break: break-all; border: 2px solid black; padding: 10px;'>".$feedbackmsg."</div>";
	?>
	<button onclick='window.close()' style="position: absolute; bottom:10px; right:10px">Закрыть</button>
	</body>
</html>