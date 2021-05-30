<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Restaurantes;
use Illuminate\Http\Request;
use Illuminate\Validation\Validator;

class RestaurantesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $restaurantes = Restaurantes::orderBy('id', 'desc')->paginate(10);
        return view('restaurantes.index', compact('restaurantes', $restaurantes))
            ->with('i', (request()->input('page', 1) - 1) * 10);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('restaurantes.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $restaurante = new Restaurantes;
        $request->validate([
            'nome' => 'required',
            'localizacao' => 'required',
            'horario' => 'required',
            'sumario' => 'required',
            'tempoEntrega' => 'required',
            'contacto' => 'required',
        ]);


        $restaurante->nome = $request->nome;
        $restaurante->localizacao = $request->localizacao;
        $restaurante->horario = $request->horario;
        $restaurante->sumario = $request->sumario;
        $restaurante->tempoEntrega = $request->tempoEntrega;
        $restaurante->contacto = $request->contacto;

        $restaurante->save();


        return redirect()->route('restaurantes.index')
            ->with('success', 'Restaurantes adicionado com sucesso.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\refeicoes  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Restaurantes $restaurante)
    {
        return view('restaurantes.show', compact('restaurante', $restaurante));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\refeicoes  $post
     * @return \Illuminate\Http\Response
     */
    public function edit($restaurante)
    {
        $restaurante = Restaurantes::find($restaurante);
        return view('restaurantes.edit', compact('restaurante'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\restaurante  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'nome' => 'required',
            'localizacao' => 'required',
            'horario' => 'required',
            'sumario' => 'required',
            'tempoEntrega' => 'required',
            'contacto' => 'required',
        ]);

        $restaurante = Restaurantes::find($id);
        $restaurante->update($validatedData);

        return redirect()->route('restaurantes.index')
            ->with('success', 'Restaurante atualizado com sucesso.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Refeicoes  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $restaurante = Restaurantes::find($id);
        $restaurante->delete();

        return redirect()->route('restaurantes.index')
            ->with('success', 'Restaurante eliminado com sucesso.');
    }
}
