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
	
	if ($_POST['type']=="containers")
		store_containers();
	if ($_POST['type']=="article")
		store_article();
	if ($_POST['type']=="board")
		store_board();
	if ($_POST['type']=="board_delete")
		delete_board();
	if ($_POST['type']=="article_delete")
		delete_article();
	
	function execute_rollback($msg) {
		global $connection;
		$sql = "ROLLBACK";
		$connection->query($sql);
		print($msg);
		log_put("[ROLLBACK] ".$msg);
		exit;
	}
		
	function store_article() {
		
		global $connection;
		
		$sql = "START TRANSACTION";
		if (!$connection->query($sql))
		{
			$msg = 'Ошибка обработки статьи: ['.$connection->errno.'] '.$connection->error;
			print($msg);
			log_put("[STORE RECORDS/ARTICLE] ".$msg);
			exit;
		}
		else {
			log_put("[START TRANSACTION] STORE RECORDS/ARTICLE");
		}
		$content = $connection->real_escape_string($_POST['content']);
		if ($_POST['mode'] == "create")
			$sql = "INSERT INTO articles VALUES (NULL,'".$_POST['container_id']."','".$_POST['article_title']."','".$content."',NULL,NULL,NULL,NULL)";
		if ($_POST['mode'] == "refresh")
			$sql = "UPDATE articles SET article_title='".$_POST['article_title']."',container_id='".$_POST['container_id']."',article_sort_order='".$_POST['sort_order']."',content='".$content."' WHERE article_id='".$_POST['article_id']."'";
		
		if (!$connection->query($sql))
		{
			$msg = "Ошибка обработки статьи: [".$connection->errno."] ".$connection->error;
			execute_rollback($msg);
			exit;
		}

		$sql = "COMMIT";
		if ($connection->query($sql))
		{
			print('Статья успешно обработана');
			log_put("[COMMIT]	Статья успешно обработана");
		}
		else {
			$msg = 'Ошибка обработки статьи: ['.$connection->errno.'] '.$connection->error;
			execute_rollback($msg);
			exit;
		}
		$connection->close();
	}
	
	function store_board() {
		
		global $connection;
		
		$sql = "START TRANSACTION";
		if (!$connection->query($sql))
		{
			$msg = 'Ошибка обработки объявления: ['.$connection->errno.'] '.$connection->error;
			print($msg);
			log_put("[STORE RECORDS/BOARD] ".$msg);
			exit;
		}
		else {
			log_put("[START TRANSACTION] STORE RECORDS/BOARD");
		}
		
		$content = $connection->real_escape_string($_POST['content']);
		if ($_POST['mode'] == "create")
			$sql = "INSERT INTO board VALUES (NULL,'".$_POST['board_title']."','".$content."','".$_POST['date']."',NULL)";
		if ($_POST['mode'] == "refresh")
			$sql = "UPDATE board SET board_title='".$_POST['board_title']."',date='".$_POST['date']."',board_sort_order='".$_POST['sort_order']."',content='".$content."' WHERE board_id='".$_POST['board_id']."'";
		
		if (!$connection->query($sql))
		{
			$msg = "Ошибка обработки объявления: [".$connection->errno."] ".$connection->error;
			execute_rollback($msg);
			exit;
		}
		$sql = "COMMIT";
		if ($connection->query($sql))
		{
			print('Объявление успешно обработано');
			log_put("[COMMIT]	Объявление успешно обработано");
		}
		else {
			$msg = 'Ошибка обработки объявления: ['.$connection->errno.'] '.$connection->error;
			execute_rollback($msg);
			exit;
		}
		$connection->close();
	}
	
	function store_containers() {
		global $connection;
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
			execute_rollback($msg);
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
				execute_rollback($msg);
				exit;
			}
			$connection->close();
		}
		else {
			$msg = 'Ошибка обновления контейнеров: ['.$connection->errno.'] '.$connection->error;
			execute_rollback($msg);
			exit;
		}
	}
	function delete_article() {
		global $connection;
		
		$sql = "DELETE FROM articles WHERE article_id='".$_POST['article_id']."'";
		if (!$connection->query($sql))
		{
			$msg = "Ошибка удаления статьи: [".$connection->errno."] ".$connection->error;
			log_put("[STORE RECORDS/ARTICLE/DELETE] ".$msg);
			exit;
		}
		else {
			print('Статья успешно удалена.');
		}
		$connection->close();
	}
	function delete_board() {
		global $connection;
		
		$sql = "DELETE FROM board WHERE board_id='".$_POST['board_id']."'";
		if (!$connection->query($sql))
		{
			$msg = "Ошибка удаления объявления: [".$connection->errno."] ".$connection->error;
			log_put("[STORE RECORDS/BOARD/DELETE] ".$msg);
			exit;
		}
		else {
			print('Объявление успешно удалено.');
		}
		$connection->close();
	}
?>