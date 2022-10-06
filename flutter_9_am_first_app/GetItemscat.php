<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
    $Id_categories =$_POST["Id_categories"];
	require_once('dbConnect.php');	
	$sql = "SELECT * FROM `items` where 
	Id_categories = '$Id_categories' and Id_statetype = '1'";
	$r = mysqli_query($con,$sql);
	$result = array();
	while($row = mysqli_fetch_array($r)){
		array_push($result,array(
			"Id"=>$row['Id'],
			"Name"=>$row['Name'],
			"Price"=>(double)$row['Price'],
            "Des"=>$row['Des'],
            "HomeImage"=>$row['HomeImage'], 
            "Count"=>(int)$row['Count'],     
		));
	}
	echo json_encode(array('items'=>$result));
	mysqli_close($con);
}