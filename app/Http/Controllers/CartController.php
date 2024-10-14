<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\Product; // Thêm model ở đây
use App\Models\CategoryProduct;
use App\Models\BrandProduct;
class CartController extends Controller
{
    public function save_cart(Request $request)
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $productID = $request->input("product_id_hidden");
        $quantity = $request->input("qty");
        $data = Product::find($productID);
        return view("pages.cart.show_cart")->with('category', $category_product)
                                                        ->with('brand', $brand_product);
    }
}
