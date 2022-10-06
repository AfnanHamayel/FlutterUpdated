<?php 
	require_once('dbConnect.php');	
	$sql = "SELECT * FROM `banarImages`";
	$r = mysqli_query($con,$sql);
	$result = array();
	while($row = mysqli_fetch_array($r)){
		array_push($result,array(
			"Id"=>$row['Id'],
			"Image"=>$row['Image'],
		));
	}
	echo json_encode(array('images'=>$result));
	mysqli_close($con);
	