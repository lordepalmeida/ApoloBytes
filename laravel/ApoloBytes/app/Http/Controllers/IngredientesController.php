<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Ingredientes;
use App\Models\Refeicoes;
use Illuminate\Http\Request;

class IngredientesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ingredientes = Ingredientes::orderBy('id', 'desc')->paginate(10);
        return view('ingredientes.index', compact('ingredientes', $ingredientes))
            ->with('i', (request()->input('page', 1) - 1) * 10);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function create()
    {
        return view('ingredientes.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $ingrediente = new Ingredientes;
        $request->validate([
            'nome' => 'required',
            'personalizavel' => 'required',
            'preco' => 'required',
            'quanitdade' => 'required',
            'estado' => 'required',
        ]);


        $ingrediente->nome = $request->nome;
        $ingrediente->personalizavel = $request->personalizavel;
        $ingrediente->preco = $request->preco;
        $ingrediente->quanitdade = $request->quanitdade;
        $ingrediente->estado = $request->estado;


        $ingrediente->save();


        return redirect()->route('ingredientes.index')
            ->with('success', 'Ingrediente adicionado com sucesso.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Ingredientes $ingrediente)
    {
        return view('ingrediente.show', compact('ingrediente', $ingrediente));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($ingrediente)
    {
        $ingrediente = Ingredientes::find($ingrediente);
        return view('ingredientes.edit', compact('ingrediente'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'nome' => 'required',
            'personalizavel' => 'required',
            'preco' => 'required',
            'quantidade' => 'required',
            'estado' => 'required',

        ]);

        $ingrediente = Ingredientes::find($id);
        $ingrediente->update($validatedData);

        return redirect()->route('ingredientes.index')
            ->with('success', 'Ingrediente atualizado com sucesso.');
    }

    public function search(Request $request)
    {
        $query = $request->input('query');
        $ingrediente = Ingredientes::where('nome', "%&query%")->get;
        return view('resultados')->with('ingrediente', $ingrediente);
    }

    public function view($id)
    {
        $refeicao = Refeicoes::where('id), $id')->first();
        $ingrediente = Ingredientes::where('$id', $id)->get();
        return view('ingredientes.index')->with(compact('refeicao', 'ingrediente'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $ingrediente = Ingredientes::find($id);
        $ingrediente->delete();

        return redirect()->route('ingredientes.index')
            ->with('success', 'Ingrediente eliminado com sucesso.');
    }
}
