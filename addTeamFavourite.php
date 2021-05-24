<?php
session_start();
require "dbconfig.php";

$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));

$id_team=mysqli_real_escape_string($conn,$_GET['q']);
$id_user=$_SESSION['_user_ID'];

$query="INSERT into favouriteTeams(id_user,id_team) VALUES($id_user,$id_team)";

$res=mysqli_query($conn,$query) or die (mysqli_error($conn));


mysqli_free_result($res);
mysqli_close($conn);
?>