<?php
require "dbconfig.php";
header('Content-Type: application/json');
$conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));


$arr=[];
$id_ordine=mysqli_real_escape_string($conn,$_GET['q']);

$query="SELECT id_ordine,nome_prodotto,qta_prodotto FROM subOrdine WHERE (id_ordine=$id_ordine)";
$res=mysqli_query($conn,$query) or die (mysqli_error($conn));
while($row=mysqli_fetch_assoc($res))
{
    $arr[]=$row;
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