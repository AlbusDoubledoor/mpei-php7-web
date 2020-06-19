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
	
	if ($_POST['type'] == "containers")
		load_containers();
	if ($_POST['type'] == "article")
		load_article();
	if ($_POST['type'] == "board")
		load_board();
	
	function load_containers() {
		global $connection;
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
	}
	
	function load_article() {
		global $connection;
		$sql = "SELECT content FROM articles WHERE article_id='".$_POST['article_id']."'";
		if (!$article = $connection->query($sql))
		{
			$msg = "Ошибка загрузки статьи: [".$connection->errno."] ".$connection->error;
			print($msg);
			log_put("[LOAD RECORDS/ARTICLE] ".$msg);
			exit;
		}
		else {
			$content = $article->fetch_assoc();
			print($content['content']);
		}
	}
	
	function load_board() {
		global $connection;
		$sql = "SELECT content FROM board WHERE board_id='".$_POST['board_id']."'";
		if (!$board = $connection->query($sql))
		{
			$msg = "Ошибка загрузки объявления: [".$connection->errno."] ".$connection->error;
			print($msg);
			log_put("[LOAD RECORDS/BOARD] ".$msg);
			exit;
		}
		else {
			$content = $board->fetch_assoc();
			print($content['content']);
		}
	}
?>