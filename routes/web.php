<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\AdminController;
Route::get('/', function () {
    return view('welcome');
});
Route::get('', [
    HomeController::class,
    'index'

]);
Route::get('/trang_chu', [
    HomeController::class,
    'index'
] );
Route::get('/admin', [
    AdminController::class,
    'index'
] );    
Route::get('/dashboard', [
    AdminController::class,
    'show_dashboard'
] ); 
Route::post('/admin-dashboard', [
    AdminController::class,
    'dashboard'
] );
