<?php
	if (isset($_POST['go'])) {
			header("Content-Type: image/png");
			$img = imagecreate(800, 600);
			$white = imagecolorallocate($img, 255, 255, 255);
			$black = imagecolorallocate($img, 0, 0, 0);
			$blue = imagecolorallocate($img, 0, 0, 255);
			$red = imagecolorallocate($img, 255, 0, 0);
			$green = imagecolorallocate($img, 0, 255, 0);
			$yellow = imagecolorallocate($img, 255, 255, 0);
			$magenta = imagecolorallocate($img, 255, 0, 255);
			
			imageline($img, 49, 50, 49, 352, $black);
			imagesetthickness($img,2);
			imageline($img, 49, 352, 600, 352, $black);
			imagesetthickness($img,2);
			
			imagefilledrectangle($img, 50, 350, 150, 350-$_POST['n1']/100*350, $blue);
			imagefilledrectangle($img, 150, 350, 250, 350-$_POST['n2']/100*350, $red);
			imagefilledrectangle($img, 250, 350, 350, 350-$_POST['n3']/100*350, $green);
			imagefilledrectangle($img, 350, 350, 450, 350-$_POST['n4']/100*350, $yellow);
			imagefilledrectangle($img, 450, 350, 550, 350-$_POST['n5']/100*350, $magenta);
			
			$diagram = "Diagram";
			imageStringUp($img, 5, 25, 250, $diagram, $black);
			// Почему-то работает только через полный путь
			//ImageTTFtext($img, 16, 90, 25, 250, $black, "/font.ttf", "Диаграмма");
			imageString($img, 5, 100, 375, "N1", $black);
			imageString($img, 5, 200, 375, "N2", $black);
			imageString($img, 5, 300, 375, "N3", $black);
			imageString($img, 5, 400, 375, "N4", $black);
			imageString($img, 5, 500, 375, "N5", $black);
			
			imagepng($img);
			imagedestroy($img);
	}
?>