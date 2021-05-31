<?php

require 'conn.php';

$email = $_POST["email"];
$pass = $_POST["pass"];

$query = "SELECT * FROM cliente
          WHERE email =$email";
          

$queryResult = mysqli_query($conn, $query);
$count = mysqli_num_rows($queryResult);


if($count == 1) {
    
    $query = "SELECT * FROM cliente
          WHERE email =$email AND password =$pass";

    $queryResult = mysqli_query($conn, $query);
    $dados = mysqli_num_rows($queryResult);
    
    if($count == 1){
    
        echo json_encode("success");
        
    }else{
    
        echo json_encode("false");
    }
}else{
    echo json_encode("sem conta");
}


?>