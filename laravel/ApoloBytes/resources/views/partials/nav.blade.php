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
        font-size: 450%;
        margin-top: 25%;
    }

    .icon.active {
        color: #64382C;
    }

    .sidenav {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: #FA5B0C;
        overflow-x: hidden;
        padding-top: 60px;
        border-right: 1px solid black;
        transition: 0.5s;
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

    #horario {
        width: 0;
    }
</style>

<div class="sidebar">
    <a class="a-sidebar" href="#home"><span onclick="openNav()"><i class="fas fa-bars icon"></i></span></a>
    <a class="a-sidebar {{ request()->is('welcome') ? 'active' : '' }}" href="welcome"><i class="fas fa-receipt icon {{ request()->is('welcome') ? 'active' : '' }}"></i></a>
    <a class="a-sidebar {{ request()->is('ingredientes') ? 'active' : '' }}" href="{{route('ingredientes.index')}}"><i class="fas fa-carrot icon {{ request()->is('ingredientes') ? 'active' : '' }}"></i></a>
    <a class="a-sidebar {{ request()->is('refeicoes') ? 'active' : '' }}" href="{{route('refeicoes.index')}}"><i class="fas fa-book-open icon {{ request()->is('refeicoes') ? 'active' : '' }}"></i></a>
    <a class="a-sidebar" id="btn" href="#"><i class="fas fa-hand-paper icon"></i></a>
</div>

<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="#">
        <h3>Apolo Bytes</h3>
    </a>
    <hr class="text-center" style="width: 90%; margin-left: 5%;"><br>
    <a href="{{route('restaurantes.index')}}">O nosso restaurante</a>
    <a href="#">Definições</a>
    <a href="#">Ajuda</a>
    <a href="contacto">Contacte-nos</a>
</div>



<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "400px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }

    function horario() {
        document.getElementById("horario").style.width = "100%";
    }
</script>