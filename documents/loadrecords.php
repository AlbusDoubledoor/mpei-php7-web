<?php
	include_once 'deploy_connection.php';
	deploy_connection(function(){echo "Connection to database failed";},"LOAD RECORDS");
	
	if (!isset($_POST['type']))
	{
		$msg = "[LOAD RECORDS] Type is not presented";
		log_put($msg);
		print($msg);
		exit;
	}
	
	$sql = "SELECT * FROM containers ORDER BY container_sort_order";
	if (!$containers = $connection->query($sql))
	{
		$msg = "Ошибка загрузки контейнеров: [".$connection->errno."] ".$connection->error;
		print($msg);
		log_put("[LOAD RECORDS/CONTAINERS] ".$msg);
		exit;
	}
	else {
		print("SUCCESS_LOAD\n");
	}
	while($container = $containers->fetch_assoc()) {
		print($container['container_id']."%delimiter%".$container['container_title']."%delimiter%".$container['container_sort_order']."\n");
	}
?>