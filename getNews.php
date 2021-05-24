<?php
require "dbconfig.php";
header('Content-Type: application/json');
$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));

$id_notizia=mysqli_real_escape_string($conn,$_GET['q']);

$query="SELECT id,titolo,descrizione,percorso_foto FROM notizie WHERE id='$id_notizia.'";
$res=mysqli_query($conn,$query) or die (mysqli_error($conn));


$arr=mysqli_fetch_assoc($res);

echo json_encode($arr);


mysqli_free_result($res);
mysqli_close($conn);
?>