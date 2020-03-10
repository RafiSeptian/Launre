<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Transaction;
use App\DetailTrans;
use Auth;
use Date;
use DataTables;
use Excel;
use PDF;
use App\Exports\TransactionExport;
use Nexmo;

class TransactionController extends Controller
{

	public function create(){
		return view('vendor.voyager.transaction.create');
	}

	public function store(Request $request)
	{
		// validasi
		$this->validate($request, [
			'id_member' => 'required',
			'id_paket' => 'required',
			'status' => 'required',
			'dibayar' => 'required',
			'qty' => 'required'
		], [
			'id_member.required' => 'Member harus diisi!',
			'id_paket.required' => 'Paket harus diisi!',
			'status.required' => 'Status harus diisi!',
			'dibayar.required' => 'Dibayar harus diisi!',
			'qty.required' => 'Qty harus diisi!'
		]);

		// catch all request
		$data = $request->except(['id_paket', 'berat', 'qty', 'keterangan']);

		// setting
		$package = \App\Package::findOrFail($request->id_paket);
		$date = new Date('+7 day');
		$latest = Transaction::orderBy('created_at', 'desc')->first();

		if($latest){
			$order = $latest->id;
		}
		else{
			$order = 1;
		}

		// set manual fill the formdata
		$data['id_user']  = Auth::user()->id;
		if(auth()->user()->role_id !== 1){
			$data['id_outlet'] = Auth::user()->id_outlet;
		}
		else{
			$data['id_outlet'] = $request->id_outlet;
		}
		$data['tgl'] = Date::now()->format('Y-m-d H:i:s');
		$data['kode_invoice'] = Date::now()->format('dmy') . '-' . $data['id_outlet'] . '-' . $order;
		$data['batas_waktu'] = $date->format('Y-m-d H:i:s');
		$data['diskon'] = $request->diskon * 1/100;

		if($request->dibayar == 'dibayar'){
			$data['tgl_bayar'] = Date::now()->format('Y-m-d H:i:s');
		}

		$harga = (($package->getOriginal('harga') * $request->berat) * $request->qty) + $request->biaya_tambahan + $request->pajak;
		$diskon = $package->getOriginal('harga') * $data['diskon'];

		$total = $harga - $diskon;

		$transaction = Transaction::create($data);
		
		DetailTrans::create([
			'id_transaksi' => $transaction->id,
			'id_paket' => $request->id_paket,
			'berat' => $request->berat,
			'qty' => $request->qty,
			'total' => $total,
			'keterangan' => $request->keterangan
		]);

		return redirect()->route('voyager.transaction.index');
	}

	public function edit($id){
		$data = Transaction::with(['detail', 'member'])->findOrFail($id);

		return view('vendor.voyager.transaction.edit', compact('data'));
	}

	public function update(Request $request, $id){

		// validasi
		$this->validate($request, [
			'id_member' => 'required',
			'id_paket' => 'required',
			'status' => 'required',
			'dibayar' => 'required',
			'qty' => 'required'
		], [
			'id_member.required' => 'Member harus diisi!',
			'id_paket.required' => 'Paket harus diisi!',
			'status.required' => 'Status harus diisi!',
			'dibayar.required' => 'Dibayar harus diisi!',
			'qty.required' => 'Qty harus diisi!'
		]);

		// catch all request
		$data = $request->except(['id_paket', 'berat', 'qty', 'keterangan']);

		// setting
		$package = \App\Package::findOrFail($request->id_paket);

		// set manual fill the formdata
		$data['diskon'] = $request->diskon * 1/100;

		if($request->dibayar == 'dibayar'){
			$data['tgl_bayar'] = Date::now()->format('Y-m-d H:i:s');
		}
		else{
			$data['tgl_bayar'] = null;
		}

		$transaction = Transaction::with(['member'])->findOrFail($id);

		$tlp = '+62' . substr($transaction->member->tlp, 1);

		$transaction->update([
			'id_member' => $request->id_member,
			'diskon' => $data['diskon'],
			'biaya_tambahan' => $request->biaya_tambahan,
			'pajak' => $request->pajak,
			'status' => $request->status,
			'dibayar' => $request->dibayar,
			'tgl_bayar' => $data['tgl_bayar']
		]);

		$harga = (($package->getOriginal('harga') * $request->berat) * $request->qty) + $request->biaya_tambahan + $request->pajak;
		$diskon = $package->getOriginal('harga') * $data['diskon'];

		$total = $harga - $diskon;

		$transaction->detail->update([
			'id_paket' => $request->id_paket,
			'berat' => $request->berat,
			'qty' => $request->qty,
			'total' => $total,
			'keterangan' => $request->keterangan
		]);

		if($transaction->status == 'selesai'){
			Nexmo::message()->send([
				'to' => $tlp,
				'from' => 'Launre',
				'text' => "Halo {$transaction->member->nama}. Cucian anda sudah kami selesaikan"
			]);
		}

		return redirect()->route('voyager.transaction.index');
	}

