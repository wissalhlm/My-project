<?php

use App\Http\Controllers\ClientController;
use App\Http\Controllers\CommandeController;
use App\Http\Controllers\CommercialController;
use App\Http\Controllers\ManagerController;
use App\Http\Controllers\ProduitController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/registrer',[ManagerController::class,'register']);
Route::post('/login',[ManagerController::class,'login']);
Route::post('/registrerC',[CommercialController::class,'registrerC']);
Route::post('/loginC',[CommercialController::class,'loginC']);
Route::get('/commercials/{CodeM}',[ManagerController::class,'getManagerDetails']);
Route::get('/client/{CodeC}',[CommercialController::class,'getCommercialDetails']);
Route::post('/clientAjout',[ClientController::class,'create']);
Route::get('/produits',[ProduitController::class,'index']);
Route::post('/ajoutCommande',[CommandeController::class,'create']);
Route::get('/commandes/{CodeC}', [CommercialController::class, 'getCommandesByCodeCommercial']);

