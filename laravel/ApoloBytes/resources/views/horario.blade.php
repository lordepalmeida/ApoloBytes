<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="storage/images/IMG-1781.PNG" href="">
    <title>Apolo Bytes</title>

    <!-- Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="http://code.jquery.com/jquery.js"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/apolobytes.css">

</head>

<script>
    $(document).ready(function() {
        $("#btn-contacto").click(function() {
            $("#main").load("/contacto");
        })
    })
</script>

<!-- Styles -->
<style>
    html,
    body {
        background-color: #141414;
        color: white;
        font-family: sans-serif;
        font-weight: 200;
        height: 100%;
        margin: 0;
    }

    .full-height {
        height: 100vh;
    }

    .content {
        text-align: center;
    }

    .sidebar {
        margin: 0;
        padding: 0;
        width: 9%;
        background-color: #FA5B0C;
        position: fixed;
        height: 100%;
        overflow: auto;
    }

    .sidebar a {
        display: block;
        color: white;
        padding: 16px;
        text-decoration: none;
        height: 20%;
        text-align-last: center;
        border-bottom: 1.5px solid black;
    }

    .sidebar a.active {
        background-color: #F99072;
        color: #64382C;
        font-style: bold;
    }

    .sidebar a:hover:not(.active) {
        background-color: #F99072;
        color: white;
    }

    div.content {
        margin-left: 10%;
        padding: 1px 16px;
        height: 100px;
    }

    .icon {
        color: white;
        font-size: 90px;
        margin-top: 25%;
    }

    .icon.active {
        color: #64382C;
    }

    .sidenav {
        height: 100%;
        width: 400px;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: #FA5B0C;
        overflow-x: hidden;
        padding-top: 60px;
        border-right: 1px solid black;
        transition: 0.5s;
        text-align: left;
    }

    .sidenav a {
        padding: 8px 8px 8px 32px;
        font-size: 25px;
        color: white;
        display: block;
        transition: 0.3s;
        text-decoration: none;
    }

    .sidenav a:hover {
        color: #64382C;
    }

    .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 20px;
        font-size: 50px;
        margin-left: 50px;
        color: white;
    }

    .sidenav h3 {
        font-family: 'Space';
        color: black;
        font-size: 30px;
        display: block;

    }

    li {
        list-style-type: none;
    }

    .btn:hover {
        background-color: #FA5B0C;
        border-color: #FA5B0C;
    }

    #time {
        background-color: grey;
        border: none;
    }

    .btn-guardar {
        background-color: #FA5B0C;
        border-color: #FA5B0C;
        color: white;
    }

    .btn-cancelar {
        background-color: grey;
        border-color: grey;
        color: white;
    }
</style>


<body>

    <div class="sidebar">
        <a class="a-sidebar" href="#home"><span onclick="openNav()"><i class="fas fa-bars icon"></i></span></a>
        <a class="a-sidebar" href="welcome"><i class="fas fa-receipt icon"></i></a>
        <a class="a-sidebar active" href="inventario"><i class="fas fa-carrot icon active"></i></a>
        <a class="a-sidebar" href="cardapio"><i class="fas fa-book-open icon"></i></a>
        <a class="a-sidebar" href="#"><i class="fas fa-hand-paper icon"></i></a>
    </div>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">
            <h3>Apolo Bytes</h3>
        </a>
        <hr class="text-center" style="width: 90%; margin-left: 5%;"><br>
        <a href="#">Horário de Funcionamento</a>
        <a href="{{route('restaurantes.index')}}">O nosso restaurante</a>
        <a href="#">Definições</a>
        <a href="#">Ajuda</a>
        <a href="contacto" id="btn-contacto">Contacte-nos</a>
    </div>

    <div id="main" class="content">

        @include('partials.authentication')

        <h1 class="p-5 mt-4">Horário de Funcionamento</h1>
        <div class="container">
            <div class="row">
                <div class="col fs-3">
                    Dias de Funcionamento
                </div>
            </div>
            <div class="row p-4" style="margin-left:28%">
                <div class="col-md-1 col-lg-1 col-sm-6">
                    <button class="btn btn-secondary">Seg</button>
                </div>
                <div class="col-md-1 col-lg-1 col-sm-6">
                    <button class="btn btn-secondary">Ter</button>
                </div>
                <div class="col-md-1 col-lg-1 col-sm-6">
                    <button class="btn btn-secondary">Qua</button>
                </div>
                <div class="col-md-1 col-lg-1 col-sm-6">
                    <button class="btn btn-secondary">Qui</button>
                </div>
                <div class="col-md-1 col-lg-1 col-sm-6">
                    <button class="btn btn-secondary">Sex</button>
                </div>
                <div class="col-md-1 col-lg-1 col-sm-6">
                    <button class="btn btn-secondary">Sáb</button>
                </div>
                <div class="col-md-1 col-lg-1 col-sm-6">
                    <button class="btn btn-secondary">Dom</button>
                </div>
            </div>
        </div>

        <div class="container p-5">
            <div class="row">
                <div class="col fs-3 mt-4">
                    Horário de Funcionamento
                </div>
            </div>
            <div class="row fs-4 p-4">
                <div class="col-md-6 col-lg-6 col-sm-12">
                    Horário de Abertura
                </div>
                <div class="col-md-6 col-lg-6 col-sm-12">
                    Horário de Encerramento
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-6 col-sm-12">
                    <input id="time" type="time" id="appt" name="appt" min="09:00" max="24:00" required>
                </div>
                <div class="col-md-6 col-lg-6 col-sm-12">
                    <input id="time" type="time" id="appt" name="appt" min="09:00" max="24:00" required>
                </div>
            </div>
        </div>

        <div class="container w-50 p-5">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <button class="btn-guardar w-50 fs-4">Guardar</button>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <button class="btn-cancelar w-50 fs-4">Cancelar</button>
                </div>
            </div>
        </div>


    </div>
</body>

<script>
    function closeNav() {
        window.history.back();
    }
</script>

</html>