<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Restaurantes extends Model
{
    protected $fillable = [
        'nome', 'localizacao', 'horarios', 'imagem', 'sumario', 'tempoEntrega', 'contacto'
    ];
}
