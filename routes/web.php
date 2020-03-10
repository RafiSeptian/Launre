<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// datatables route
Route::get('/transaction/datatables', 'TransactionController@datatables')->name('transaction.data');
Route::get('/member/datatables', 'MemberController@datatables')->name('member.data');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    // transaction route
    Route::get('/transaction', 'TransactionVoyagerController@index')->name('voyager.transaction.index');
    Route::get('/transaction/create', 'TransactionController@create')->name('voyager.transaction.create');
    Route::get('/transaction/{id}/edit', 'TransactionController@edit')->name('voyager.transaction.edit');
    Route::post('/transaction', 'TransactionController@store')->name('voyager.transaction.store');
    Route::put('/transaction/{id}', 'TransactionController@update')->name('voyager.transaction.update');

    // member route
    Route::get('/member', 'MemberVoyagerController@index')->name('voyager.member.index');
});

// partial routes
Route::post('/transaction/export/excel', 'TransactionController@excel')->name('transaction.export');
Route::post('/transaction/export/pdf', 'TransactionController@pdf')->name('transaction.pdf');