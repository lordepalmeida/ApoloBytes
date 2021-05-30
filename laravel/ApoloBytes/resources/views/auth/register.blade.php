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
                    <div class="py-4" style="font-size: 2rem">{{ __('Preencha os seguintes dados') }}</div>

                    <div class="">
                        <form method="POST" action="{{ route('register') }}">
                            @csrf

                            <div class="form-group row my-2">
                                <label for="name" class="col-md-4 col-form-label text-md-left" style="font-size: 1.3rem">{{ __('Nome do Establecimento') }}</label>

                                <div class="form-group row">
                                    <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" style="background-color: #141414; color: white; border-top: none; border-left: none; border-right: none; border-radius: 0;" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                    @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group row my-2">
                                <label for="email" class="col-md-4 col-form-label text-md-left" style="font-size: 1.3rem">{{ __('Endereço de E-Mail') }}</label>

                                <div class="form-group row">
                                    <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" style="background-color: #141414; color: white; border-top: none; border-left: none; border-right: none; border-radius: 0;" name="email" value="{{ old('email') }}" required autocomplete="email">

                                    @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group row my-2">
                                <label for="password" class="col-md-4 col-form-label text-md-left" style="font-size: 1.3rem">{{ __('Senha de Acesso') }}</label>

                                <div class="form-group row">
                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" style="background-color: #141414; color: white; border-top: none; border-left: none; border-right: none; border-radius: 0;" name="password" required autocomplete="new-password">

                                    @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group row my-2">
                                <label for="password-confirm" class="col-md-4 col-form-label text-md-left" style="font-size: 1.3rem">{{ __('Confirme a Senha de Acesso') }}</label>

                                <div class="form-group row">
                                    <input id="password-confirm" type="password" class="form-control" style="background-color: #141414; color: white; border-top: none; border-left: none; border-right: none; border-radius: 0;" name="password_confirmation" required autocomplete="new-password">
                                </div>
                            </div>

                            <div class="form-group row my-4" style="place-content: center;">
                                <button type="submit" class="btn w-25" style="color: white; background-color: #FA5B0C">
                                    {{ __('Submeter dados') }}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection