<?php
namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use App\Package;
use Auth;

class PackagesWidget extends AbstractWidget
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
        $count = \App\Package::count();
        $string = 'Paket';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-bag',
            'title'  => "{$count} {$string}",
            'text'   => "Ada $count paket didalam database. Klik tombol dibawah untuk melihat semua paket.",
            'button' => [
                'text' => 'Lihat semua paket',
                'link' => '/admin/package',
            ],
            'image' => asset('images/packages.jpg'),
        ]));
    }

     public function shouldBeDisplayed()
        {
            return Auth::user()->can('browse', app(Package::class));
        }
}
?>