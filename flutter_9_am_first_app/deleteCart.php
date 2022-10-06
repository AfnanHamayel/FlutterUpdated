<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
	$Id = $_POST['Id'];
	$sql ="DELETE from `cart` where `Id` = '$Id'";
	require_once('dbConnect.php');
	
	try{	
		mysqli_query($con,$sql);
		echo json_encode(array('result'=>true));
   	} catch (Exception $e){
	        echo json_encode(array('result'=>false));
    	}
			

	mysqli_close($con);
}
        
