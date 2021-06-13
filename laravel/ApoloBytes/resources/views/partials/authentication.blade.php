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

    li {
        list-style-type: none;
    }
</style>

<!-- Authentication Links -->

@guest
<li class="text-white" style="position: fixed; right: 1%;">
    <a class="" href="{{ route('login') }}">{{ __('Login') }}</a>
</li>
@if (Route::has('register'))
<li class="text-white" style="position: fixed; right: 1%;top: 3%">
    <a class="" href="{{ route('register') }}">{{ __('Register') }}</a>
</li>
@endif
@else
<li class="dropdown" style="position: fixed; right: 1%;">
    <a class="btn dropdown-toggle text-white" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        {{ Auth::user()->name }}
    </a>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
        <a class="dropdown-item" style="color: #FFFFFF;" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">{{ route('logout') }}</a>

        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
            @csrf
        </form>
    </div>
</li>
@endguest