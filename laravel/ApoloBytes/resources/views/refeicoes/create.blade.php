<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Adicionar Refeição</title>

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
</style>

<body>

    <div class="container mt-2">

        <div class="row py-4">
            <div class="col-lg-12 margin-tb">
                <div class="pull-left mb-2">
                    <h2>Adicione Refeição</h2>
                </div>
                <div class="pull-right">
                    <a class="btn btn-primary" href="{{ route('refeicoes.index') }}" style="background-color: #FA5B0C; border: none;"> Voltar</a>
                </div>
            </div>
        </div>

        @if(session('status'))
        <div class="alert alert-success mb-1 mt-1">
            {{ session('status') }}
        </div>
        @endif

        <form action="{{ route('refeicoes.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 py-1">
                    <div class="form-group">
                        <strong>Nome:</strong>
                        <input type="text" name="nome" class="form-control campos" placeholder="Nome da Refeção">
                        @error('nome')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-1">
                    <div class="form-group">
                        <strong>Descrição:</strong>
                        <textarea class="form-control campos" style="height:150px" name="descricao" placeholder="Descrição da Refeição"></textarea>
                        @error('descricao')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-1">
                    <div class="form-group">
                        <strong>Preço:</strong>
                        <textarea class="form-control campos" style="height:150px" name="preco" placeholder="Preço da Refeição"></textarea>
                        @error('preco')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-1">
                    <div class="form-group">
                        <strong>Tempo de Confeção:</strong>
                        <textarea class="form-control campos" style="height:150px" name="tempoConfecao" placeholder="Tempo de Confeção da Refeição"></textarea>
                        @error('tempoConfecao')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-1">
                    <div class="form-group">
                        <strong>Imagem:</strong>
                        <input type="file" name="imagem" class="form-control campos" placeholder="Refeicoes Nome">
                        @error('imagem')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <button type="submit" class="btn btn-primary ml-3" style="background-color: #FA5B0C; border: none;">Concluir</button>
            </div>

        </form>

</body>

</html>