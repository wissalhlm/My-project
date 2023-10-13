<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

/**
 * Class Manager
 *
 * @property int $CodeM
 * @property string $NomM
 * @property string $PrenomM
 * @property string $EmailM
 * @property string $PasswordM
 * @property string $TelM
 *
 * @property Collection|Commercial[] $commercials
 * @property Collection|Produit[] $produits
 *
 * @package App\Models
 */
class Manager extends Model
{
    use HasApiTokens, Notifiable;
	protected $table = 'manager';
	protected $primaryKey = 'CodeM';
	public $timestamps = false;

	protected $fillable = [
		'NomM',
		'PrenomM',
		'EmailM',
		'PasswordM',
		'TelM'
	];

	public function commercials()
	{
		return $this->hasMany(Commercial::class, 'CodeM');
	}

	public function produits()
	{
		return $this->hasMany(Produit::class, 'CodeM');
	}
}
