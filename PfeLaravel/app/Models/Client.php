<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Client
 * 
 * @property int $CodeCl
 * @property string $NomCl
 * @property string $PrenomCl
 * @property string $TelCl
 * @property int $AdressePostal
 * @property string $AdresseLivraison
 * @property int $NbrCommandeHistorique
 * @property int $QteCommandee
 * @property int $CodeC
 * @property string $Paiement
 * 
 * @property Commercial $commercial
 * @property Collection|Commande[] $commandes
 * @property Collection|Produit[] $produits
 *
 * @package App\Models
 */
class Client extends Model
{
	protected $table = 'client';
	protected $primaryKey = 'CodeCl';
	public $timestamps = false;

	protected $casts = [
		'AdressePostal' => 'int',
		'NbrCommandeHistorique' => 'int',
		'QteCommandee' => 'int',
		'CodeC' => 'int'
	];

	protected $fillable = [
		'NomCl',
		'PrenomCl',
		'TelCl',
		'AdressePostal',
		'AdresseLivraison',
		'NbrCommandeHistorique',
		'QteCommandee',
		'CodeC',
		'Paiement'
	];

	public function commercial()
	{
		return $this->belongsTo(Commercial::class, 'CodeC');
	}

	public function commandes()
	{
		return $this->hasMany(Commande::class, 'CodeCl');
	}

	public function produits()
	{
		return $this->hasMany(Produit::class, 'CodeCl');
	}
}
