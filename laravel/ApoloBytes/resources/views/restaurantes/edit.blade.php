<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Editar Refeição</title>

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

        <div class="row py-3">
            <div class="col-lg-12 margin-tb">
                <div class="pull-left">
                    <h2>Editar Detalhes</h2>
                </div>
                <div class="pull-right">
                    <a class="btn btn-primary" href="{{ route('restaurantes.index') }}" style="background-color: #FA5B0C; border: none;" enctype="multipart/form-data"> Voltar</a>
                </div>
            </div>
        </div>

        @if(session('status'))
        <div class="alert alert-success mb-1 mt-1">
            {{ session('status') }}
        </div>
        @endif

        <form action="{{ route('restaurantes.update',$restaurante->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PATCH')

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 py-3">
                    <div class="form-group">
                        <strong>Nome:</strong>
                        <input type="text" name="nome" value="{{ $restaurante->nome }}" class="form-control campos" placeholder="Nome do Restaurante">
                        @error('nome')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-3">
                    <div class="form-group">
                        <strong>Localização:</strong>
                        <textarea class="form-control campos" style="height:150px" name="localizacao" placeholder="Localização do Restaurante">{{ $restaurante->localizacao }}</textarea>
                        @error('localizacao')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-3">
                    <div class="form-group">
                        <strong>Descrição:</strong>
                        <textarea class="form-control campos" style="height:150px" name="sumario" placeholder="Descrição do Restaurante">{{ $restaurante->sumario }}</textarea>
                        @error('sumario')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-3">
                    <div class="form-group">
                        <strong>Horário de Funcionamento:</strong>
                        <input class="form-control campos" style="height:150px" name="horario" value="{{ $restaurante->horario }}" placeholder="Horário de Funcionamento">
                        @error('horario')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-3">
                    <div class="form-group">
                        <strong>Tempo de Entrega:</strong>
                        <input class="form-control campos" style="height:150px" name="tempoEntrega" value="{{ $restaurante->tempoEntrega }}" placeholder="Tempo de Médio de Entrega do Restaurante">
                        @error('tempoEntrega')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 py-3">
                    <div class="form-group">
                        <strong>Contacto:</strong>
                        <input type="text" name="contacto" value="{{ $restaurante->contacto }}" class="form-control campos" placeholder="Contacto do Restaurante">
                        @error('contacto')
                        <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                        @enderror
                    </div>

                </div>

                <button type="submit" class="btn btn-primary ml-3" style="background-color: #FA5B0C; color:white; border: none;">Guardar</button>

            </div>

        </form>
    </div>

</body>

</html>