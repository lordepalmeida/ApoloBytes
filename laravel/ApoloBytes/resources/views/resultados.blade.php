<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="../images/logo" />
    <title>Apolo Bytes</title>

    <!-- Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="http://code.jquery.com/jquery.js"></script>
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
            width: 100%;
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

        .categoria {
            margin-top: 4px;
            padding-left: 0px;
            font-size: 1.5rem;
        }

        .collapsible {
            background-color: #626567;
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
        }

        .collapsible2 {
            background-color: #424949;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            height: 100px;
            border: none;
            text-align: left;
            outline: none;
            font-size: 2rem;
            margin-left: 5%;
        }

        .contentcol2 {
            margin-left: 12%;
            margin-top: 5px;
            width: 90%;
            display: none;
            overflow: hidden;
            background-color: #909497;
            text-align: left;
        }

        .item-categoria {
            font-size: 2.8rem;
        }

        .item {
            font-size: 2.5rem;
            margin-top: 1%;
        }

        li {
            list-style-type: none;
        }

        .arrow-item {
            font-size: 3rem;
            margin-left: 30%;
        }

        .btn-disponivel {
            background-color: #6D6B6A;
            border: none;
            width: 100%;
            height: 90%;
            border-radius: 40px;
            margin-top: 5px;
            font-size: 1.1rem;
            color: black;
        }

        .btn-disponivel:hover {
            background-color: #0D7D04;
            color: white;
            transition: 0.3s;
        }

        .btn-disponivel:focus {
            background-color: #0D7D04;
            color: white;
            transition: 0.3s;
        }

        .btn-esgotado {
            background-color: #6D6B6A;
            border: none;
            width: 100%;
            height: 90%;
            border-radius: 40px;
            margin-top: 5px;
            font-size: 1.1rem;
            color: black;
        }

        .btn-esgotado:hover {
            background-color: #C00B05;
            color: white;
            transition: 0.3s;
        }

        .btn-esgotado:focus {
            background-color: #C00B05;
            color: white;
            transition: 0.3s;
        }

        .collapsible3 {
            background-color: #424949;
            color: white;
            cursor: pointer;
            padding: 25px;
            width: 100%;
            height: 100px;
            border: none;
            text-align: left;
            outline: none;
            font-size: 2rem;
            margin-left: 5%;
        }

        #procura {
            background-color: #626567;
            border-radius: 20px;
            margin-top: 4%;
            margin-bottom: 3%;
            border: none;
            height: 50px;
            color: white;
            font-size: 1.5rem;
        }

        button i {
            transform: rotate(0deg);
            transition: transform 0.3s;
        }

        button.active i {
            transform: rotate(90deg);
            transition: 0.3s;
        }
    </style>
</head>

