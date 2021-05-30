<style>
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
<div class="dropdown" style="position: fixed; right: 1%;">
    <button class="btn dropdown-toggle text-white" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        {{ Auth::user()->name }}
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
        <li><a class="dropdown-item" style="color: #FFFFFF;" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">{{ route('logout') }}</a></li>
    </ul>
    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
        @csrf
    </form>
</div>
@endguest