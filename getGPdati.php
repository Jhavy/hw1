<?php
session_start();
require "dbconfig.php";
header('Content-Type: application/json');
$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));
  
$id_user=$_SESSION['_user_ID'];
$query="SELECT * FROM gran_premio";
$arr=[];
$res=mysqli_query($conn,$query) or die (mysqli_error($conn));


while($rowGP=mysqli_fetch_assoc($res))
{
    $arr[]=$rowGP;
}


echo json_encode($arr);
    

mysqli_free_result($res);
mysqli_close($conn);
?>