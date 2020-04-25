<?php
	include_once "log.php";
	
	if (!file_exists("config.txt")) {
		$new_conf = fopen("config.txt","w+t");
		fputs($new_conf,"# [db_server_name] db servername with port".PHP_EOL);
		fputs($new_conf,"localhost:3306");
		fputs($new_conf,PHP_EOL."# [user_db] user db ".PHP_EOL);
		fputs($new_conf,"root");
		fputs($new_conf,PHP_EOL."# # [pass_db] password db".PHP_EOL);
		fputs($new_conf,"root");
		fputs($new_conf,PHP_EOL."# [db_name] database name".PHP_EOL);
		fputs($new_conf,"php7lessons");
		fputs($new_conf,PHP_EOL.PHP_EOL."***!!! Don't change structure of this file !!!***");
	}

	$connection;
	function deploy_connection($error_function,$invoke_point) {
		global $connection;
		error_reporting(E_ALL ^ E_WARNING);
		$config = file("config.txt");
		$server_db = trim($config[1]);
		$user_db = trim($config[3]);
		$pass_db = trim($config[5]);
		$db_name = trim($config[7]);
		$connection = new mysqli($server_db,$user_db,$pass_db,$db_name);
		if ($connection->connect_errno) {
				log_put("[$invoke_point] Connection failed: ".$connection->connect_error);
				$error_function();
		}
		$connection -> set_charset("utf8");
		error_reporting(E_ALL);
	}
?>