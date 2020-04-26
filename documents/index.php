<?php 	
	include_once 'deploy_connection.php';
	// Initiliaze script
	if(isset($_GET['mode']) && $_GET['mode']=='exit')
	{
	    log_put("Authorization: USER <".$_COOKIE['username']."> IP [".$_SERVER['REMOTE_ADDR']."] log-out");
		setcookie("username","",time()-3600);
		setcookie("role","",time()-3600);
		unset($_COOKIE);
	}
	
	if (!isset($_COOKIE['role'])) 
		{
			header("Location: auth.php");
			exit;
		}
	$scrname = $_SERVER['PHP_SELF'];
	function echo_fail() {
		echo "<h2><font color='red'>Failed to connect mysql database</font></h2>";
		exit;
	}
	
	deploy_connection(function(){echo_fail();},"MAIN PAGE");
	if ($_COOKIE['role']=='admin')
		$admintools = true;
	else
		$admintools = false;
	
	function push_header_item($mode,$innerhtml) {
		global $scrname;
		echo "<a class='header-link item";
		if ($mode == "admintools") echo " admin-tools";
		if ($mode == "exit") echo " logout";
		if ($_GET['mode'] == $mode) echo " active";
		echo "' href='".$scrname."?mode=".$mode."'><div>".$innerhtml."</div></a>";
	}
	$state = $scrname."?mode=board";
	if (!isset($_GET['mode'])||($_GET['mode']=="admintools"&&!$admintools)) header("Location: ".$state,false);
?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>PHP7 Уроки</title>
		<link rel="stylesheet" type="text/css" href="/resource/css/main.css">
		<link rel="shortcut icon" href="/resource/icon/favicon.png"> 
		<script type="text/javascript" src="resource/js/interactive_buttons.js"></script>
		<script type="text/javascript" src="resource/js/collapsible.js"></script>
		<script type="text/javascript" src="resource/js/ckeditor/ckeditor.js"></script>
		<?php if ($admintools) echo "<script type='text/javascript' src='resource/js/admintools.js'></script>"; ?>
		</head>
		<body onload="activate_collapsible()">
			<script type="text/javascript">
				var to_top = new ToTopButton("Наверх");
				to_top.setClass("to-top-button");
				to_top.setClass("mainfont");
				document.body.appendChild(to_top);
			</script>
			<div class="skeleton-wrapper mainfont">
				<div class="header-bar">
					<?php
						push_header_item("board","Объявления");
						push_header_item("view_article","PHP7");
						push_header_item("feedback","Обратная связь");
						push_header_item("exit","Выход");
						if ($admintools) {
							push_header_item("admintools","Admin Tools");
						}
					?>
				</div>
				<?php
				if (isset($_GET['mode']) && $_GET['mode'] == "view_article")
				{
					echo "<div class='nav-panel'>";
					$sql = "SELECT * FROM containers ORDER BY container_sort_order";
					if (!$result_containers = $connection->query($sql)) {
						echo "<h2><font color='red'>Failed to execute query for containers</font></h2>";
						log_put("ERROR! Failed to load containers: [".$connection->errno."] ".$connection->error);
					}
					else {
						$sql = "SELECT * FROM articles ORDER BY article_sort_order";
						if (!$result_articles = $connection->query($sql)) {
							echo "<h2><font color='red'>Failed to execute query for articles</font></h2>";
							log_put("ERROR! Failed to load articles: [".$connection->errno."] ".$connection->error);
						}
						while ($row_container =  $result_containers->fetch_assoc())
						{
							echo "<div class='item collapsible";
							if (isset($_GET['container']) && $_GET['container'] == $row_container['container_id']) { echo " active";}
							echo "'>".$row_container['container_title']."</div><div class='content'>";
							while($row_article = $result_articles->fetch_assoc()) {
								echo "<a class='content-link".(isset($_GET['article'])&&$row_article['article_id']==$_GET['article']? " active":"")."' href='".$scrname."?mode=view_article&container=".$row_container['container_id']."&article=".$row_article['article_id']."'>".$row_article['article_title']."</a><br>";
							}
							echo "</div>";
						}
					}
					echo "</div>"; 
				}
				?>
				<div class="content-box">
				<?php
						if (isset($_GET['article']))
						{
							$get_article = mysqli_real_escape_string($connection,$_GET['article']);
							$sql = "SELECT content FROM articles WHERE article_id='".$get_article."'";
							if (!$result = $connection->query($sql)) {
								echo "<h2><font color='red'>Failed to execute query for content</font></h2>";
								log_put("ERROR! Failed to load content: [".$connection->errno."] ".$connection->error);
							}
							else {
								$article = $result->fetch_assoc();
								echo $article['content'];
							}
						}
						if ($admintools && $_GET['mode'] == "admintools")
						{
							include_once "admintools.php";
						}
				?></div>
			</div>
		</body>
</html>