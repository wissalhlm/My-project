<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('commandes', function (Blueprint $table) {
            $table->increments('CodeCM');
            $table->integer('QuantiteCM');
            $table->date('DateCommande');
            $table->float('Total');
            $table->Integer('CodeA');
            $table->Integer('CodeCl');
            $table->timestamps();

            $table->foreign('CodeA')->references('CodeA')->on('produits');
            $table->foreign('CodeCl')->references('CodeCl')->on('clients');


        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('commandes');
    }
};
