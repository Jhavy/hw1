<?php
// Verifica alla registrazione se lo username è gia in utilizzo oppure è libero
require "dbconfig.php";

header('Content-Type: application/json');

$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));

$username=mysqli_real_escape_string($conn,$_GET['q']);

$query="SELECT username FROM user WHERE username='".$username."'";
$res=mysqli_query($conn,$query) or die (mysqli_error($conn));

echo json_encode(array('presente' => mysqli_num_rows($res) > 0 ? true : false));

mysqli_free_result($res);
mysqli_close($conn);
?>