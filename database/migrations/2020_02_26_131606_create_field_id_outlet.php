<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFieldIdOutlet extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tb_member', function (Blueprint $table) {
            $table->unsignedBigInteger('id_outlet')->after('id');
            $table->foreign('id_outlet')->references('id')->on('tb_outlet')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tb_member', function (Blueprint $table) {
            $table->dropIfExists('id_outlet');
        });
    }
}
