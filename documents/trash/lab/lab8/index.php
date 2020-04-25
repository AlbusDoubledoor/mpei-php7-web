<?php
	date_default_timezone_set("Europe/Moscow");
	function get_timestamp() {
		$timestamp = time();
		return date("d.m.Y H:i:s",$timestamp);
	}
	
	if (!file_exists("config.txt")) {
		$new_conf = fopen("config.txt","w+t");
		fputs($new_conf,"# servername with port".PHP_EOL);
		fputs($new_conf,"localhost:3306");
		fputs($new_conf,PHP_EOL."# username".PHP_EOL);
		fputs($new_conf,"root");
		fputs($new_conf,PHP_EOL."# password".PHP_EOL);
		fputs($new_conf,"root");
		fputs($new_conf,PHP_EOL.PHP_EOL."***!!! Don't change structure of this file !!!***");
	}
	$config = file("config.txt");
	$servername = trim($config[1]);
	$username = trim($config[3]);
	$password = trim($config[5]);
	$log = fopen("log.txt","a+t");
	$conn = new mysqli($servername, $username, $password);
	
	if ($conn->connect_error) {
		fputs($log,get_timestamp().":  "."Connection failed: ".$conn->connect_error.PHP_EOL);
		die("Connection failed: " . $conn->connect_error);
	} 
	
	$db_name = "a08";
	$create_db = "CREATE DATABASE ".$db_name;
	if ($conn->query($create_db)) {
		fputs($log,get_timestamp().":  "."Database ".$db_name." created successfully".PHP_EOL);
	} else {
		fputs($log,get_timestamp().":  "."Error creating database: ".$conn->error.PHP_EOL);
	}
	
	$use_db = "USE ".$db_name;
	if ($conn->query($use_db)) {
		fputs($log,get_timestamp().":  "."Changed to ".$db_name." successfully".PHP_EOL);
	} else {
		fputs($log,get_timestamp().":  "."Error using database: ".$conn->error.PHP_EOL);
	}
	
	$table_name = "koval_lab8";
	$table_struct = $table_name." (id int auto_increment primary key, lastname varchar(255), firstname varchar(255),sex varchar(255),salary varchar(255),resume text) ENGINE=MyISAM DEFAULT CHARSET=utf8";
	$create_table = "CREATE TABLE ".$table_struct;
	if ($conn->query($create_table)) {
		fputs($log,get_timestamp().":  "."Table ".$table_struct." created successfully".PHP_EOL);
	} else {
		fputs($log,get_timestamp().":  "."Error creating table: ".$conn->error.PHP_EOL);
	}
	
	if (isset($_POST['add'])) {
		$insert = "INSERT INTO ".$table_name." VALUES (0,";
		$insert = isset($_POST['lastname'])? $insert."'".$_POST['lastname']."'," : $insert."'',";
		$insert = isset($_POST['firstname'])? $insert."'".$_POST['firstname']."'," : $insert."'',";
		$insert = isset($_POST['sex'])? $insert."'".$_POST['sex']."'," : $insert."'',";
		$insert = isset($_POST['salary'])? $insert."'".$_POST['salary']."'," : $insert."'',";
		$insert = isset($_POST['resume'])? $insert."'".$_POST['resume']."')" : $insert."'')";
		
		if ($conn->query($insert)) {
			fputs($log,get_timestamp().":  "."Successfully inserted values into ".$table_name.PHP_EOL);
		} else {
			fputs($log,get_timestamp().":  "."Error inserting values: ".$conn->error.PHP_EOL);
		}
	}
	
	if (isset($_POST['delete']) && isset($_POST['recid'])) {
		if (ctype_digit($_POST['recid']) && $_POST['recid'] >= 0)
		{
			$delete = "DELETE FROM ".$table_name." WHERE id=".$_POST['recid'];
			
			if ($conn->query($delete)) {
				fputs($log,get_timestamp().":  "."Successfully deleted record from ".$table_name." with id = ".$_POST['recid'].PHP_EOL);
			} else {
				fputs($log,get_timestamp().":  "."Error deleting record: ".$conn->error.PHP_EOL);
			}
		}
		else
		{
			fputs($log,get_timestamp().":  "."Record id was incorrect (not positive integer): [    ".$_POST['recid']."    ]");
		}
	}
	
	if (isset($_POST['edit']) && isset($_POST['recid'])) {
		if (ctype_digit($_POST['recid']) && $_POST['recid'] >= 0)
		{
			$edit = "UPDATE ".$table_name." SET ";
			$edit = isset($_POST['lastname'])? $edit." lastname='".$_POST['lastname']."'," : $edit."lastname='',";
			$edit = isset($_POST['firstname'])? $edit."firstname='".$_POST['firstname']."'," : $edit."firstname='',";
			$edit = isset($_POST['sex'])? $edit."sex='".$_POST['sex']."'," : $edit."sex='',";
			$edit = isset($_POST['salary'])? $edit."salary='".$_POST['salary']."'," : $edit."salary='',";
			$edit = isset($_POST['resume'])? $edit."resume='".$_POST['resume']."' " : $edit."resume='' ";
			$edit = $edit." WHERE id=".$_POST['recid'];
			
			if ($conn->query($edit)) {
				fputs($log,get_timestamp().":  "."Successfully updated record from ".$table_name." with id = ".$_POST['recid'].PHP_EOL);
			} else {
				fputs($log,get_timestamp().":  "."Error updating record: ".$conn->error.PHP_EOL);
			}
		}
		else
		{
			fputs($log,get_timestamp().":  "."Record id was incorrect (not positive integer): [    ".$_POST['recid']."    ]");
		}
	}
	function check_submit() {
		return (isset($_POST['add']) || isset($_POST['edit']) || isset($_POST['delete']) || isset($_POST['view_record']));
	}
