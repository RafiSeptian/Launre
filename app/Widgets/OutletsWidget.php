<?php
namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use App\Outlet;
use Auth;

class OutletsWidget extends AbstractWidget
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
        $count = \App\Outlet::count();
        $string = 'Outlet';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-shop',
            'title'  => "{$count} {$string}",
            'text'   => "Ada $count outlet didalam database. Klik tombol dibawah untuk melihat semua outlet.",
            'button' => [
                'text' => 'Lihat semua outlet',
                'link' => '/admin/outlet',
            ],
            'image' => asset('images/stores.jpg'),
        ]));
    }

     public function shouldBeDisplayed()
        {
            return Auth::user()->can('browse', app(Outlet::class));
        }
}
?>