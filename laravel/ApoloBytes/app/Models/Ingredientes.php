<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ingredientes extends Model
{
    protected $fillable = [
        'nome', 'personalizavel', 'preco', 'estado', 'quantidade', 'estado'
    ];
}
