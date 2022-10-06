<?php 
	require_once('dbConnect.php');	
	$sql = "SELECT * FROM `categories` where Id_statetype = '1'";
	$r = mysqli_query($con,$sql);
	$result = array();
	while($row = mysqli_fetch_array($r)){
		array_push($result,array(
			"Id"=>$row['Id'],
			"Name"=>$row['Name'],
			"Image"=>$row['Image'],
		));
	}
	echo json_encode(array('categories'=>$result));
	mysqli_close($con);
	