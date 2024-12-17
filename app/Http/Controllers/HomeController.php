<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CategoryProduct;
use App\Models\BrandProduct;
use App\Models\Product;
use App\Models\OrderDetails;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
class HomeController extends Controller
{
    public function index()
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $all_product = Product::with(['brand', 'category'])->where('product_status', '1')->get();
        // $hot_product = Product::with(['brand', 'category'])->where('product_status', '1')->limit(3)->get();
        $currentMonth = Carbon::now()->month;
        $currentYear = Carbon::now()->year;
        $topProducts = OrderDetails::select('product_id', DB::raw('SUM(product_sales_quantity) as total_quantity'))
            ->whereMonth('created_at', $currentMonth)
            ->whereYear('created_at', $currentYear)
            ->groupBy('product_id')
            ->orderBy('total_quantity', 'desc')
            ->limit(3)
            ->get();
        // Lấy thông tin chi tiết của các sản phẩm này
        $hot_product = Product::with(['brand', 'category'])->whereIn('product_id', $topProducts->pluck('product_id'))->get();
        return view('pages.home')->with('category', $category_product)
            ->with('brand', $brand_product)
            ->with('all_product', $all_product)
            ->with('hot_product', $hot_product);
    }
}
