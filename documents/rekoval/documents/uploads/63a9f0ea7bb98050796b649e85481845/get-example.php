<?php
if (isset($_GET["par1"]) && isset($_GET['par2']))
{
echo "Элемент массива \$_GET['par1']=".$_GET['par1']."<br>";
echo "Элемент массива \$_GET[\"par2\"]=".$_GET["par2"]."<br>";
}
$num=3.14;
$str="Кастомнаястрока";
echo "<a href='/uploads/63a9f0ea7bb98050796b649e85481845/get-example.php";
echo "?par1={$num}&par2={$str}'>";
echo "Передача параметров</a>";
?>