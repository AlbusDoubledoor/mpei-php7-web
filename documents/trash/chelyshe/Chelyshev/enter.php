<head>
<meta http-equiv='content-type' content='text/html; charset=utf-8'>
	<link rel='stylesheet' rev='stylesheet' type='text/css' href='style.css' />	
</head>
<?php
require_once 'config.php';
session_start();

if($_SESSION['user']){
	header("Location: index.php");
	exit;
}

if($_POST['submit']){
	$query = "SELECT username, password FROM ".auth.";";
	$res = mysqli_query($con, $query);
	while($row = mysqli_fetch_assoc($res)){
		if($row['username'] == $_POST['user'] AND $row['password'] == md5($_POST['pass'])){
		$_SESSION['user'] = $row['username'];
		header("Location: index.php");
		exit;
	}
	}echo '<p>Логин или пароль неверны!</p>';
	
}
?>
Это страница авторизации. Введите логин и пароль
<hr>
<form method="post">
	<table>
		<tr>
			<td>Username:</td>
			<td><input type="text" name="user" value="" /></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="pass" value=""/></td>
		</tr>
	
	</table>
	<br/>
	<input type="submit" name="submit" value="Войти" />
</form>