<html>
<head>
<meta charset="utf-8"/></head>
<body>
<?php
$vasya = "VASYA BOYA";
echo "Vasya? {$vasya}paper da";
$idcon = mysqli_connect("localhost:3306","root","root","test");
echo "<h3>MySQL Connection STATUS:<br>";
echo $idcon? "<font color=green>SUCCESS</font>": "<font color=red>FAIL</font>";
echo "</h3><br>";
$query = mysqli_query($idcon,"SELECT CAST(phpcode AS CHAR(1000) CHARACTER SET utf8) AS phpcode FROM test");
$row = mysqli_fetch_assoc($query);
$str = $row['phpcode'];
eval($str);
mysqli_close($idcon);
?>
</body>
</html>
