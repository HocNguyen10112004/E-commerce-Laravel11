<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\CategoryProductController;
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
Route::get('/logout', [
    AdminController::class,
    'logout'
] ); 
Route::get('/add_category_product', [
    CategoryProductController::class,   
    'add_category_product'
] );
Route::get('/all_category_product', [
    CategoryProductController::class,   
    'all_category_product'
] );       
Route::post('/save_category_product', [
    CategoryProductController::class,
    'save_category_product'
] );
Route::get('/active_category_product/{category_id}', [
    CategoryProductController::class,   
    'active_category_product'
]);