	public function datatables(){
		if(auth()->user()->role_id == 3){
			$data = Transaction::query()->with(['detail'])->where('id_user', auth()->user()->id)->get();
		}

		$data = Transaction::query()->with(['detail'])->get();

		return DataTables::of($data)->
		addColumn('outlet', function($data){
			return $data->outlet->nama;
		})->
		addColumn('member', function($data){
			return $data->member->nama;
		})->
		addColumn('status', function($data){
			return ucfirst($data->status);
		})->addColumn('dibayar', function($data){
			return str_replace('_', ' ', ucfirst($data->dibayar));
		})->
		addColumn('action', function($data){
			return view('partials.actions.transactionAction', [
				'id' => $data->id,
				'url_edit' => route('voyager.transaction.edit', $data->id),
				'url_destroy' => route('voyager.transaction.destroy', $data->id)
			]);
		})->
		rawColumns(['action'])->
		toJson();
	}

	public function excel(Request $request){
		$from = Date::parse($request->from)->format('dmy');
		$until = Date::parse($request->to)->format('dmy');

		$transaction = Transaction::whereDate('created_at', '>=', $request->from)->whereDate('created_at', '<=', $request->to)->get();

		if(count($transaction) < 1){
			if($request->from == $request->to){
				$msg = "Tidak ada Transaksi pada <i>".Date::parse($request->from)->format('d F Y')."</i>";
			}
			else{
				$msg = "Tidak ada Transaksi pada <i>".Date::parse($request->from)->format('d F Y') ." sampai ".Date::parse($request->to)->format('d F Y')."</i>";
			}
			return redirect()->route('voyager.transaction.index')->with('err', $msg);
		}

		return Excel::download(new TransactionExport($request->from, $request->to), "transaksi($from-$until).xlsx");
	}

	public function pdf(Request $request){
		$transaction = Transaction::with(['member', 'detail', 'user']);

		if($request->from == $request->to){
			$transaction->whereDate('created_at', $request->to);
		}
		else{
			$transaction->whereDate('created_at', '>=', $request->from)->whereDate('created_at','<=', $request->to);
		}

		if(auth()->user()->role_id == 3){
			$transaction->where('id_user', auth()->user()->id);
		}

		$data = $transaction->get();

		if(count($data) < 1){
			if($request->from == $request->to){
				$msg = "Tidak ada Transaksi pada <i>".Date::parse($request->from)->format('d F Y')."</i>";
			}
			else{
				$msg = "Tidak ada Transaksi pada <i>".Date::parse($request->from)->format('d F Y') ." sampai ".Date::parse($request->to)->format('d F Y')."</i>";
			}
			return redirect()->route('voyager.transaction.index')->with('err', $msg);
		}
		$pdf = PDF::loadView('partials.exports.pdf.transaksi', compact('data'));
		return $pdf->download('transaksi.pdf');
	}
}
