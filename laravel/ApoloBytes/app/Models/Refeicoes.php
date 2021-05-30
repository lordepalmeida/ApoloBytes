<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Refeicoes extends Model
{
    protected $fillable = [
        'nome', 'preco', 'tempoConfecao', 'descricao'
    ];
}
