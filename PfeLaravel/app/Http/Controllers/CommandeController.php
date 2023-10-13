<?php

namespace App\Http\Controllers;

use App\Models\Commande;
use Illuminate\Http\Request;

class CommandeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        //
        $request->validate([
            'QuantiteCM' => 'required',
            'DateCommande' => 'required|date|after:today',
            'Total' => 'required',
            'CodeCl' => 'required',
            'CodeA' => 'required',
            'CodeC' => 'required',
        ]);

        $commandeAjout = new Commande;
        $commandeAjout->QuantiteCM = $request->QuantiteCM;
        $commandeAjout->DateCommande = $request->DateCommande;
        $commandeAjout->Total = $request->Total;
        $commandeAjout->CodeCl = $request->CodeCl;
        $commandeAjout->CodeA = $request->CodeA;
        $commandeAjout->CodeC = $request->CodeC;
        $commandeAjout->save();

        return response()->json([
            'message' => 'Commande ajouté avec succès',
            'commandeAjout' => $commandeAjout,
        ], 201);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
