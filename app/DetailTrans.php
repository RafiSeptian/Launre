<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Date;

class DetailTrans extends Model
{
	use SoftDeletes;

    protected $table = 'tb_detail_transaksi';

    protected $guarded = ['id'];

    protected $dates = ['deleted_at'];

    public function package(){
    	return $this->belongsTo(Package::class, 'id_paket');
    }

    public function getCreatedAtAttribute($value){
    	return Date::parse($value)->format('d-m-Y H:i:s');
    }

    public function getIdPaketAttribute($value){
        return Package::whereId($value)->first()['nama_paket'];
    }

    public function getTotalAttribute($value){
        return 'Rp.' . number_format($value);
    }

    public function getKeteranganAttribute($value){
        if(is_null($value)){
            return '-';
        }

        return $value;
    }
}
