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
 * Class Commercial
 *
 * @property int $CodeC
 * @property string $NomC
 * @property string $PrenomC
 * @property string $EmailC
 * @property string $PasswordC
 * @property string $TelC
 * @property int $CodeM
 *
 * @property Manager $manager
 * @property Collection|Client[] $clients
 * @property Collection|Produit[] $produits
 *
 * @package App\Models
 */
class Commercial extends Model
{
    use HasApiTokens, Notifiable;
	protected $table = 'commercial';
	protected $primaryKey = 'CodeC';
	public $timestamps = false;

	protected $casts = [
		'CodeM' => 'int'
	];

	protected $fillable = [
		'NomC',
		'PrenomC',
		'EmailC',
		'PasswordC',
		'TelC',
		'CodeM'
	];

	public function manager()
	{
		return $this->belongsTo(Manager::class, 'CodeM');
	}

	public function clients()
	{
		return $this->hasMany(Client::class, 'CodeC');
	}

	public function produits()
	{
		return $this->hasMany(Produit::class, 'CodeC');
	}
}
