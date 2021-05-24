<?php
require "dbconfig.php";
header('Content-Type: application/json');
$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));


$query="SELECT * FROM login_spoiler";
$res=mysqli_query($conn,$query) or die (mysqli_error($conn));


while($rowTeam=mysqli_fetch_assoc($res))
{
    $arr[]=$rowTeam;
}


echo json_encode($arr);



mysqli_free_result($res);
mysqli_close($conn);
?>