<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\Product; // Thêm model ở đây
use App\Models\CategoryProduct;
use App\Models\BrandProduct;
use Darryldecode\Cart\Facades\CartFacade as Cart; // Sử dụng Facade

class CheckoutController extends Controller
{
    public function login_checkout(Request $request)
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        return view("pages.checkout.login_checkout")->with('category', $category_product)
                                                ->with('brand', $brand_product);
    }
}
