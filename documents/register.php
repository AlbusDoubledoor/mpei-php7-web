<?php
	if(isset($_POST['username'])&&isset($_POST['password']) &&isset($_POST['role'])) {
		if(!(count($_POST['username']) == count($_POST['password']) && count($_POST['username']) == count($_POST['role'])))
		{
			$msg = 'Ошибка регистрации пользователя: [333] Все массивы должны быть одной длины';
			print($msg);
			log_put($msg);
			exit;
		}
		include_once 'deploy_connection.php';
		function get_err_msg($mode) {
			return $mode=="connection"?'Ошибка регистрации пользователя: ['.$connection->connect_errno.'] '.$connection->connect_error :'Ошибка регистрации пользователя: ['.$connection->errno.'] '.$connection->error; 
		}
		
		function echo_fail() {
			global $connection;
			$msg = get_err_msg("connection");
			print($msg);
			log_put($msg);
			exit;
		}
		
		deploy_connection(function(){echo_fail();});
		$sql="START TRANSACTION";
		if (!$connection->query($sql))
		{
			$msg = get_err_msg("query");
			print($msg);
			log_put($msg);
			exit;
		}
		else
		{
			log_put("[START TRANSACTION] USER REGISTRATION");
		}
		for($idx = 0; $idx < count($_POST['username']); ++$idx) {
			if($_POST['username'][$idx]=="" || $_POST['password'][$idx]=="" ||$_POST['role'][$idx]=="")
			{
				$msg = 'Ошибка регистрации пользователя: [222] Один из обязательных параметров пустой';
				print($msg);
				log_put("[ROLLBACK]   ".$msg);
				$sql = "ROLLBACK";
				$connection->query($sql);
				exit;
			}
			$sql="INSERT INTO users VALUES (0,'".$_POST['username'][$idx]."','".$_POST['password'][$idx]."','".$_POST['role'][$idx]."')";
			if (!$connection->query($sql))
			{
				$msg = 'Ошибка регистрации пользователя <'.$_POST['username'][$idx].'>: ['.$connection->errno.'] '.$connection->error;
				print($msg);
				log_put("[ROLLBACK]	  ".$msg);
				$sql = "ROLLBACK";
				$connection->query($sql);
				exit;
			}
		}
		$sql = "COMMIT";
		if ($connection->query($sql))
		{
			print('Успешная регистрация');
			log_put("[COMMIT]	Успешная регистрация");
		}
		else
		{
			$msg = get_err_msg("query");
			print($msg);
			log_put("[ROLLBACK]   ".$msg);
			exit;
		}
		$connection->close();
	}
	else
	{
		$msg = 'Ошибка регистрации пользователя: [111] Не переданы обязательные параметры.';
		print($msg);
		log_put($msg);
	}
?>