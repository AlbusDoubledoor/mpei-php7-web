<link rel="stylesheet" type="text/css" href="/resource/css/register_form.css">
<textarea class='my-editor' name='article_editor'></textarea>
<script type='text/javascript'>var article_editor = CKEDITOR.replace('article_editor');</script>
<form enctype="multipart/form-data" action="upload.php" method="POST"  target="uploadDialog" onsubmit="if (validate_my_files()) window.open('about:blank','uploadDialog','width=450,height=300'); else return false">
    <input type="hidden" name="MAX_FILE_SIZE" value="268435456‬‬" />
    Отправить этот файл: <input name="userfile" type="file" />
    <input type="submit" value="Отправить файл" />
</form>
<form action="watch_my_files.php" method "POST" target="myFiles" onsubmit="window.open('about:blank','myFiles','width=450,height=300');">
	<input type="submit" value="Мои файлы" />
</form>
<div class="register-form">
	<form id='register'>
		<script type='text/javascript'>add_record()</script>
	</form>
	<button class='more-button' name='more' onclick='add_record()'>Добавить</button>
	<button class='send-button' name='send' onclick='register()'>Отправить</button>
</div>