?>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Лабораторная работа №8</title>
    </head>
    <body>
        <br>
        <p><b><font size=4.5>Анкета сотрудника</font></b></p>
        <form action="index.php" method=POST>
        <table width=380px border=1px cellspacing=0 cellpadding=8px>
                <tr><td colspan=2><p>Фамилия: <input type=text name="lastname" value=<?php if (check_submit()) echo '"'.$_POST['lastname'].'"';?>>
                    <p>Имя: <input type=text name="firstname" value=<?php if (check_submit()) echo '"'.$_POST['firstname'].'"';?>>
                    <p>мужчина <input type=radio name="sex" value="мужчина" <?php if (!(check_submit()) || $_POST['sex']=="мужчина") echo "checked"?>> 
					женщина <input type=radio name="sex" value="женщина" <?php if (check_submit() && $_POST['sex']=="женщина") echo "checked";?>>
                    <p>Зарплата(руб): <input type=text name="salary" value=<?php if (isset($_POST['add']) || isset($_POST['edit']) || isset($_POST['delete'])) echo '"'.$_POST['salary'].'"';?>>
                    <p><textarea name="resume" cols=40 rows=6 wrap=virtual><?php if (check_submit()) echo $_POST['resume']; else echo "Резюме сотрудника";?></textarea></p></td></tr>
                <tr>
                    <td align=center><input type=submit name=add value="Добавить"></td>
                <td align=center><input type="submit" name=reset value=Очистить></td> <!-- Полная очистка страницы и формы -->
            </tr>
        </table>
		<p><b><font size=3.5>Редактирование записей</font></b></p>
		<p>Номер записи: <input type=text name="recid"></p>
		<p><input type=submit name=edit value="Отредактировать"><input type=submit name=delete style="margin-left:15px" value="Удалить"></p>
		<hr>
		<p><b><font size=3.5>Просмотр записей</font></b></p>
		<p>Номер записи: <input type=text name="view_recid"></p>
		<p>Все <input type=checkbox name="all_checkbox" checked></p>
		<p><input type=submit name=view_record value="Просмотреть записи"></p>
		</form>
		<?php
			if ($conn && (isset($_POST['view_recid']) || isset($_POST['all_checkbox']))) {
				if (isset($_POST['all_checkbox']) || ctype_digit($_POST['view_recid']) && $_POST['view_recid'] >= 0) {
				echo     "<table width=650px border=1px cellspacing=0 cellpadding=4px>
					<thead align='center' style='font-weight: bold;'>
					<tr>
						<td>Номер записи</td>
						<td>Фамилия</td>
						<td>Имя</td>
						<td>Пол</td>
						<td>Зарплата (руб.)</td>
						<td>Резюме сотрудника</td>
					</tr>
					</thead>";
					$view_rec = "SELECT * FROM ".$table_name;
					if ((!isset($_POST['all_checkbox']) || !($_POST['all_checkbox']))&&isset($_POST['view_recid']))
						$view_rec = $view_rec." WHERE id=".$_POST['view_recid'];	
					if ($result = $conn->query($view_rec)) 
					{
						echo "<tbody align='center'>";
						while($row = $result->fetch_assoc()) {
							echo "<tr>";
							echo "<td>".$row['id']."</td>";
							echo "<td>".$row['lastname']."</td>";
							echo "<td>".$row['firstname']."</td>";
							echo "<td>".$row['sex']."</td>";
							echo "<td>".$row['salary']."</td>";
							echo "<td>".$row['resume']."</td>";
						}
						echo "</tbody>";
					}
					else
					{
						fputs($log,get_timestamp().":  "."Error selecting records: ".$conn->error.PHP_EOL);
					}
					
				}
				else {
					fputs($log,get_timestamp().":  "."Record id was incorrect (not positive integer): [    ".$_POST['view_recid']."    ]");
				}
			}
		?>
    </body>
</html>
