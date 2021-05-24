<?php
session_start();
require "dbconfig.php";
header('Content-Type: application/json');
$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));

$id_notizia=mysqli_real_escape_string($conn,$_GET['q']);
$id_user=$_SESSION['_user_ID'];
$query="SELECT id_notizia,id_user FROM likes WHERE (id_notizia=$id_notizia AND id_user=$id_user)";

$res=mysqli_query($conn,$query) or die (mysqli_error($conn));
$arr=mysqli_fetch_assoc($res);


if($arr==null)
{
    echo json_encode($id_notizia);
}
else{
    echo json_encode($arr);
}




mysqli_free_result($res);
mysqli_close($conn);
?>