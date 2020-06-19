<?php

require_once 'config.php';


function selectText()
{
	global $lin;
	$text = array();
	$query="SELECT * FROM ".db_table." ORDER BY id;";
	$result=mysqli_query($lin,$query);
	
	
	//$row = mysqli_fetch_array($result);
	//echo $row['text'];
	
	for($i=0;$i<mysqli_num_rows($result);$i++)
	{
		mysqli_data_seek($result,$i);
		$text[]=mysqli_fetch_assoc($result);
	}
	
	mysqli_free_result($result);
return $text;

}

function update($txt,$id,$name){
	global $lin;
	$query = "UPDATE ".db_name.".".db_table." SET text='".$txt."', name='".$name."' WHERE id=".$id;
	mysqli_query($lin,$query);
	//mysqli_close($lin);
}

function add($txt,$name){
	global $lin;
	$query = "INSERT INTO ".db_name.".".db_table." (text,name) VALUES ('".$txt."','".$name."')";
	mysqli_query($lin,$query);
	//mysqli_close($lin);
}

function del($id){
	global $lin;
	$query = "DELETE FROM ".db_name.".".db_table." WHERE id=".$id;
	mysqli_query($lin,$query);
	//mysqli_close($lin);
}



?>