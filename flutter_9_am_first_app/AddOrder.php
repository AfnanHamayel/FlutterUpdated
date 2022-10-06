<?php 
if($_SERVER['REQUEST_METHOD']=='POST'){
    $Id_users = $_POST['Id_users'];
    $TotalPrice  = $_POST['TotalPrice'];
    $Longitude = $_POST['Longitude'];
    $Latitude = $_POST['Latitude'];
    $Note = $_POST['Note'];
    require_once('dbConnect.php');
    $sql_insert_orderer ="INSERT INTO `orders` (`Id_users`,`TotalPrice`,`longitude`,`Latu`,`Note`)
                            VALUES ('$Id_users','$TotalPrice','$Longitude','$Latitude','$Note')";

  try{	
		mysqli_query($con,$sql_insert_orderer);
		echo json_encode(array('result'=>true));
   	} catch (Exception $e){
	        echo json_encode(array('result'=>false));
    	}
	mysqli_close($con);
}