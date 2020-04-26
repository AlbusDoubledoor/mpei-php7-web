<?php
	include_once 'deploy_connection.php';
	deploy_connection(function(){echo "Connection to database failed";},"STORE RECORDS");
	
	if (!isset($_POST['type']))
	{
		$msg = "[STORE RECORDS] Type is not presented";
		log_put($msg);
		print($msg);
		exit;
	}
	
	$sql = "START TRANSACTION";
	if (!$connection->query($sql))
	{
		$msg = 'Ошибка обновления контейнеров: ['.$connection->errno.'] '.$connection->error;
		print($msg);
		log_put("[STORE RECORDS/CONTAINERS] ".$msg);
		exit;
	}
	else {
		log_put("[START TRANSACTION] STORE RECORDS/CONTAINERS");
	}
	
	$sql = "DELETE FROM containers";
	if (!$connection->query($sql))
	{
		$msg = "Ошибка обновления контейнеров: [".$connection->errno."] ".$connection->error;
		print($msg);
		log_put("[STORE RECORDS/CONTAINERS] ".$msg);
		exit;
	}
	
	function execute_rollback($msg) {
		$sql = "ROLLBACK";
		$connection->query($sql);
		print($msg);
		log_put("[ROLLBACK] ".$msg);
		exit;
	}
	
	$sql = "INSERT INTO containers VALUES ";
	for($i = 0; $i < count($_POST['id']); ++$i) {
		if ($_POST['id'][$i] == "" || $_POST['title'][$i] == "")
			execute_rollback("Ошибка обновления контейнеров: [001] ID или TITLE были пустыми");
		$rowvalue = "(";
		if ($_POST['id'][$i] == 'TBD')
			$rowvalue = $rowvalue."NULL,";
		else
			$rowvalue = $rowvalue."'".$_POST['id'][$i]."',";
		$rowvalue = $rowvalue."'".$_POST['title'][$i]."',";
		if ($_POST['sort_order'][$i]=='')
			$rowvalue = $rowvalue."NULL)";
		else
			$rowvalue = $rowvalue."'".$_POST['sort_order'][$i]."')";
		if ($i != count($_POST['id'])-1)
			$rowvalue = $rowvalue.",";
		$sql = $sql.$rowvalue;
	}
	if ($connection->query($sql))
	{
		$sql = "COMMIT";
		if ($connection->query($sql))
		{
			print('Контейнеры обновлены');
			log_put("[COMMIT]	Контейнеры обновлены");
		}
		else {
			$msg = 'Ошибка обновления контейнеров: ['.$connection->errno.'] '.$connection->error;
			print($msg);
			log_put("[ROLLBACK]   ".$msg);
			exit;
		}
		$connection->close();
	}
	else {
		$msg = 'Ошибка обновления контейнеров: ['.$connection->errno.'] '.$connection->error;
		print($msg);
		log_put("[ROLLBACK]   ".$msg);
		exit;
	}
?>