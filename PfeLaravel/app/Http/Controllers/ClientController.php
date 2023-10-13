<?php

namespace App\Http\Controllers;

use App\Models\Client;
use Illuminate\Http\Request;

class ClientController extends Controller
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
            'CodeC' => 'required',
            'NomCl' => 'required',
            'PrenomCl' => 'required',
            'TelCl' => 'required',
            'AdressePostal' => 'required',
            'AdresseLivraison' => 'required',
            'NbrCommandeHistorique' => 'required',
            'QteCommandee' => 'required',
            'Paiement' => 'required',
        ]);

        $clientAjout = new Client;
        $clientAjout->CodeC = $request->CodeC;
        $clientAjout->NomCl = $request->NomCl;
        $clientAjout->PrenomCl = $request->PrenomCl;
        $clientAjout->TelCl = $request->TelCl;
        $clientAjout->AdressePostal = $request->AdressePostal;
        $clientAjout->AdresseLivraison = $request->AdresseLivraison;
        $clientAjout->NbrCommandeHistorique = $request->NbrCommandeHistorique;
        $clientAjout->QteCommandee = $request->QteCommandee;
        $clientAjout->Paiement = $request->Paiement;
        $clientAjout->save();

        return response()->json([
            'message' => 'Client ajouté avec succès',
            'clientAjout' => $clientAjout,
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
