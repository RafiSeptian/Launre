<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Modal;
use App\Transaction;
use Date;
use DB;

class ModalController extends Controller
{
    public function create(){
        return view('vendor.voyager.modal.create');
    }
    public function edit($id){
        $data = Modal::findOrFail($id);
        return view('vendor.voyager.modal.edit', compact('data'));
    }

    public function statistic(){
        $now = Date::now()->format('m');
        $transaction = Transaction::with('detail')->whereMonth('tgl', $now)->get();
        $modal = DB::table('tb_modal')->whereMonth('created_at', $now)->get();
        $outlet = DB::table('tb_outlet')->get();
        return response()->json(['modal' => $modal, 'transaction' => $transaction, 'outlet' => $outlet], 200);
    }
}
