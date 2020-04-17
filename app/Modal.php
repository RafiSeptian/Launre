<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Date;

class Modal extends Model
{
    use SoftDeletes;

    protected $table = 'tb_modal';
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

    public function getBiayaAttribute($value){
        if($value > 0){
            return 'Rp.' . number_format($value);
        }
        return $value;
    }

    public function getCreatedAtAttribute($date){
        return Date::parse($date)->format('d-m-Y');
    }

}
