<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
	$new_item_name = $_POST['new_item_name'];
$price = $_POST['price'];
$home_image = $_POST['home_image'];
$des = $_POST['des'];
        $item_name = $_POST['item_name'];
	
    require_once('dbConnect.php');
	$sql = "UPDATE items SET `Name` = '$new_item_name', `Price` = '$price', `HomeImage` = '$home_image', `Des` = '$des'   WHERE Name = '$item_name'";
	
	try{	
		mysqli_query($con,$sql);
		echo json_encode(array('result'=>true));
   	} catch (Exception $e){
	        echo json_encode(array('result'=>false));
    	}
	mysqli_close($con);
}