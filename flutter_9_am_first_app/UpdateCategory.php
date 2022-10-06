<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
	$new_category_name = $_POST['new_category_name'];
$new_category_image = $_POST['new_category_image'];
        $category_name = $_POST['category_name'];
	
    require_once('dbConnect.php');
	$sql = "UPDATE categories SET `Name` = '$new_category_name', `Image` = '$new_category_image' WHERE Name = '$category_name'";
	
	try{	
		mysqli_query($con,$sql);
		echo json_encode(array('result'=>true));
   	} catch (Exception $e){
	        echo json_encode(array('result'=>false));
    	}
	mysqli_close($con);
}