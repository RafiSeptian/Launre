<?php

namespace App\Exports;

use App\Transaction;
use Illuminate\Http\Request;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;

class TransactionExport implements FromView, ShouldAutoSize, WithEvents
{
    /**
    * @return \Illuminate\Support\Collection
    */

    public function __construct($from, $until){
        $this->from = $from;
        $this->until = $until;
    }
    public function view() : View
    {
        $transaction = Transaction::with(['member', 'detail', 'user']);

        if($this->from == $this->until){
            $transaction->whereDate('created_at', $this->until);
        }
        else{
            $transaction->whereDate('created_at', '>=', $this->from)->whereDate('created_at','<=', $this->until);
        }

        if(auth()->user()->role_id == 3){
            $transaction->where('id_user', auth()->user()->id);
        }

        $data = $transaction->get();

        return view('partials.exports.excel.transaksi', ['data' => $data]);
    }
    public function registerEvents() : array{
    	return 	[
    		AfterSheet::class => function(AfterSheet $event){
    			$cellRange = 'A0:O1';
    			$event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setSize(14);
    		}
    	];
    }
}
