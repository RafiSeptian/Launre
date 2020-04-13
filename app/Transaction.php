<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Date;

class Transaction extends Model
{
    use SoftDeletes;

    /* Define Properties */
    protected $table = 'tb_transaksi';
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

    /* Define Relationship */
    public function detail(){
    	return $this->hasOne(DetailTrans::class, 'id_transaksi');
    }

    public function outlet(){
    	return $this->belongsTo(Outlet::class, 'id_outlet');
    }

    public function member(){
    	return $this->belongsTo(Member::class, 'id_member');
    }

    public function user(){
    	return $this->belongsTo(User::class, 'id_user');
    }

    /* Define Accessor */
    public function getBiayaTambahanAttribute($value){
        if($value <= 0){
            return '-';
        }
        return 'Rp.' . number_format($value);
    }

    public function getDiskonAttribute($value){
        if($value <= 0){
            return '-';
        }
        return $value * 100 . '%';
    }

    public function getPajakAttribute($value){
        if($value <= 0){
            return '-';
        }
        return 'Rp.' . number_format($value);
    }

    public function getTglAttribute($value){
        return Date::parse($value)->format('d-m-Y H:i:s');
    }

    public function getBatasWaktuAttribute($value){
        return Date::parse($value)->format('d-m-Y H:i:s');
    }

    public function getTglBayarAttribute($value){
        if($value == NULL){
            return '-';
        }

        return Date::parse($value)->format('d-m-Y H:i:s');
    }
}
