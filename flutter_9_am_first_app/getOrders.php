<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
    $Id_users =$_POST["Id_users"];

	require_once('dbConnect.php');	
	$sql = "SELECT * FROM `orders` where Id_users = '$Id_users'";
	$r = mysqli_query($con,$sql);
	$result = array();
	while($row = mysqli_fetch_array($r)){
		array_push($result,array(
			"Id"=>$row['Id'],
			"TotalPrice"=>$row['TotalPrice'],
		));
	}
	echo json_encode(array('order'=>$result));
	mysqli_close($con);
}