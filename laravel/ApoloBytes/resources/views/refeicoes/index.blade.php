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
    </style>

<body>

    @include('partials.nav')

    <div id="main" class="content">

        @include('partials.authentication')

        <div class="container mt-2">

            <div class="row p-5">
                <div class="col-lg-12">
                    <div class="pull-left">
                        <h2>Refei????es</h2>
                    </div>
                    <div class="pull-right mb-2">
                        <a class="btn btn-success" href="{{ route('refeicoes.create') }}"> Adicionar Refei????o</a>
                    </div>
                </div>
            </div>

            @if ($message = Session::get('success'))
            <div class="alert alert-success">
                <p>{{ $message }}</p>
            </div>
            @endif

            <table class="table table-bordered text-white">
                <tr>
                    <th>Id</th>
                    <th>Imagem</th>
                    <th>Nome</th>
                    <th>Pre??o</th>
                    <th>Tempo de Confe????o</th>
                    <th>Descri????o</th>

                    <th width="280px">A????o</th>
                </tr>
                @foreach ($refeicoes as $refeicao)
                <tr>
                    <td>{{ $refeicao->id }}</td>
                    <td><img src="{{ Storage::url($refeicao->imagem) }}" height="75" width="75" alt="" /></td>
                    <td>{{ $refeicao->nome }}</td>
                    <td>{{ $refeicao->preco }} ???</td>
                    <td>{{ $refeicao->tempoConfecao }} min</td>
                    <td>{{ $refeicao->descricao }}</td>
                    <td>
                        <form action="{{ route('refeicoes.destroy',$refeicao->id) }}" method="POST">

                            <a class="btn btn-primary" href="{{ route('refeicoes.edit',$refeicao->id) }}">Editar</a>

                            @csrf
                            @method('POST')

                            <button type="submit" action="{{ route('refeicoes.destroy', $refeicao->id)}}" class="btn btn-danger">Eliminar</button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </table>

            {!! $refeicoes->links() !!}
        </div>
</body>



</html>