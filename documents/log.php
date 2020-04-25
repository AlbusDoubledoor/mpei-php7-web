<?php
	date_default_timezone_set("Europe/Moscow");
	
	function get_timestamp() {
		$timestamp = time();
		return date("d.m.Y H:i:s",$timestamp);
	}
	
	function log_put($msg) {
			global $log;
			fputs($log,get_timestamp()."  ".$msg.PHP_EOL);
		}
	$log = fopen("log.txt","a+t");
?>