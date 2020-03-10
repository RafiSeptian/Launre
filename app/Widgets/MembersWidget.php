<?php
namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use App\Member;
use Auth;

class MembersWidget extends AbstractWidget
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
        $count = \App\Member::count();
        $string = 'Member';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-people',
            'title'  => "{$count} {$string}",
            'text'   => "Ada $count member didalam database. Klik tombol dibawah untuk melihat semua member.",
            'button' => [
                'text' => 'Lihat semua member',
                'link' => '/admin/member',
            ],
            'image' => asset('images/members.jpg'),
        ]));
    }

     public function shouldBeDisplayed()
        {
            return Auth::user()->can('browse', app(Member::class));
        }
}
?>