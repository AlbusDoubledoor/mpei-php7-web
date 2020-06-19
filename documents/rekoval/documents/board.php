<?php
	include_once 'deploy_connection.php';
	deploy_connection(function(){echo "<font color='red'>Failed to execute query for board</font>";},"[MAIN/BOARD]");
	
	$sql = "SELECT * FROM board ORDER BY board_sort_order";
	if ($board = $connection->query($sql))
	{
		while ($board_article = $board->fetch_assoc())
		{
			echo "<div class='board-article'><div class='board-header'><span class='date'>".date("d.m.Y",strtotime($board_article['date']))."</span><span class='title'>".$board_article['board_title']."</span></div><div class='board-body'>".$board_article['content']."</div></div>";
		}
	}
	else {
		echo "<font color='red'>Failed to execute query for board</font>";
		log_put("[MAIN/BOARD] Query failed: [".$connection->errno."] ".$connection->error);
	}
?>