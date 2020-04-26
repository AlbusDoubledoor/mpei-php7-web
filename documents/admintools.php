<link rel="stylesheet" type="text/css" href="/resource/css/buttons.css">
<link rel="stylesheet" type="text/css" href="/resource/css/tabs.css">
<link rel="stylesheet" type="text/css" href="/resource/css/forms.css">
<div class='tabs'>
	<button class='selected tab-button' onclick='openTabContainer("artManager",this)'>Управление статьями</button>
	<button class='tab-button' onclick='openTabContainer("contManager",this)'>Управление контейнерами</button>
	<button class='tab-button' onclick='openTabContainer("regUsers",this)'>Регистрация пользователей</button>
</div>
<div class='tabframe main-button'>
	<div id='artManager' class='start-tab tab-container'>
		<button onclick="newArticle()">Новая статья</button>
		<button onclick="editArticle()">Редактировать статью</button>
		<button onclick="location.reload()">Обновить страницу</button>
		<button class="special-button" onclick="storeArticle()">Отправить статью</button>
		<div class='new-article article-fields' id='newArticle'>
				<p><label>Заголовок:</label><input id='newArtTitle' type=text></p>
				<p><label>Контейнер:</label><select>
				<?php 
					$sql = "SELECT container_title FROM containers ORDER BY container_sort_order";
					$select_containers = $connection->query($sql);
					while ($select_container = $select_containers->fetch_assoc()) {
						echo "<option>".$select_container['container_title']."</option>";
					}
				?>
				</select></p>
		</div>
		<div class='edit-article article-fields' id='editArticle'>
				<p><label>Контейнер:</label><select id='editArtContList' onchange='refreshArtList()'>
				<?php 
					$sql = "SELECT container_id,container_title FROM containers ORDER BY container_sort_order";
					$select_containers = $connection->query($sql);
					while ($select_container = $select_containers->fetch_assoc()) {
						echo "<option id='".$select_container['container_id']."'>".$select_container['container_title']."</option>";
					}
				?>
				</select></p>
				<p><label>Статья:</label><select id='editArtList'>
				<?php 
					$sql = "SELECT container_id,article_title FROM articles ORDER BY article_sort_order";
					$select_articles = $connection->query($sql);
					while ($select_article = $select_articles->fetch_assoc()) {
						echo "<option class='hidden-option' containerid='".$select_article['container_id']."'>".$select_article['article_title']."</option>";
					}
				?>
				</select></p>
		</div>
		<div class='ckeditor-wrapper'>
			<textarea class='my-editor' name='article_editor'></textarea>
			<script type='text/javascript'>var article_editor = CKEDITOR.replace('article_editor');</script>
		</div>
		<div class='file-form'>
			<form action="watch_my_files.php" method="POST" target="myFiles" onsubmit="window.open('about:blank','myFiles','width=450,height=300');">
				<input id='myfiles' type="submit" value="Мои файлы" />
			</form>
			<button onclick="add_file()">Ещё файл</button>
			<form id='sendfiles' enctype="multipart/form-data" action="upload.php" method="POST"  target="uploadDialog" onsubmit="if (validate_my_files()) window.open('about:blank','uploadDialog','width=450,height=300'); else return false">
				<input type="hidden" name="MAX_FILE_SIZE" value="268435456‬‬" />
				<div id='filewrapper'>
					<script type='text/javascript'>add_file()</script>
				</div>
				<input class='special-button' type='submit' value='Загрузить файлы' />
			</form>
		</div>
	</div>
	<div id='contManager' class='tab-container register-buttons'>
		<button onclick='loadContainers()'>Загрузить контейнеры</button>
		<button class='containers-api' onclick='addContainer()'>Добавить контейнер</button>
		<button class='containers-api special-button' onclick='storeContainers()'>Отправить изменения</button>
		<table id='containersLoadTarget' border='2px' cellspacing='0' cellpadding='4px'></table>
	</div>
	<div id='regUsers' class='tab-container'>
		<div class="register-form">
			<div class='register-buttons'>
				<button onclick='add_record()'>Ещё пользователь</button>
				<button class='special-button' onclick='register()'>Регистрация</button>
			</div>
			<form id='register'>
				<script type='text/javascript'>add_record()</script>
			</form>
		</div>
	</div>
</div>