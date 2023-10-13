<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Commande
 *
 * @property int $CodeCM
 * @property int $QuantiteCM
 * @property Carbon $DateCommande
 * @property float $Total
 * @property int $CodeCl
 * @property int $CodeA
 * @property int $CodeC
 *
 * @property Produit $produit
 * @property Client $client
 * @property Commercial $commercial
 *
 * @package App\Models
 */
class Commande extends Model
{
    protected $table = 'commande';
    protected $primaryKey = 'CodeCM';
    public $timestamps = false;

    protected $casts = [
        'QuantiteCM' => 'int',
        'DateCommande' => 'datetime',
        'Total' => 'float',
        'CodeCl' => 'int',
        'CodeA' => 'int',
        'CodeC' => 'int'
    ];

    protected $fillable = [
        'QuantiteCM',
        'DateCommande',
        'Total',
        'CodeCl',
        'CodeA',
        'CodeC'
    ];

    public function produit()
    {
        return $this->belongsTo(Produit::class, 'CodeA');
    }

    public function client()
    {
        return $this->belongsTo(Client::class, 'CodeCl');
    }

    public function commercial()
    {
        return $this->belongsTo(Commercial::class, 'CodeC');
    }
}
