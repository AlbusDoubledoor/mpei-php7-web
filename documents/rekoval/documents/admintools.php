<link rel="stylesheet" type="text/css" href="/resource/css/tabs.css">
<link rel="stylesheet" type="text/css" href="/resource/css/forms.css">
<div class='tabs'>
	<button class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'artmanager' || !isset($_GET['tab'])) echo "selected "?>tab-button' onclick='openTabContainer("artManager",this)'>Управление статьями</button>
	<button class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'contmanager') echo "selected "?>tab-button' onclick='openTabContainer("contManager",this)'>Управление контейнерами</button>
	<button class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'boardmanager') echo "selected "?>tab-button' onclick='openTabContainer("boardManager",this)'>Управление объявлениями</button>
	<button class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'regusers') echo "selected "?>tab-button' onclick='openTabContainer("regUsers",this)'>Регистрация пользователей</button>
	<button class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'viewfeedback') echo "selected "?>tab-button' onclick='openTabContainer("viewFeedback",this)'>Просмотр обратной связи</button>
</div>
<div class='tabframe main-button'>
	<div id='artManager' class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'artmanager' || !isset($_GET['tab'])) echo "start-tab "?>tab-container'>
		<button onclick="newArticle()">Новая статья</button>
		<button onclick="editArticle()">Редактировать статью</button>
		<button onclick="location.href='?mode=admintools&tab=artmanager'">Обновить страницу</button>
		<button id='sendArticle' class="special-button" onclick="storeArticle()">Отправить статью</button>
		<div class='new-article article-fields' id='newArticle'>
				<p><label>Контейнер:</label><select  id='createArticleContainer'>
				<?php 
					$sql = "SELECT container_id,container_title FROM containers ORDER BY container_sort_order";
					if (!$select_containers = $connection->query($sql)) {
						echo "<option value='placeholder' selected disabled><font color='red'>Failed to execute query for containers</font></option>";
						log_put("[NEW ARTICLE] ERROR! Failed to load container list: [".$connection->errno."] ".$connection->error);
					}
					else {
						while ($select_container = $select_containers->fetch_assoc()) {
							echo "<option containerid='".$select_container['container_id']."'>".$select_container['container_title']."</option>";
						}
					}
				?>
				</select></p>
				<p><label>Заголовок:</label><input id='newArtTitle' type=text></p>
		</div>
		<div class='edit-article article-fields' id='editArticle'>
				<p><label>Контейнер:</label><select id='editArtContList' onchange='refreshArtList()'>
				<?php 
					$sql = "SELECT container_id,container_title FROM containers ORDER BY container_sort_order";
					if (!$select_containers = $connection->query($sql)) {
						echo "<option value='placeholder' selected disabled><font color='red'>Failed to execute query for containers</font></option>";
						log_put("[EDIT ARTICLE] ERROR! Failed to load container list: [".$connection->errno."] ".$connection->error);
					}
					else {	
						while ($select_container = $select_containers->fetch_assoc()) {
							echo "<option id='".$select_container['container_id']."'>".$select_container['container_title']."</option>";
						}
					}
				?>
				</select></p>
				<p><label>Статья:</label><select id='editArtList'>
				<?php 
					$sql = "SELECT article_sort_order, container_id,article_title,article_id FROM articles ORDER BY article_sort_order";
					$select_articles = $connection->query($sql);
					if (!$select_articles = $connection->query($sql)) {
						echo "<option value='placeholder' selected disabled><font color='red'>Failed to execute query for articles</font></option>";
						log_put("[EDIT ARTICLE] ERROR! Failed to load articles list: [".$connection->errno."] ".$connection->error);
					}
					else {
						echo "<option value='placeholder' selected disabled>Выбрать статью...</option>";
						while ($select_article = $select_articles->fetch_assoc()) {
							echo "<option articleid='".$select_article['article_id']."' sortorder='".$select_article['article_sort_order']."' containerid='".$select_article['container_id']."'>".$select_article['article_title']."</option>";
						}
					}
				?>
				</select></p>
				<button onclick='loadContent()'>Загрузить контент</button>
				<button id='delArticle' class='special-button' onclick='deleteArticle()'>Удалить статью</button>
				<div id="editArtWrapper" class='edit-art-wrapper'>
					<p><label>Контейнер:</label><select id='editArtContChanged'>
					<?php 
						$sql = "SELECT container_id,container_title FROM containers ORDER BY container_sort_order";
						if (!$select_containers = $connection->query($sql)) {
							echo "<option value='placeholder' selected disabled><font color='red'>Failed to execute query for containers</font></option>";
							log_put("[EDIT ARTICLE] ERROR! Failed to load container list: [".$connection->errno."] ".$connection->error);
						}
						else {	
							while ($select_container = $select_containers->fetch_assoc()) {
								echo "<option containerid='".$select_container['container_id']."'>".$select_container['container_title']."</option>";
							}
						}
					?>
					</select></p>
					<p><label>Заголовок:</label><input id='editArtTitle' type=text></p>
					<p><label>Порядок сортировки:</label><input id="articleSortOrder" type='text'/></p>
				</div>
		</div>
		<div class='ckeditor-wrapper'>
			<textarea class='my-editor' name='article_editor'></textarea>
			<script type='text/javascript'>var article_editor = CKEDITOR.replace('article_editor');</script>
		</div>
		<div class='file-form'>
			<form action="watch_my_files.php" method="POST" target="myFiles" onsubmit="window.open('about:blank','myFiles','width=550,height=300');">
				<input class='myfiles' type="submit" value="Мои файлы" />
			</form>
			<button onclick="add_file('filewrapper',file_count)">Ещё файл</button>
			<form id='sendfiles' enctype="multipart/form-data" action="upload.php" method="POST"  target="uploadDialog" onsubmit="if (validate_my_files('sendfiles')) window.open('about:blank','uploadDialog','width=550,height=300'); else return false">
				<input type="hidden" name="MAX_FILE_SIZE" value="268435456‬‬" />
				<div id='filewrapper'>
					<script type='text/javascript'>add_file('filewrapper',file_count)</script>
				</div>
				<input class='special-button' type='submit' value='Загрузить файлы' />
			</form>
		</div>
	</div>
	<div id='contManager' class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'contmanager') echo "start-tab "?>tab-container'>
		<button onclick='loadContainers()'>Загрузить контейнеры</button>
		<button class='containers-api' onclick='addContainer()'>Добавить контейнер</button>
		<button class='containers-api special-button' onclick='storeContainers()'>Отправить изменения</button>
		<table id='containersLoadTarget' border='2px' cellspacing='0' cellpadding='4px'></table>
	</div>
	<div id='boardManager' class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'boardmanager') echo "start-tab "?>tab-container'>
		<button onclick='newBoard()'>Новое объявление</button>
		<button onclick='editBoard()'>Редактировать объявление</button>
		<button onclick="location.href='?mode=admintools&tab=boardmanager'">Обновить страницу</button>
		<button class='board-api special-button' onclick='storeBoard()'>Отправить изменения</button>
		<div class='board' id='newBoardWrapper'>
				<p><label>Заголовок:</label><input id='newBoardTitle' type=text></p>
				<p><label>Дата:</label><input id='newBoardDate' type=date></p>
		</div>
		<div id="editBoardWrapper" class="board">
			<p><label>Объявление:</label><select  id='boardArticleContainer'>
			<?php 
						$sql = "SELECT * FROM board ORDER BY board_sort_order";
						if (!$board = $connection->query($sql)) {
							echo "<option value='placeholder' selected disabled><font color='red'>Failed to execute query for board</font></option>";
							log_put("[NEW ARTICLE] ERROR! Failed to load board list: [".$connection->errno."] ".$connection->error);
						}
						else {
							echo "<option value='placeholder' selected disabled>Выбрать объявление...</option>";
							while ($board_article = $board->fetch_assoc()) {
								echo "<option date='".$board_article['date']."' sortorder='".$board_article['board_sort_order']."' boardid='".$board_article['board_id']."'>".$board_article['board_title']."</option>";
							}
						}
			?></select></p>
			<button onclick='loadBoardContent()'>Загрузить контент</button>
			<button id='delBoard' class='special-button' onclick='deleteBoard()'>Удалить объявление</button>
			<div id="editBoardFields">
				<p><label>Заголовок:</label><input id='editBoardTitle' type=text></p>
				<p><label>Дата:</label><input id='editBoardDate' type=date></p>
				<p><label>Порядок сортировки:</label><input id="boardSortOrder" type='text'/></p>
			</div>
		</div>
		<div class='board-ckeditor-wrapper'>
			<textarea class='board-editor' name='board_editor'></textarea>
			<script type='text/javascript'>var board_editor = CKEDITOR.replace('board_editor');</script>
		</div>
		<div class='file-form'>
			<form action="watch_my_files.php" method="POST" target="myFiles" onsubmit="window.open('about:blank','myFiles','width=550,height=300');">
				<input class='myfiles' type="submit" value="Мои файлы" />
			</form>
			<button onclick="add_file('filewrapperboard',file_count_board)">Ещё файл</button>
			<form id='sendfiles_board' enctype="multipart/form-data" action="upload.php" method="POST"  target="uploadDialog" onsubmit="if (validate_my_files('sendfiles_board')) window.open('about:blank','uploadDialog','width=550,height=300'); else return false">
				<input type="hidden" name="MAX_FILE_SIZE" value="268435456‬‬" />
				<div id='filewrapperboard'>
					<script type='text/javascript'>add_file('filewrapperboard',file_count_board)</script>
				</div>
				<input class='special-button' type='submit' value='Загрузить файлы' />
			</form>
		</div>
	</div>
	<div id='regUsers' class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'regusers') echo "start-tab "?>tab-container'>
		<div class="register-form">
			<button onclick='add_record()'>Ещё пользователь</button>
			<button class='special-button' onclick='register()'>Регистрация</button>
			<form id='register'>
				<script type='text/javascript'>add_record()</script>
			</form>
		</div>
	</div>
	<div id='viewFeedback' class='<?php if (isset($_GET['tab']) && $_GET['tab'] == 'viewfeedback') echo "start-tab "?>tab-container'>
		<?php
			if (!file_exists('feedback'))
				mkdir('feedback');
			$feedbacks = scandir("feedback");
			foreach($feedbacks as $feedback) {
				if ($feedback == "." or $feedback == "..")
					continue;
				echo "<button slaveid='".preg_replace("/\.txt/","",$feedback)."' onclick='foldMessage(this)'>".preg_replace("/\.txt/","",$feedback)."</button><br>";
				echo "<div id='".preg_replace("/\.txt/","",$feedback)."' class='feedback-msg'>".file_get_contents("feedback/".$feedback)."</div><br>";
			}
		?>
	</div>
</div>