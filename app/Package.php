<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Date;

class Package extends Model
{
	use SoftDeletes;

    protected $table = 'tb_paket';

    protected $guarded = ['id'];

    protected $dates = ['deleted_at'];

    public function getHargaAttribute($value){
    	return "Rp." . number_format($value);
    }

    public function getCreatedAtAttribute($value){
    	return Date::parse($value)->format('d-m-Y H:i:s');
    }
}
