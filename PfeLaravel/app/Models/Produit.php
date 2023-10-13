<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Produit
 *
 * @property int $CodeA
 * @property string $NomA
 * @property float $Prix
 * @property int $Condionnement_NbrUnite
 * @property int $Stock
 * @property Carbon $DatePeremption

 *

 * @property Collection|Commande[] $commandes
 *
 * @package App\Models
 */
class Produit extends Model
{
	protected $table = 'produit';
	protected $primaryKey = 'CodeA';
	public $timestamps = false;

	protected $casts = [
		'Prix' => 'float',
		'Condionnement_NbrUnite' => 'int',
		'Stock' => 'int',
		'DatePeremption' => 'datetime',
	];

	protected $fillable = [
		'NomA',
		'Prix',
		'Condionnement_NbrUnite',
		'Stock',
		'DatePeremption'
	];
}
