<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
    $new_category = $_POST['new_category'];
  $image = $_POST['image'];
    require_once('dbConnect.php');
    $sql_insert_categories ="INSERT INTO `categories` (`Name`,`Image`,`Id_statetype`)
                            VALUES ('$new_category','$image','1')";

  try{	
		mysqli_query($con,$sql_insert_categories);
		echo json_encode(array('result'=>true));
   	} catch (Exception $e){
	        echo json_encode(array('result'=>false));
    	}
	mysqli_close($con);
}