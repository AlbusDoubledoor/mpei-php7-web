<?php
session_start();

if($_GET['do'] == 'logout'){
	unset($_SESSION['user']);
	session_destroy();
}

if(!$_SESSION['user']){
	header("Location: enter.php");
	exit;
}
?>