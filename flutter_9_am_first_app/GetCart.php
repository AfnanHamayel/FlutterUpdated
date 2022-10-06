<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
    $Id_users =$_POST["Id_users"];
	require_once('dbConnect.php');	
	$sql = "SELECT cart.Id,cart.Id_items,cart.count,
	items.Name,items.HomeImage,items.Price
	 FROM `cart` JOIN `items` 
	 ON (cart.Id_items = items.Id) 
	 WHERE cart.Id_users = '$Id_users'";
	$r = mysqli_query($con,$sql);
	$result = array();
	while($row = mysqli_fetch_array($r)){
		array_push($result,array(
			"Id"=>$row['Id'],
			"Id_items"=>$row['Id_items'],
			"Name"=>$row['Name'],
			"Price"=>(double)$row['Price'],
            "count"=>(int)$row['count'],
            "HomeImage"=>$row['HomeImage'],
		));
	}
	echo json_encode(array('cart'=>$result));
	mysqli_close($con);
}