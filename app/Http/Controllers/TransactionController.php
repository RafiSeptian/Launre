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
		// validation of all request received
		$this->validate($request, [
			'id_member' => 'required',
			'id_paket' => 'required',
			'dibayar' => 'required',
			'qty' => 'required'
		],
        // customize the messages validation
            [
			'id_member.required' => 'Member harus diisi!',
			'id_paket.required' => 'Paket harus diisi!',
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

		// set manual fill form data
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

        /* count transaction */
		$price = (($package->getOriginal('harga') * $request->berat) * $request->qty) + $request->biaya_tambahan + $request->pajak;
		$discount = $package->getOriginal('harga') * $data['diskon'];
		$total = $price - $discount;

		/* Insert result to database */
		$transaction = Transaction::create($data);
		DetailTrans::create([
			'id_transaksi' => $transaction->id,
			'id_paket' => $request->id_paket,
			'berat' => $request->berat,
			'qty' => $request->qty,
			'total' => $total,
			'keterangan' => $request->keterangan
		]);
        /* returning user to transaction page */
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

		/* Send sms to customer if their clothes is already cleaned  */
//		if($transaction->status == 'selesai'){
//            $tlp = '+62' . substr($transaction->member->tlp, 1);
//			Nexmo::message()->send([
//				'to' => $tlp,
//				'from' => 'Launre',
//				'text' => "Halo {$transaction->member->nama}. Cucian anda sudah kami selesaikan"
//			]);
//		}

		return redirect()->route('voyager.transaction.index');
	}

	public function editStatus($id){
		$transaction = Transaction::findOrFail($id);
		$data = ['baru', 'proses', 'selesai', 'diambil'];

		return view('partials.ChangeStatus', ['transaction' => $transaction, 'data' => $data]);
	}

	public function updateStatus(Request $request, $id){
		$transaction = Transaction::findOrFail($id);

		$transaction->update([
			'status' => $request->status
		]);

		return response()->json(['msg' => 'Status telah diubah'], 200);

		// return redirect()->route('voyager.transaction.index');
	}

	    /* Export data from database to Excel by request date*/
	public function excel(Request $request){
	    /* catch and parse request */
		$from = Date::parse($request->from)->format('dmy');
		$until = Date::parse($request->to)->format('dmy');

		/* Find data in database by request date */
		$transaction = Transaction::whereDate('created_at', '>=', $request->from)->whereDate('created_at', '<=', $request->to)->get();

		/* If data transaction not found */
		if(count($transaction) < 1){
		    /* If request from date is same with request to date*/
			if($request->from == $request->to){
				$msg = "Tidak ada Transaksi pada <i>".Date::parse($request->from)->format('d F Y')."</i>";
			}
			else{
				$msg = "Tidak ada Transaksi pada <i>".Date::parse($request->from)->format('d F Y') ." sampai ".Date::parse($request->to)->format('d F Y')."</i>";
			}
            /* returning user to create transaction page with session message */
			return redirect()->route('voyager.transaction.index')->with('err', $msg);
		}
        /* if data transaction was found, call TransactionExport class and download file with format .xlsx */
		return Excel::download(new TransactionExport($request->from, $request->to), "transaksi($from-$until).xlsx");
	}

	public function pdf(Request $request){
		$transaction = Transaction::with(['member', 'detail', 'user']);

		if($request->from == $request->to){
			$transaction->whereDate('created_at', $request->to);
			$date = Date::parse($request->from)->format('d F Y');
		}
		else{
			$transaction->whereDate('created_at', '>=', $request->from)->whereDate('created_at','<=', $request->to);
			$date = Date::parse($request->from)->format('d F Y') . ' - ' . Date::parse($request->to)->format('d F Y');
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
		$pdf = PDF::loadView('partials.exports.pdf.transaksi', ['data' => $data, 'date' => $date]);
		return $pdf->download('transaksi.pdf');
	}
}
