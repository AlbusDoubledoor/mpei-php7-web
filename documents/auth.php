<?php
	if(isset($_POST['enter']))
	{
		if(isset($_POST['username']) && isset($_POST['password']))
		{
			include_once 'deploy_connection.php';
			function echo_fail() {
				echo "<h2><font color='red'>Failed to connect mysql database</font></h2>";
				exit;
			}
			deploy_connection(function(){echo_fail();},"AUTHORIZATION");
			$name = $_POST['username'];
			$pass =	$_POST['password'];
			$sql = "SELECT * FROM users WHERE username='".$name."' and password='".$pass."'";
			if (!$user_record = $connection->query($sql)) {
				echo "<h2 align=center><font color='red'>Failed to execute query for user record</font></h2>";
				header("Location: auth.php");
				exit;
			}
			if ($instance = $user_record->fetch_assoc())
			{
				if(isset($_POST['remember'])&&$_POST['remember']==true)
				{
					setcookie("username", $name); 
					setcookie("role", $instance['role']); 
				}
				else {
					setcookie("username", $name, time()+3600); 
					setcookie("role", $instance['role'], time()+3600); 
				}
				log_put("Authorization: USER <".$name."> IP [".$_SERVER['REMOTE_ADDR']."] log-in");
				header("Location: index.php");
				exit;		
			}
			else
			{
				echo "<h2 align=center><font color='red'>Incorrect login or password</font></h2>";
				log_put("Authorization: USER <".$name."> not found");
			}
		}
	}
?>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>PHP7 Авторизация</title>
		<link rel="stylesheet" type="text/css" href="/resource/css/auth.css">
		<link rel="shortcut icon" href="/resource/icon/favicon.png">
		<script type="text/javascript" src="/resource/js/auth.js"></script>
	</head>
	<body>
		<div class="auth-block">
			<form action=auth.php method=POST onSubmit='return validate()'>
				<h3>Авторизация</h3>
				<div class="field">
					<label>Логин:</label>
					<input type="text" id=username name=username>
				</div>
				<div class="field">
					<label>Пароль:</label>
					<input type="password" id=password name=password>
				</div>
				<div class="field">
					<label class="remember">Запомнить меня</label>
					<input type="checkbox" name=remember>
				</div>
				<div class="field">
					<input type="submit" name="enter" value='Войти'>
				</div>
			</form>
		</div>
		<h3>Сайт использует COOKIE</h3>
	</body>
</html>