<html>
    <head>
        <meta charset="utf-8"/>
        <title>Лабораторная работа №5</title>
    </head>
    <body>
    <?php
    function display() {
        if (file_exists("./databases.txt")) {
            echo     "<table width=650px border=1px cellspacing=0 cellpadding=4px>
        <thead align=center style='font-weight: bold;'>
        <tr>
            <td>Номер записи</td>
            <td>Фамилия</td>
            <td>Имя</td>
            <td>Пол</td>
            <td>Зарплата (руб.)</td>
            <td>Резюме сотрудника</td>
        </tr>
        </thead><tbody align=center>";
            $databases = file("./databases.txt");
            foreach($databases as $value) {
                $temp = explode("\t",$value);
                echo "<tr>";
                for($i = 0; $i < 6; ++$i) {
                    echo "<td>".$temp[$i]."</td>";
                }
                echo "</tr>";
            }
                            echo "</tbody></table>";
                            }
        }
    ?>
    <?php
        if (isset($_POST['go'])) {
            $data =  $_POST['lastname']."\t".$_POST['firstname']."\t".$_POST['sex']."\t".$_POST['salary']."\t".$_POST['resume'].chr(13).chr(10);
            if (!file_exists("./databases.txt"))
			{
				$newfile = fopen("./databases.txt","wt");
				fclose($newfile);
			}
			$lines = file("./databases.txt");
            if ($_POST['recid'] != "") {
                foreach($lines as $str) {
                    $item = explode("\t",$str);
                    if ($item[0] == $_POST['recid']) {
                        $lines[$item[0]-1] = $item[0]."\t".$data;
                        $databases = fopen("./databases.txt","w+t");
                        foreach($lines as $value)
                            fwrite($databases,$value);
                        break;
                    }
                }
            }
            else
            {
                $databases = fopen("./databases.txt","a+t");
				if ((count($lines)-1) < 0)
					$id = 1;
				else	
				{
					$record = $lines[count($lines)-1];
					$exploded = explode("\t",$record); 
					$id = (int)$exploded[0] + 1;
				}
				$record = (string)$id."\t".$data;
				fwrite($databases,$record);
            }
            fclose($databases);
        }
        display();
    ?>
        <br>
        <p><b><font size=4.5>Анкета сотрудника</font></b></p>
        <form action="index.php" method=POST>
        <p>Номер записи:<input type=text name="recid" value=<?php if (isset($_POST['go'])) echo '"'.$_POST['recid'].'"';?>></p>
        <table width=380px border=1px cellspacing=0 cellpadding=8px>
                <tr><td colspan=2><p>Фамилия: <input type=text name="lastname" value=<?php if (isset($_POST['go'])) echo '"'.$_POST['lastname'].'"';?>>
                    <p>Имя: <input type=text name="firstname" value=<?php if (isset($_POST['go'])) echo '"'.$_POST['firstname'].'"';?>>
                    <p>мужчина <input type=radio name="sex" value="мужчина" <?php if (!isset($_POST['go']) || $_POST['sex']=="мужчина") echo "checked"?>></input> женщина <input type=radio name="sex" value="женщина" <?php if (isset($_POST['go']) && $_POST['sex']=="женщина") echo "checked";?>>
                    <p>Зарплата(руб): <input type=text name="salary" value=<?php if (isset($_POST['go'])) echo '"'.$_POST['salary'].'"';?>>
                    <p><textarea name="resume" cols=40 rows=6 wrap=virtual><?php if (isset($_POST['go'])) echo $_POST['resume']; else echo "Резюме сотрудника";?></textarea></p></td></tr>
                <tr>
                    <td align=center><input type=submit name=go value=Выполнить></td>
            </form>
            <form action="index.php" method=POST>
                <td align=center><input type="submit" name=reset value=Очистить></td> <!-- Полная очистка страницы и формы -->
            </form>
            </tr>
        </table>
    </body>
</html>
