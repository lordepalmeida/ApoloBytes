<?php

namespace App\Http\Controllers;

use App\Models\Refeicoes;
use Illuminate\Http\Request;
use Illuminate\Validation\Validator;

class RefeicoesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $refeicoes = Refeicoes::orderBy('id', 'desc')->paginate(10);
        return view('refeicoes.index', compact('refeicoes', $refeicoes))
            ->with('i', (request()->input('page', 1) - 1) * 10);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('refeicoes.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $refeicao = new Refeicoes;
        if ($request->hasFile('imagem')) {
            $request->validate([
                'imagem' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
                'nome' => 'required',
                'preco' => 'required',
                'tempoConfecao' => 'required',
                'descricao' => 'required',
            ]);
            $path = $request->file('imagem')->store('public/images');
            $refeicao->imagem = $path;
        }

        $refeicao->nome = $request->nome;
        $refeicao->preco = $request->preco;
        $refeicao->tempoConfecao = $request->tempoConfecao;
        $refeicao->descricao = $request->descricao;

        $refeicao->save();


        return redirect()->route('refeicoes.index')
            ->with('success', 'Refeição adicionada com sucesso.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\refeicoes  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Refeicoes $refeicao)
    {
        return view('refeicoes.show', compact('refeicao', $refeicao));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\refeicoes  $post
     * @return \Illuminate\Http\Response
     */
    public function edit($refeicao)
    {
        $refeicao = Refeicoes::find($refeicao);
        return view('refeicoes.edit', compact('refeicao'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\refeicoes  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'nome' => 'required',
            'preco' => 'required',
            'tempoConfecao' => 'required',
            'descricao' => 'required',
        ]);

        $refeicao = Refeicoes::find($id);

        if ($request->hasFile('imagem')) {
            $request->validate([
                'imagem' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
            ]);
            $path = $request->file('imagem')->store('public/images');
            $refeicao->imagem = $path;
        }
        $refeicao->update($validatedData);

        return redirect()->route('refeicoes.index')
            ->with('success', 'Refeição atualizada com sucesso.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Refeicoes  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $refeicao = Refeicoes::find($id);
        $refeicao->delete();

        return redirect()->route('refeicoes.index')
            ->with('success', 'Refeição eliminada com sucesso.');
    }
}
