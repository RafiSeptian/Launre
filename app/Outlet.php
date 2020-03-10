<?php

namespace App;
use Date;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Outlet extends Model
{
	use SoftDeletes;

    protected $table = 'tb_outlet';

    protected $guarded = ['id'];

    protected $dates = ['deleted_at'];

    public function getCreatedAtAttribute($value){
    	return Date::parse($value)->format('d-m-Y H:i:s');
    }
}
