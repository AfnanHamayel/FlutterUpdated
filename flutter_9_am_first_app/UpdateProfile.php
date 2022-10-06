<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
	$Id = $_POST['Id'];
	$Name = $_POST['Name'];
	$Email = $_POST['Email'];	
        $Phone = $_POST['Phone'];
        $Password = $_POST['Password'];
    require_once('dbConnect.php');
	$sql = "UPDATE users SET `Name` = '$Name', `Email` = '$Email', `Phone` = '$Phone', `Password` = '$Password'  WHERE Id = '$Id'";
	
	try{	
		mysqli_query($con,$sql);
		echo json_encode(array('result'=>true));
   	} catch (Exception $e){
	        echo json_encode(array('result'=>false));
    	}
	mysqli_close($con);
}