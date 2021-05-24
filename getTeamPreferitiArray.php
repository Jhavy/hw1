<?php
session_start();
require "dbconfig.php";
header('Content-Type: application/json');
$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));

      $arr=[];
$id_user=$_SESSION['_user_ID'];
$query="SELECT id_team,id_user FROM favouriteTeams WHERE (id_user=$id_user)";

$res=mysqli_query($conn,$query) or die (mysqli_error($conn));


while($rowTeam=mysqli_fetch_assoc($res))
{
    $arr[]=$rowTeam;
}


    if(count($arr)==0)
    {
        echo json_encode(null);
    }
    else{
        echo json_encode($arr);
    }

mysqli_free_result($res);
mysqli_close($conn);
?>