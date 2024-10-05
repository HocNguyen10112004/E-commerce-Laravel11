<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\CategoryProductController;
use App\Http\Controllers\BrandProductController;
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
//Admin
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
//Category_product
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
])->name('save_category_product');
Route::post('/active_category_product/{category_id}', [
    CategoryProductController::class,   
    'active_category_product'
]);
Route::get('/edit_category_product/{category_id}', [
    CategoryProductController::class,   
    'edit_category_product'
] ); 
Route::get('/delete_category_product/{category_id}', [
    CategoryProductController::class,   
    'delete_category_product'
] ); 
Route::post('/update_category_product/{category_id}', [
    CategoryProductController::class,   
    'update_category_product'
] );
//Brand_product
Route::get('/add_brand_product', [
    BrandProductController::class,   
    'add_brand_product'
] );
Route::get('/all_brand_product', [
    BrandProductController::class,   
    'all_brand_product'
] );       
Route::post('/save_brand_product', [
    BrandProductController::class, 
    'save_brand_product'
])->name('save_brand_product');
Route::post('/active_brand_product/{brand_id}', [
    BrandProductController::class,   
    'active_brand_product'
]);
Route::get('/edit_brand_product/{brand_id}', [
    BrandProductController::class,   
    'edit_brand_product'
] ); 
Route::get('/delete_brand_product/{brand_id}', [
    BrandProductController::class,   
    'delete_brand_product'
] ); 
Route::post('/update_brand_product/{brand_id}', [
    BrandProductController::class,   
    'update_brand_product'
] );