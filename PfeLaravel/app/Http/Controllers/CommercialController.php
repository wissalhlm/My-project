<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\Commande;
use App\Models\Commercial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class CommercialController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function registrerC(Request $request)
    {
        $request->validate([
            'NomC' => 'required',
            'PrenomC' => 'required',
            'EmailC' => 'required|email',
            'PasswordC' => 'required|min:8',
            'TelC' => 'required',
            'CodeM' => 'required',
        ]);
        $commercial = new Commercial();

        $commercial->NomC = $request->NomC;
        $commercial->PrenomC = $request->PrenomC;
        $commercial->EmailC = $request->EmailC;
        $commercial->CodeM = $request->CodeM;
        $commercial->PasswordC = Hash::make($request->PasswordC);
        $commercial->TelC = $request->TelC;
        $commercial->save();
        return response()->json([
            'message' => 'Commercial ajouté avec succès',
            'commercial' => $commercial,
        ], 201);
    }
    public function loginC(Request $request)
    {
        $request->validate([
            'EmailC' => 'required|email',
            'PasswordC' => 'required|min:8',
        ]);
        $commercial = Commercial::where('EmailC', $request->EmailC)->first();

        if ($commercial && Hash::check($request->PasswordC, $commercial->PasswordC)) {
            $token = $commercial->createToken('myapptoken')->plainTextToken;
            return response()->json([
                'message' => 'Connexion réussie',
                'commercial' => $commercial,
                'token' => $token
            ], 200);
        }
        return response()->json([
            'message' => 'Email ou mot de passe incorrect'
        ], 401);
    }
    public function getCommercialDetails($CodeC)
{
    $commercial = Commercial::where('CodeC', $CodeC)->first();

    $records = DB::table('client')
        ->join('commercial', 'client.CodeC', '=', 'commercial.CodeC')
        ->where('commercial.CodeC', $CodeC)
        ->select('client.*', 'client.NomCl', 'client.PrenomCl', 'client.TelCl', 'client.AdressePostal', 'client.AdresseLivraison', 'client.NbrCommandeHistorique', 'client.QteCommandee', 'client.Paiement')
        ->get();

    return response()->json([
        'message' => 'Commercial Details',
        'commercial' => $commercial,
        'records' => $records
    ], 200);
}
public function getCommandesByCodeCommercial($CodeC)
{
    $commandes = Commande::where('CodeC', $CodeC)->get();

    return response()->json(['commandes' => $commandes], 200);
}
    public function index()
    {
        // return dd('ggggg');

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
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

    //
    // public function show($CodeC)
    // {
    //     $commercial = Commercial::find($CodeC);
    //     return response()->json(['commercial' => $commercial], 200);
    // }


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
