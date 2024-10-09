<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CategoryProduct;
use App\Models\BrandProduct;
use App\Models\Product;
class HomeController extends Controller
{
    public function index()
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $all_product = Product::with(['brand', 'category'])->where('product_status', '1')->limit(4)->get();
        return view('pages.home')->with('category', $category_product)->with('brand', $brand_product)->with('all_product', $all_product);
    }
}
