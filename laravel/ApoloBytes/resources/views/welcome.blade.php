<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="">
    <title>Apolo Bytes</title>

    <!-- Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/apolobytes.css">


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

        .pedidos {
            margin-top: 4%;
            text-align: left;
            margin-left: 5%;
            font-size: 2rem;
            width: 90%;
        }

        .arrow {
            font-size: xxx-large;
            margin-left: 40%;
        }

        .detalhes {
            margin-top: 10px;
            padding-left: 0px;
            font-size: 1.5rem;
        }

        .progresso {
            margin-top: 4px;
            padding-left: 0px;
            font-size: 1.5rem;
        }

        .collapsible {
            background-color: #C00B05;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            height: 100px;
            border: none;
            text-align: left;
            outline: none;
            font-size: 2rem;
        }

        .contentcol {
            margin-left: 10%;
            margin-top: 5px;
            width: 90%;
            padding: 0 18px;
            display: none;
            overflow: hidden;
            background-color: #6D6B6A;
        }

        .a-decisao-aceitar {
            background-color: #FFF4F0;
            color: black;
            border: none;
            width: 100%;
            height: 50%;
            border-radius: 40px;
            margin-top: 25px;
            font-size: 1.5rem;
            text-decoration: none;
            padding-top: 6%;
            padding-bottom: 6%;
            padding-left: 24%;
            padding-right: 24%;
        }

        .a-decisao-aceitar:hover {
            background-color: #0D7D04;
            border: none;
            width: 85%;
            height: 50%;
            border-radius: 40px;
            margin-top: 25px;
            font-size: 1.5rem;
            color: white;
            transition: 0.3s;
        }

        .a-decisao-recusar {
            background-color: #6D6B6A;
            color: white;
            border: none;
            width: 90%;
            height: 50%;
            border-radius: 40px;
            margin-top: 25px;
            font-size: 1.5rem;
            text-decoration: none;
            padding-top: 6%;
            padding-bottom: 6%;
            padding-left: 24%;
            padding-right: 24%;
        }

        .a-decisao-recusar:hover {
            background-color: #C00B05;
            color: white;
            border: none;
            width: 90%;
            height: 50%;
            border-radius: 40px;
            margin-top: 25px;
            font-size: 1.5rem;
            transition: 0.3s;
        }

        .a-pronto {
            background-color: #FFF4F0;
            color: black;
            border: none;
            width: 100%;
            height: 50%;
            border-radius: 40px;
            margin-top: 25px;
            font-size: 1.5rem;
            text-decoration: none;
            padding-top: 6%;
            padding-bottom: 6%;
            padding-left: 24%;
            padding-right: 24%;
        }

        .a-pronto:hover {
            background-color: #FA5B0C;
            border: none;
            width: 85%;
            height: 50%;
            border-radius: 40px;
            margin-top: 25px;
            font-size: 1.5rem;
            color: white;
            transition: 0.3s;
        }
    </style>
</head>

