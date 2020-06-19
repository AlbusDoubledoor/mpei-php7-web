<?php
	$arr = array(2,7,3,5,999,9,11,1,6);
	
	// Пузырьковая сортировка по возрастанию
	for($i = 0; $i < count($arr); ++$i) {
		for ($j = 0; $j < count($arr); ++$j) {
			if ($arr[$j] == 999)
				continue; // пропускаем число 999
			if ($arr[$i]< $arr[$j])
			{
				$tmp = $arr[$i];
				$arr[$i] = $arr[$j];
				$arr[$j] =$tmp; 
			}
		}
	}
	
	// Выводим по возрастанию, 999 стоит на месте
	foreach($arr as $value) {
		echo "$value <br />";
	}
	echo "<br />";
	
	// Выводим теперь по убыванию (включая 999)
	rsort($arr);
	foreach($arr as $value) {
		echo "$value <br />";
	}
?>