<body>


    @include('partials.nav')

    <div id="main" class="content">

        @include('partials.authentication')

        <div class="container">
            <div class="row">
                <div class="col-10">
                    @include('partials.search')
                </div>
                <div class="col-1">
                    <a class="btn fs-2 mt-4" href="{{ route('ingredientes.create') }}"><i class="fas fa-plus text-white"></i></a>
                </div>
            </div>
            <div class="row">
                @if ($message = Session::get('success'))
                <div class="alert alert-success">
                    <p>{{ $message }}</p>
                </div>
                @endif
            </div>
            <div class="row">
                <button onclick="toggleActive(this);" type="button" class="collapsible p-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                <i class="fas fa-chevron-right arrow"></i>
                            </div>
                            <div class="col-md-8col-lg-8 col-sm-8 categoria">
                                <div class="col item-categoria">
                                    Refeições
                                </div>
                            </div>
                        </div>
                </button>
                <div class="contentcol mt-3">
                    <button type="button" class="collapsible2 p-0">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                    <i class="fas fa-chevron-right arrow"></i>
                                </div>
                                <div class="col-md-7col-lg-7 col-sm-7 categoria">
                                    <div class="col item">
                                        <li>Refeição 1</li>
                                    </div>
                                </div>
                            </div>
                    </button>
                    @foreach ($ingredientes as $ingrediente)
                    <div class="contentcol2 mb-3">
                        <div class="container p-3">
                            <div class="row">
                                <div class="col-7 fs-4">
                                    <li>{{ $ingrediente->nome}}</li>
                                </div>
                                <div class="col-2"><button class="btn-disponivel">Disponível</button></div>
                                <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                            </div>
                            <hr>
                        </div>
                    </div>
                    @csrf
                    @method('POST')

                    @endforeach
                    <button type="button" class="collapsible2 p-0 mt-2">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                    <i class="fas fa-chevron-right arrow"></i>
                                </div>
                                <div class="col-md-8col-lg-8 col-sm-8 categoria">
                                    <div class="col item">
                                        <li>Refeição 2</li>
                                    </div>
                                </div>
                            </div>
                    </button>
                    <div class="contentcol2">
                        <div class="container p-3">
                            <div class="row">
                                <div class="col-7 fs-4">
                                    <li>Ingrediente 1</li>
                                </div>
                                <div class="col-2"><button class="btn-disponivel">Disponível</button></div>
                                <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-7 fs-4">
                                    <li>Ingrediente 2</li>
                                </div>
                                <div class="col-2"><button class="btn-disponivel">Disponível</button></div>
                                <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-7 fs-4">
                                    <li>Ingrediente 3</li>
                                </div>
                                <div class="col-2"><button class="btn-disponivel">Disponível</button></div>
                                <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-7 fs-4">
                                    <li>Ingrediente 4</li>
                                </div>
                                <div class="col-2"><button class="btn-disponivel">Disponível</button></div>
                                <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="collapsible2 p-0 mt-2">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                    <i class="fas fa-chevron-right arrow"></i>
                                </div>
                                <div class="col-md-8col-lg-8 col-sm-8 categoria">
                                    <div class="col item">
                                        <li>Refeição 3</li>
                                    </div>
                                </div>
                            </div>
                    </button>
                    <div class="contentcol2">
                        <div class="container p-3">
                            <div class="row">
                                <div class="col-7 fs-4">
                                    <li>Ingrediente 1</li>
                                </div>
                                <div class="col-2"><button class="btn-disponivel">Disponível</button></div>
                                <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-7 fs-4">
                                    <li>Ingrediente 2</li>
                                </div>
                                <div class="col-2"><button class="btn-disponivel">Disponível</button></div>
                                <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-7 fs-4">
                                    <li>Ingrediente 3</li>
                                </div>
                                <div class="col-2"><button class="btn-disponivel">Disponível</button></div>
                                <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-7 fs-4">
                                    <li>Ingrediente 4</li>
                                </div>
                                <div class="col-2"><button class="btn-disponivel">Disponível</button></div>
                                <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <button type="button" class="collapsible p-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                <i class="fas fa-chevron-right arrow"></i>
                            </div>
                            <div class="col-md-8col-lg-8 col-sm-8 categoria">
                                <div class="col item-categoria">
                                    <li>Ingredientes</li>
                                </div>
                            </div>
                        </div>
                    </div>
                </button>
                <div class="contentcol mt-3">
                    <div class="container p-0">
                        <div class="row collapsible3">
                            <div class="col-7 fs-2">
                                <li>Ingrediente 1</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                        <div class="row collapsible3 mt-1">
                            <div class="col-7 fs-2">
                                <li>Ingrediente 2</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                        <div class="row collapsible3 mt-1">
                            <div class="col-7 fs-2">
                                <li>Ingrediente 3</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                        <div class="row collapsible3 mt-1">
                            <div class="col-7 fs-2">
                                <li>Ingrediente 4</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <button type="button" class="collapsible p-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                <i class="fas fa-chevron-right arrow"></i>
                            </div>
                            <div class="col-md-8col-lg-8 col-sm-8 categoria">
                                <div class="col item-categoria">
                                    <li>Bebidas</li>
                                </div>
                            </div>
                        </div>
                    </div>
                </button>
                <div class="contentcol mt-3">
                    <div class="container p-0">
                        <div class="row collapsible3">
                            <div class="col-7 fs-2">
                                <li>Bebida 1</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                        <div class="row collapsible3 mt-1">
                            <div class="col-7 fs-2">
                                <li>Bebida 2</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                        <div class="row collapsible3 mt-1">
                            <div class="col-7 fs-2">
                                <li>Bebida 3</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                        <div class="row collapsible3 mt-1">
                            <div class="col-7 fs-2">
                                <li>Bebida 4</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <button type="button" class="collapsible p-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1 col-lg-1 col-sm-1 mt-3">
                                <i class="fas fa-chevron-right arrow"></i>
                            </div>
                            <div class="col-md-8col-lg-8 col-sm-8 categoria">
                                <div class="col item-categoria">
                                    <li>Complementos</li>
                                </div>
                            </div>
                        </div>
                    </div>
                </button>
                <div class="contentcol mt-3">
                    <div class="container p-0">
                        <div class="row collapsible3">
                            <div class="col-7 fs-2">
                                <li>Complemento 1</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                        <div class="row collapsible3 mt-1">
                            <div class="col-7 fs-2">
                                <li>Complemento 2</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                        <div class="row collapsible3 mt-1">
                            <div class="col-7 fs-2">
                                <li>Complemento 3</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                        <div class="row collapsible3 mt-1">
                            <div class="col-7 fs-2">
                                <li>Complemento 4</li>
                            </div>
                            <div class="col-2 fs-2"><button class="btn-disponivel">Disponível</button></div>
                            <div class="col-2"><button class="btn-esgotado">Esgotado</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {!! $ingredientes->links() !!}
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

    var coll = document.getElementsByClassName("collapsible2");
    var i;

    for (i = 0; i < coll.length; i++) {
        coll[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var contentcol2 = this.nextElementSibling;
            if (contentcol2.style.display === "block") {
                contentcol2.style.display = "none";
            } else {
                contentcol2.style.display = "block";
            }
        });
    }


    function toggleActive(el) {
        el.classList.toggle('active');
    }


    $(".btn-disponivel").click(function() {
        $(".btn-disponivel").addClass('btn-disponivel-click');
    });

    $(".btn-disponivel").click(function() {
        $(".btn-disponivel").removeClass('btn-disponivel-click');
    });
</script>

</html>