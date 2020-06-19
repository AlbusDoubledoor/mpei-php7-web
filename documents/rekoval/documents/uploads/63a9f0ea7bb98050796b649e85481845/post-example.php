<?php
if (isset($_POST['go']))  {
    echo "Текстовое поле txt - {$_POST['txt']}<br>";
    echo "Поле ввода пароля passw - {$_POST['passw']}<br>";
    echo "Одновариантный выбор select - {$_POST['sex']}<br>";
    echo "Значение кнопки формы submit - {$_POST['go']}<br>";
    echo "<hr><hr>";
}
?>
<form action="/uploads/63a9f0ea7bb98050796b649e85481845/post-example.php"" method="POST">
  Текстовое поле txt <input type="text" name="txt"><br>
  Поле ввода пароля pwd <input type="password" name="passw"><br>
  Пол:
  <select name="sex">
    <option value="мужской">мужской 
    <option value="женский">женский
  </select>
  <hr>
  <input type="submit" name="go" value="Отправить">
  <input type="reset" value="Очистить форму">
</form>