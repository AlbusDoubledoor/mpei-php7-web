<?php
		$uploaddir = 'uploads/';
		$uploadfile = $uploaddir.basename($_FILES['userfile']['name']);

		echo "<pre>";
		if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
			echo "Файл корректен и был успешно загружен.\n";
		} else {
			echo "Ошибка загрузки файла.\n";
		}
		print_r($_FILES);
		echo "</pre>";
?>