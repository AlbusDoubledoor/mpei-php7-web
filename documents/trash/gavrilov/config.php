<?php

define ("db_host","localhost");
define ("db_name","portal");
define ("db_user","root");
define ("db_pass","root");
define ("db_table","articles");


$lin=mysqli_connect(db_host,db_user,db_pass) or die ("Нет соединения с сервером");
mysqli_select_db ($lin,db_name) or die ("Нет соединения с БД");
//mysqli_query($lin,"set names 'utf8'") or die("Не удалось установить кодировку соединения");
mysqli_set_charset($lin, "utf8") or die("Не удалось установить кодировку соединения");
//$lin= new mysqli(db_host,db_user,db_pass,db_name);
if (!mysqli_query($lin,"SELECT * FROM ".db_table)){
        die ("Нет соединения с таблицой");
    }

//$conn=mysql_connect($db_hostname, $db_username, $db_password) or die ("Нет подключения к серверу");
//mysql_select_db($db_database,$conn) or die ("Нет удалось соединиться с БД");
?>