<body>


    @include('partials.nav')


    <div id="main" class="content">

        @include('partials.authentication')

        <div class="container pedidos">
            <div class="row">
                <div class="col">
                    Novos Pedidos (1)
                </div>
            </div>
            <div class="row mb-5">
                <button type="button" style="background-color: #FA5B0C;" class="collapsible p-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                <i class="fas fa-chevron-right arrow"></i>
                            </div>
                            <div class="col-md-7 col-lg-7 col-sm-7 detalhes">
                                <div class="container ml-0 pl-0">
                                    <div class="row">
                                        <div class="col">
                                            Nome do Utilizador
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            A000
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 col-lg-2 col-sm-2" style="padding-top: 1%;">
                                <a class="a-decisao-aceitar" href="#">Aceitar</a>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2" style="padding-top: 1%;">
                                <a class="a-decisao-recusar" href="#">Recusar</a>
                            </div>
                        </div>
                    </div>
                </button>
                <div class="contentcol">
                    <div class="container p-3">
                        <div class="row" style="margin-left: 2%;">
                            <div class="col-5">Menu xxxxxx</div>
                            <div class="col-7">Morada</div>
                        </div>
                        <div class="row" style="margin-left: 5%">
                            <div class="col-5 fs-5">- Informação 1</div>
                            <div class="col-7 fs-5">Rua Indicada</div>
                        </div>
                        <div class="row" style="margin-left: 5%;">
                            <div class="col-5 fs-5">- Informação 2</div>
                            <div class="col-7 fs-5">Concelho e Distrito Indicados</div>
                        </div>
                        <div class="row" style="margin-left: 5%;">
                            <div class="col-5 fs-5">- Informação 3</div>
                            <div class="col-7 fs-5">Número de Porta e Andar Indicados</div>
                        </div>
                        <div class="row fs-6" style="float: right">
                            Pedido efetuado às ##:##
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5 pt-5">
                <div class="col">
                    Em progresso (1)
                </div>
            </div>
            <div class="row">
                <button type="button" class="collapsible p-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                <i class="fas fa-chevron-right arrow"></i>
                            </div>
                            <div class="col-md-8col-lg-8 col-sm-8 progresso">
                                <div class="container ml-0 pl-0">
                                    <div class="row">
                                        <div class="col">
                                            Nome do Utilizador
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            A000
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </button>
                <div class="contentcol">
                    <div class="container p-3">
                        <div class="row" style="margin-left: 2%;">
                            <div class="col-5">Menu xxxxxx</div>
                            <div class="col-7">Morada</div>
                        </div>
                        <div class="row" style="margin-left: 5%">
                            <div class="col-5 fs-5">- Informação 1</div>
                            <div class="col-7 fs-5">Rua Indicada</div>
                        </div>
                        <div class="row" style="margin-left: 5%;">
                            <div class="col-5 fs-5">- Informação 2</div>
                            <div class="col-7 fs-5">Concelho e Distrito Indicados</div>
                        </div>
                        <div class="row" style="margin-left: 5%;">
                            <div class="col-5 fs-5">- Informação 3</div>
                            <div class="col-7 fs-5">Número de Porta e Andar Indicados</div>
                        </div>
                        <div class="row fs-6" style="float: right">
                            Pedido efetuado às ##:##
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5 pt-5">
                <div class="col">
                    Pronto (1)
                </div>
            </div>
            <div class="row">
                <button type="button" class="collapsible p-0" style="background-color: #7FBF80;">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                <i class="fas fa-chevron-right arrow"></i>
                            </div>
                            <div class="col-md-8 col-lg-8 col-sm-8 progresso">
                                <div class="container ml-0 pl-0">
                                    <div class="row">
                                        <div class="col">
                                            Nome do Utilizador
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            A000
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3 col-sm-3" style="padding-top: 1%;">
                                <a class="a-pronto" href="#">Confirmar</a>
                            </div>
                        </div>
                    </div>
                </button>
                <div class="contentcol">
                    <div class="container p-3">
                        <div class="row" style="margin-left: 2%;">
                            <div class="col-5">Menu xxxxxx</div>
                            <div class="col-7">Morada</div>
                        </div>
                        <div class="row" style="margin-left: 5%">
                            <div class="col-5 fs-5">- Informação 1</div>
                            <div class="col-7 fs-5">Rua Indicada</div>
                        </div>
                        <div class="row" style="margin-left: 5%;">
                            <div class="col-5 fs-5">- Informação 2</div>
                            <div class="col-7 fs-5">Concelho e Distrito Indicados</div>
                        </div>
                        <div class="row" style="margin-left: 5%;">
                            <div class="col-5 fs-5">- Informação 3</div>
                            <div class="col-7 fs-5">Número de Porta e Andar Indicados</div>
                        </div>
                        <div class="row fs-6" style="float: right">
                            Pedido efetuado às ##:##
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    var coll = document.getElementsByClassName("collapsible");
    var i;

    for (i = 0; i < coll.length; i++) {
        coll[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var contentcol = this.nextElementSibling;
            if (contentcol.style.display === "block") {
                contentcol.style.display = "none";
            } else {
                contentcol.style.display = "block";
            }
        });
    }
</script>

</html>