<?php

require 'conn.php';

$name = $_POST['name'];
$email = $_POST['email'];
$pass = $_POST['pass'];

$query = 'SELECT * FROM cliente
          WHERE email ='.$email;

$queryResult = mysqli_query($conn, $query);
$count = mysqli_num_rows($queryResult);

if($count == 1) {
    
    echo json_encode("conta existe");
} else{
    
    $query = "INSERT INTO cliente (idcliente, username, email, pass, favoritos_idfavoritos, pedido_idpedido)
          VALUES (null,'$name','$email','$pass',null,null)";

    $queryResult = mysqli_query($conn, $query);
    $dados = mysqli_num_rows($queryResult);

    if($count == 1){
    
        echo json_encode("success");
        
    }else{
    
        echo json_encode("false");
    }
}



?>