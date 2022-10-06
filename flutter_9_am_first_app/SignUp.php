<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
	$Email = $_POST['Email'];
	$Name = $_POST['Name'];
	$Phone = $_POST['Phone'];
	$Password = $_POST['Password'];
	require_once('dbConnect.php');		
	$sql = "INSERT INTO `users` (`Email`,`Name`,`Phone`,`Password`) 
	VALUES ('$Email','$Name','$Phone','$Password');";
	
	try{	
		mysqli_query($con,$sql);
		echo json_encode(array('result'=>true, 
					'Id'=> (String)$con->insert_id,
					'Name'=> $Name,
					'Email'=> $Email,
					'Phone'=> $Phone,
					)
				);
   	} catch (Exception $e){
		echo json_encode(array('result'=>false,"msg"=>"email is exist"));
    	}
	mysqli_close($con);
}
        
