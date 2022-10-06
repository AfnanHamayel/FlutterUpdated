<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
	require_once('dbConnect.php');	

	$sql = "SELECT * FROM `items` where 
	 Id_statetype = '1'";
	$r = mysqli_query($con,$sql);
	$result = array();
	while($row = mysqli_fetch_array($r)){
		array_push($result,array(
			"Id"=>$row['Id'],
			"Name"=>$row['Name'],
			"Price"=>(double)$row['Price'],
            "Des"=>$row['Des'],
            "HomeImage"=>$row['HomeImage'],
	       "Count"=>(double)$row['Count'],
		));
	}
	echo json_encode(array('items'=>$result));
	mysqli_close($con);
}
