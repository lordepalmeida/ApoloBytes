<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Adicionar Ingredientes</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<style>
    html,
    body {
        background-color: #141414;
        color: white;
        font-family: sans-serif;
        font-weight: 200;
    }

    .campos {
        background-color: #161616;
        color: white;
        border: none;
        border-bottom: solid 2px;
        border-radius: 0;
        border-color: #FA5B0C;
    }

    .escolha {
        color: #FFFFFF;
        border-color: #FA5B0C;
    }

    .escolha:hover {
        color: #FFFFFF;
        background-color: #FA5B0C;
        transition: 0.3s;
    }

    .escolhido {
        color: #FFFFFF;
        background-color: #FA5B0C;
    }
</style>

<body>

    <div class="container mt-2">
        <div class="row py-4" style="text-align-last: center;">
            <div class="col-3"><button class="btn escolhido" href="#">Ingredientes</button></div>
            <div class="col-3"><button class="btn escolha" href="{{ route('refeicoes.create') }}">Refeições</button></div>
            <div class="col-3"><button class="btn escolha">Bebidas</button></div>
            <div class="col-3"><button class="btn escolha">Complementos</button></div>
        </div>
        <div class="row py-4">
            <div class="col-lg-12 margin-tb">
                <div class="pull-left mb-2">
                    <h2>Adicionar Ingrediente</h2>
                </div>
                <div class="pull-right">
                    <a class="btn btn-primary" href="{{ route('ingredientes.index') }}" style="background-color: #FA5B0C; border: none;"> Voltar</a>
                </div>
            </div>
        </div>

        @if(session('status'))
        <div class="alert alert-success mb-1 mt-1">
            {{ session('status') }}
        </div>
        @endif

        <form action="{{ route('ingredientes.store') }}" method="PATCH" enctype="multipart/form-data">
            @csrf

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 py-1">
                    <div class="form-group">
                        <strong>Nome:</strong>
                        <input type="text" name="nome" class="form-control campos" placeholder="Nome do Ingrediente">
                        @error('nome')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-1">
                    <div class="form-group">
                        <strong>Personalizavel?</strong><br>
                        <label for="peronalizavel" class="radio-inline mr-3"><input type="radio" name="personalizavel" value="1">Sim</label>
                        <label for="peronalizavel" class="radio-inline"><input type="radio" name="personalizavel" value="0">Não</label>
                        @error('personalizavel')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-1">
                    <div class="form-group">
                        <strong>Preço:</strong>
                        <textarea class="form-control campos" style="height:150px" name="preco" placeholder="Preço do Ingrediente"></textarea>
                        @error('preco')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-1">
                    <div class="form-group">
                        <strong>Quantidade:</strong>
                        <textarea class="form-control campos" style="height:150px" name="quantidade" placeholder="Quantidade disponível"></textarea>
                        @error('quantidade')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <button type="submit" class="btn btn-primary ml-3" style="background-color: #FA5B0C; border: none;">Concluir</button>
            </div>

        </form>

</body>

</html>