<?php
require "dbconfig.php";
header('Content-Type: application/json');
$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));


$query="SELECT nome,id_team,punti FROM pilota";
$res=mysqli_query($conn,$query) or die (mysqli_error($conn));


while($rowPilota=mysqli_fetch_assoc($res))
{
    $id_team=$rowPilota['id_team'];
    $query2="SELECT nome FROM dati_teams WHERE id_team=$id_team";
    $res2=mysqli_query($conn,$query2) or die (mysqli_error($conn));
    $rowTeam=mysqli_fetch_assoc($res2);
    $rowPilota['nome_team']=$rowTeam['nome'];
    $arr[]=$rowPilota;
}


echo json_encode($arr);



mysqli_free_result($res);
mysqli_close($conn);
?>