<?php

use Illuminate\Database\Seeder;
use App\User;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [
        	['role_id' => 1, 'name'=> 'Laras Nur Aprianti', 'email' => 'larasNur@launre.com', 'password'=>bcrypt('laras676')],
            ['role_id' => 3, 'name'=> 'Panji Agustian', 'email' => 'panjiagustian17@launre.com', 'password'=>bcrypt('panjiagus17')],
            ['role_id' => 2, 'name'=> 'Yuliana Sri', 'email' => 'yulianasri@launre.com', 'password'=>bcrypt('yuliana171')],
            ['role_id' => 3, 'name'=> 'Vivid Yuliana', 'email' => 'vividY@launre.com', 'password'=>bcrypt('vividY997')]
        ];

        foreach($users as $user){
            User::create($user);
        }
    }
}
