@extends('layouts.app')
@section('content')
<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="http://code.jquery.com/jquery.js"></script>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;600&display=swap" rel="stylesheet">

</head>

<body style="background-color: #141414;">


    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9">
                <div class="text-center" style="border: none; color: #FFFFFF">
                    <div class="py-4" style="font-size: 2rem">{{ __('Bem Vindo!') }}</div>

                    <div class="">
                        <form method="POST" action="{{ route('login') }}">
                            @csrf

                            <div class="form-group row">
                                <label for="email" class="col-md-4 col-form-label text-md-left" style="font-size: 1.3rem">{{ __('E-Mail') }}</label>

                                <div class="form-group row">
                                    <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" style="background-color: #141414; border-top: none; border-left: none; border-right: none; border-radius: 0;" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                    @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-left" style="font-size: 1.3rem">{{ __('Senha de Acesso') }}</label>

                                <div class="form-group row">
                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" style="background-color: #141414; border-top: none; border-left: none; border-right: none; border-radius: 0;" name="password" required autocomplete="current-password">

                                    @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-6 offset-md-4" style="padding-left: 1%; margin-left: 0%">
                                    <div class="form-check" style="text-align-last: left;">
                                        <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                        <label class="form-check-label text-md-left" for="remember">
                                            {{ __('Lembrar nome de Utilizador') }}
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row mb-0">
                                <div class="form-group row">
                                    @if (Route::has('password.request'))
                                    <a class="form-group row btn pl-3 ml-1" style="color: grey;place-content: center;" href="{{ route('password.request') }}">
                                        {{ __('Esqueceu-se da Senha de Acesso?') }}
                                    </a>
                                </div>
                                <div class="form-group row" style="place-content: center;">
                                    <button type="submit" class="btn" style="width: 30%; color: white; background-color: #FA5B0C">
                                        {{ __('Entrar') }}
                                    </button>
                                    @endif
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
@endsection