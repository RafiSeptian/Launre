<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_transaksi', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_outlet');
            $table->foreign('id_outlet')
                ->references('id')->on('tb_outlet')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->string('kode_invoice', 100);
            $table->unsignedBigInteger('id_member');
            $table->foreign('id_member')
                ->references('id')
                ->on('tb_member')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->datetime('tgl');
            $table->datetime('batas_waktu');
            $table->datetime('tgl_bayar')->nullable();
            $table->integer('biaya_tambahan')->default(0);
            $table->double('diskon')->default(0);
            $table->integer('pajak')->default(0);
            $table->enum('status', ['baru', 'proses', 'selesai', 'diambil']);
            $table->enum('dibayar', ['dibayar', 'belum_dibayar']);
            $table->unsignedBigInteger('id_user');
            $table->foreign('id_user')->references('id')->on('tb_user')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
            $table->datetime('deleted_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transactions');
    }
}
