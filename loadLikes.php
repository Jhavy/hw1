<?php
require "dbconfig.php";
header('Content-Type: application/json');
$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));

$id_notizia=mysqli_real_escape_string($conn,$_GET['q']);
$query="SELECT id_notizia,count(*) as conto FROM likes WHERE (id_notizia= $id_notizia)";

$res=mysqli_query($conn,$query) or die (mysqli_error($conn));

$arr=mysqli_fetch_assoc($res);

 if($arr['id_notizia']!=null)
 {
       echo json_encode($arr);
 }
 else{
       echo json_encode($id_notizia);
 }

mysqli_free_result($res);
mysqli_close($conn);
?>