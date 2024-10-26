<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\Product; // Thêm model ở đây
use App\Models\CategoryProduct;
use App\Models\BrandProduct;
use App\Models\Coupon;
use Darryldecode\Cart\Facades\CartFacade as Cart; // Sử dụng Facade
class CartController extends Controller
{
    public function save_cart(Request $request)
    {
        $productID = $request->input("product_id_hidden");
        $quantity = $request->input("qty");
        $product_infor = Product::find($productID);
        $sessionId = session()->getId(); // lấy session ID của người dùng hiện tại
        Cart::add([
        'id' => $productID, // ID sản phẩm
        'name' => $product_infor->product_name, // Tên sản phẩm
        'quantity' => $quantity, // Số lượng
        'price' => $product_infor->product_price, // Giá sản phẩm
        'attributes' => [
            'image' =>  $product_infor->product_image
        ]
        ]);
        Session::put("cart", Cart::getContent());
        return Redirect::to('/show_cart');
    }

    public function show_cart()
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $cartItems = Session::get('cart', collect());
        // Tính tổng tiền
        $totalAmount = $this->getTotalAmount($cartItems);
        return view("pages.cart.show_cart")->with('category', $category_product)
                                                ->with('brand', $brand_product)
                                                ->with('cartItems', $cartItems)
                                                ->with('totalAmount', $totalAmount);
    }
    public function getTotalAmount($cartItems)
    {
        return $cartItems->sum(function ($item) {
            return $item->price * $item->quantity;
        });
    }
    public function delete_to_cart($id)
    {
        // Xóa sản phẩm khỏi giỏ hàng
        Cart::remove($id);
        
        // Cập nhật lại session (nếu cần)
        Session::put("cart", Cart::getContent());

        // Trả về JSON response
        return response()->json([
            'success' => true,
            'message' => 'Sản phẩm đã được xóa khỏi giỏ hàng.',
            'cart' => Cart::getContent() // có thể trả về nội dung giỏ hàng nếu cần
        ]);
    }
    public function update_cart_quantity(Request $request)
    {
        $itemId = $request->input('product_id');
        $quantity = $request->input('quantity');
        // Cập nhật số lượng trong giỏ hàng
        // Cart::update($itemId, array('quantity'=> $quantity));
        Cart::remove($itemId);
        $product_infor = Product::find($itemId);
        $sessionId = session()->getId(); // lấy session ID của người dùng hiện tại
        Cart::add([
        'id' => $itemId, // ID sản phẩm
        'name' => $product_infor->product_name, // Tên sản phẩm
        'quantity' => $quantity, // Số lượng
        'price' => $product_infor->product_price, // Giá sản phẩm
        'attributes' => [
            'image' =>  $product_infor->product_image
        ]
        ]);
        // Cập nhật lại session
        Session::put("cart", Cart::getContent());

        // Tính lại tổng tiền giỏ hàng
        $cartItems = Session::get('cart', collect());
        $totalAmount = $this->getTotalAmount($cartItems);

        // Trả về JSON response
        return response()->json([
            'success' => true,
            'message' => 'Số lượng đã được cập nhật.',
            'totalAmount' => $totalAmount
        ]);
    }
    public function check_coupon(Request $request)
    {
        $input_coupon_code = $request->input('input_coupon');
        if(!$input_coupon_code)
        {
            Session::put('coupon_apply', "Chưa nhập mã giảm giá");
        }
        else 
        {
            $coupon = Coupon::where('coupon_code', $input_coupon_code)->first();
            if($coupon)
            {
                Session::put('coupon', $coupon);
                Session::put('coupon_apply', "Áp dụng mã giảm giá thành công");
            }
            else
            {
                Session::put('coupon_apply', "Mã giảm giá sai hoặc đã hết hạn");
            }
        }
        return Redirect::back();
    }

}
