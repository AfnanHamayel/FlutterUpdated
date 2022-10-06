<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
	$Id = $_POST['Id'];
	$Count = $_POST['Count'];
    require_once('dbConnect.php');
	$sql = "UPDATE cart SET `count` = '$Count' WHERE Id = $Id;";
	
	try{	
		mysqli_query($con,$sql);
		echo json_encode(array('result'=>true));
   	} catch (Exception $e){
	        echo json_encode(array('result'=>false));
    	}
	mysqli_close($con);
}
