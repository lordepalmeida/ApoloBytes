<?php

require 'config/config.php';

$dados = array();

$query = "SELECT * FROM restaurantes";

$queryResult = mysqli_query($conn, $query);

while($row = mysqli_fetch_assoc($queryResult)){
    array_push($dados, $row);
}

/*$query = $pdo->query("SELECT * FROM restaurantes");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0, $i < count($res), $i++) {
    foreach ($res[$i] as $key => $value) {}
        $dados = $res;
}*/

/*$sql = 'SELECT * FROM restaurantes';
$sth = $dbh->prepare($sql);
$sth->execute();
while($dt = $sth->fetchObject()){
    $dados = $dt;
}*/

echo json_encode($dados);
die();
?>