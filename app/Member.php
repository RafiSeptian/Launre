<?php

namespace App;

use Date;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Member extends Model
{

	use SoftDeletes;

    protected $table = 'tb_member';

    protected $guarded = ['id'];

    protected $dates = ['deleted_at'];

    public function outlet(){
    	return $this->belongsTo(Outlet::class, 'id_outlet');
    }

    public function getCreatedAtAttribute($value){
    	return Date::parse($value)->format('d-m-Y H:i:s');
    }
}
