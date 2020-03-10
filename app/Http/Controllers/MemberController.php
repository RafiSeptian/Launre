<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Member;
use DataTables;

class MemberController extends Controller {

    // public function create(){
    // 	return view('vendor.voyager.member.create');
    // }

    public function datatables(){
    	$data = Member::query()->with(['outlet'])->get();

    	return Datatables::of($data)
    	->addColumn('outlet', function($data){
    		return $data->outlet->nama;
    	})
    	->toJson();
    }
}
