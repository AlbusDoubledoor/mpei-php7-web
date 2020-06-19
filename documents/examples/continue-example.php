<?php
$arr = array(1,2,3,4,5,6,7,8,9,10);
foreach ($arr as $key => $value) {
	if (!($key % 2)) {
		continue;
	}
	echo "$value <br />"; 
}

$i = 0;
while ($i++ < 5) {
	echo "Снаружи<br />";
	while (1) {
		echo "В середине <br />";
		while (1) {
			echo "Внутри<br />";
			continue 3;
		}
		echo "Это никогда не будет выведено.<br />";
	}
	echo "Это тоже.<br />";
}
?>