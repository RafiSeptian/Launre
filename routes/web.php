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

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    // transaction route
    Route::get('/transaction/create', 'TransactionController@create')->name('voyager.transaction.create');
    Route::get('/transaction/{id}/edit', 'TransactionController@edit')->name('voyager.transaction.edit');
    Route::post('/transaction', 'TransactionController@store')->name('voyager.transaction.store');
    Route::put('/transaction/{id}', 'TransactionController@update')->name('voyager.transaction.update');
    Route::get('/transaction/status/{id}/edit', 'TransactionController@editStatus')->name('transaction.status.edit');
    Route::put('/transaction/status/{id}/edit', 'TransactionController@updateStatus')->name('transaction.status.update');

    // Statistic Route
    Route::get('/statistic', function(){
        return view('partials.statistic');
    })->name('voyager.statistic');

});

// partial routes
Route::post('/transaction/export/excel', 'TransactionController@excel')->name('transaction.export');
Route::post('/transaction/export/pdf', 'TransactionController@pdf')->name('transaction.pdf');
Route::get('/statistic', 'ModalController@statistic')->name('get.statistic');

// filter member by day
Route::get('/member/filter', 'MemberVoyagerController@filterByDay');
