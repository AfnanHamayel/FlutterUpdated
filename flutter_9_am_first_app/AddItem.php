<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){

    $new_item = $_POST['new_item'];
    $id_category = $_POST['id_category'];
  $price = $_POST['price'];
   $Des = $_POST['Des'];
$image = $_POST['image'];

    require_once('dbConnect.php');
    $sql_insert_items ="INSERT INTO `items` (`Name`, `Price`, `HomeImage`, `Des`, `Id_statetype`, `Id_categories`) 
VALUES ('$new_item', '$price', '$image', '$Des', '1', '$id_category')";

  try{	
		mysqli_query($con,$sql_insert_items );
		echo json_encode(array('result'=>true));
   	} catch (Exception $e){
	        echo json_encode(array('result'=>false));
    	}
	mysqli_close($con);
}
?>