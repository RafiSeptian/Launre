<?php
namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Auth;

class RolesWidget extends AbstractWidget
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
        $count = Voyager::model('Role')->count();
        $string = 'Hak akses';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-lock',
            'title'  => "{$count} {$string}",
            'text'   => "Ada $count hak akses didalam database. Klik tombol dibawah untuk melihat semua hak akses.",
            'button' => [
                'text' => 'Lihat semua hak akses',
                'link' => '/admin/roles',
            ],
            'image' => asset('images/pc.jpg'),
        ]));
    }

     public function shouldBeDisplayed()
        {
            return Auth::user()->can('browse', Voyager::model('Role'));
        }
}
?>