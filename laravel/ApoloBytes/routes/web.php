<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RefeicoesController;
use App\Http\Controllers\RestaurantesController;
use App\Http\Controllers\IngredientesController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/welcome', function () {
    return view('welcome');
});

Route::get('/inventario', function () {
    return view('inventario');
});

Route::get('/nav', function () {
    return view('nav');
});

Route::get('/horario', function () {
    return view('horario');
});

Route::get('/contacto', function () {
    return view('contacto');
});



Route::get('firebase', 'FirebaseController@index');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

route::get('/search', 'IngredientesController@search')->name('search');


//Route::resource('/refeicoes', RefeicoesController::class);
Route::post('/refeicoes', [RefeicoesController::class, 'store'])->name('refeicoes.store');
Route::get('/refeicoes/create', [RefeicoesController::class, 'create'])->name('refeicoes.create');
Route::get('/refeicoes', [RefeicoesController::class, 'index'])->name('refeicoes.index');
Route::get('/refeicoes/{id}/edit', [RefeicoesController::class, 'edit'])->name('refeicoes.edit');
Route::patch('/refeicoes/{id}', [RefeicoesController::class, 'update'])->name('refeicoes.update');
Route::post('/refeicoes/{id}', [RefeicoesController::class, 'destroy'])->name('refeicoes.destroy');


//Route::resource('restaurantes', RestaurantesController::class);
Route::post('/restaurantes', [RestaurantesController::class, 'store'])->name('restaurantes.store');
Route::get('/restaurantes/create', [RestaurantesController::class, 'create'])->name('restaurantes.create');
Route::get('/restaurantes', [RestaurantesController::class, 'index'])->name('restaurantes.index');
Route::get('/restaurantes/{id}/edit', [RestaurantesController::class, 'edit'])->name('restaurantes.edit');
Route::patch('/restaurantes/{id}', [RestaurantesController::class, 'update'])->name('restaurantes.update');
Route::post('/restaurantes/{id}', [RestaurantesController::class, 'destroy'])->name('restaurantes.destroy');



//Route::resource('ingredientes', IngredientesController::class);
Route::post('/ingredientes', [IngredientesController::class, 'store'])->name('ingredientes.store');
Route::get('/ingredientes/create', [IngredientesController::class, 'create'])->name('ingredientes.create');
Route::get('/ingredientes', [IngredientesController::class, 'index'])->name('ingredientes.index');
Route::get('/ingredientes/{id}/edit', [IngredientesController::class, 'edit'])->name('ingredientes.edit');
Route::patch('/ingredientes/{id}', [IngredientesController::class, 'update'])->name('ingredientes.update');
Route::post('/ingredientes/{id}', [IngredientesController::class, 'destroy'])->name('ingredientes.destroy');


//Route::get('/ingredientes', [IngredientesController::class, 'view'])->name('ingredientes.index');
