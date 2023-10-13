<?php

namespace App\Http\Controllers;

use App\Models\Commercial;
use App\Models\Manager;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ManagerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function register(Request $request)
    {
        $request->validate([
            'NomM' => 'required',
            'PrenomM' => 'required',
            'EmailM' => 'required|email',
            'PasswordM' => 'required',
            'TelM' => 'required',
        ]);

        $manager = new Manager;
        $manager->NomM = $request->NomM;
        $manager->PrenomM = $request->PrenomM;
        $manager->EmailM = $request->EmailM;
        $manager->PasswordM = Hash::make($request->PasswordM);
        $manager->TelM = $request->TelM;
        $manager->save();

        $token = $manager->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => 'Manager ajouté avec succès',
            'manager' => $manager
        ], 201);    }

    public function login(Request $request)
    {
        $request->validate([
            'EmailM' => 'required|email',
            'PasswordM' => 'required',
        ]);

        $manager = Manager::where('EmailM', $request->input('EmailM'))->first();

        if ($manager && Hash::check($request->input('PasswordM'), $manager->PasswordM)) {
            $token = $manager->createToken('myapptoken')->plainTextToken;
            // $request->session()->put('manager', $manager);

            return response()->json([
                'message' => 'Connexion réussie',
                'manager' => $manager,
                'token' => $token
            ], 200);
        }

        return response()->json([
            'message' => 'Échec de la connexion'
        ], 401);
    }



    public function getManagerDetails($CodeM)
    {
        $manager = Manager::where('CodeM', $CodeM)->first();
        $resultat = DB::table('commercial')
            ->join('manager', 'commercial.CodeM', '=', 'manager.CodeM')
            ->where('manager.CodeM', '=', $CodeM)
            ->select('commercial.*', 'commercial.CodeC','commercial.NomC','commercial.PrenomC')
            ->get();
        return response()->json(['resultat'=>$resultat,
        'manager' => $manager]);
    }

    public function index()
    {
    }
    public function create()
    {
        // Afficher le formulaire de création
    }
    public function store(Request $request)
    {
        // Enregistrer une nouvelle ressource
    }
    public function edit(string $id)
    {
        // Afficher le formulaire d'édition d'une ressource
    }
    public function update(Request $request, string $id)
    {
        // Mettre à jour une ressource spécifique
    }
    public function destroy(string $id)
    {
        // Supprimer une ressource spécifique
    }
}
