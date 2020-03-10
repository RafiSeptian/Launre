<?php
namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use App\Transaction;
use Auth;

class TransactionWidget extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = \App\Transaction::count();
        $string = 'Transaksi';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-dollar',
            'title'  => "{$count} {$string}",
            'text'   => "Ada $count transaksi didalam database. Klik tombol dibawah untuk melihat semua transaksi.",
            'button' => [
                'text' => 'Lihat semua transaksi',
                'link' => '/admin/transaction',
            ],
            'image' => asset('images/transactions.jpg'),
        ]));
    }

     public function shouldBeDisplayed()
        {
            return Auth::user()->can('browse', app(Transaction::class));
        }
}
?>