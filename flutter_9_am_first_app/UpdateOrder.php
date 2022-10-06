<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
	$order_status = $_POST['order_status'];
       $order_id = $_POST['order_id'];
	
    require_once('dbConnect.php');
	$sql = "UPDATE orders SET `status` = '$order_status'  WHERE Id  = '$order_id'";
	
	try{	
		mysqli_query($con,$sql);
		echo json_encode(array('result'=>true));
   	} catch (Exception $e){
	        echo json_encode(array('result'=>false));
    	}
	mysqli_close($con);
}