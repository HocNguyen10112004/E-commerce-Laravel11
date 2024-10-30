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
    // public function save_cart(Request $request)
    // {
    //     $productID = $request->input("product_id_hidden");
    //     $quantity = $request->input("qty");
    //     $product_infor = Product::find($productID);
    //     Cart::add([
    //     'id' => $productID, // ID sản phẩm
    //     'name' => $product_infor->product_name, // Tên sản phẩm
    //     'quantity' => $quantity, // Số lượng
    //     'price' => $product_infor->product_price, // Giá sản phẩm
    //     'attributes' => [
    //         'image' =>  $product_infor->product_image
    //     ]
    //     ]);
    //     Session::put("cart", Cart::getContent());
    //     return Redirect::to('/show_cart');
    // }
    public function save_cart(Request $request)
    {
        $productID = $request->input("product_id_hidden");
        $quantity = $request->input("qty");
        $product_infor = Product::find($productID);

        // Kiểm tra sản phẩm
        if (!$product_infor) {
            return response()->json(['error' => 'Sản phẩm không tồn tại.'], 400);
        }

        Cart::add([
            'id' => $productID,
            'name' => $product_infor->product_name,
            'quantity' => $quantity,
            'price' => $product_infor->product_price,
            'attributes' => [
                'image' =>  $product_infor->product_image
            ]
        ]);

        Session::put("cart", Cart::getContent());

        return response()->json(['success' => 'Sản phẩm đã được thêm vào giỏ hàng!']);
    }


    public function show_cart()
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $cartItems = Session::get('cart', collect());
        // Tính tổng tiền
        $totalAmount = $this->getTotalAmount($cartItems);
        if (Session::has('coupon')) {
            $coupon = Session::get('coupon');
            $value_coupon = $coupon->coupon_value;
            $class_coupon = $coupon->coupon_desc;
            if($class_coupon==0)
            {
                $totalAmountAfter = Cart::getTotal()*1.1 - $value_coupon;
            }
            else
            {
                $totalAmountAfter = Cart::getTotal()*1.1*(100-$value_coupon)/100;
            }
        }
        else
        {
            $totalAmountAfter = Cart::getTotal()*1.1;
        }
        return view("pages.cart.show_cart")->with('category', $category_product)
                                                ->with('brand', $brand_product)
                                                ->with('cartItems', $cartItems)
                                                ->with('totalAmount', $totalAmount)
                                                ->with('totalAmountAfter', $totalAmountAfter);
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
        if (Session::has('coupon')) {
            $coupon = Session::get('coupon');
            $value_coupon = $coupon->coupon_value;
            $class_coupon = $coupon->coupon_desc;
            if($class_coupon==0)
            {
                $newvalueafter = Cart::getTotal()*1.1 - $value_coupon;
            }
            else
            {
                $newvalueafter = Cart::getTotal()*1.1*(100-$value_coupon)/100;
            }
        }
        else
        {
            $newvalueafter = Cart::getTotal()*1.1;
        }
        // Cập nhật lại session (nếu cần)
        Session::put("cart", Cart::getContent());
        $new_value = Cart::getTotal();
        
        // Trả về JSON response
        return response()->json([
            'success' => true,
            'message' => 'Sản phẩm đã được xóa khỏi giỏ hàng.',
            'newvalue' => $new_value,
            'newvalueafter'=> $newvalueafter,
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
        $totalAmount = Cart::getTotal();
        if (Session::has('coupon')) {
            $coupon = Session::get('coupon');
            $value_coupon = $coupon->coupon_value;
            $class_coupon = $coupon->coupon_desc;
            if($class_coupon==0)
            {
                $newvalueafter = Cart::getTotal()*1.1 - $value_coupon;
            }
            else
            {
                $newvalueafter = Cart::getTotal()*1.1*(100-$value_coupon)/100;
            }
        }
        else
        {
            $newvalueafter = Cart::getTotal()*1.1;
        }
        // Trả về JSON response
        return response()->json([
            'success' => true,
            'message' => 'Số lượng đã được cập nhật.',
            'totalAmount' => $totalAmount,
            'newvalueafter'=> $newvalueafter,
        ]);
    }
    
    // public function check_coupon(Request $request)
    // {
    //     $input_coupon_code = $request->input('input_coupon');
    //     if (!$input_coupon_code) {
    //         return response()->json(['message' => "Chưa nhập mã giảm giá"], 400);
    //     } else {
    //         $coupon = Coupon::where('coupon_code', $input_coupon_code)->first();
    //         if ($coupon) {
    //             Session::put('coupon', $coupon);
    //             return response()->json(['message' => "Áp dụng mã giảm giá " . $coupon->coupon_code . " thành công"], 200);
    //         } else {
    //             return response()->json(['message' => "Mã giảm giá sai hoặc đã hết hạn"], 400);
    //         }
    //     }
    // }


}
