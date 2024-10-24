<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\Product; // Thêm model ở đây
use App\Models\CategoryProduct;
use App\Models\BrandProduct;
use App\Models\Customer;
use App\Models\Shipping;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\Payment;
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
    public function add_customer(Request $request)
    {
        $inserted = Customer::create([
            'customer_name' => $request['customer_name'],
            'customer_email' => $request['customer_email'],
            'customer_password' => $request['customer_password'],
            'customer_phone' => $request['customer_phone'],
        ]);
        $customer_id = $inserted->customer_id;
        Session::put('customer_id', $customer_id);
        Session::put('customer_name', $request['customer_name']);
        return Redirect::to('/checkout');
    }
    public function checkout()
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        return view('pages.checkout.checkout')->with('category', $category_product)
                                                ->with('brand', $brand_product);;
    }
    public function save_checkout_customer(Request $request)
    {
        $inserted = Shipping::create([
            'customer_id' => Session::get('customer_id'),
            'shipping_name' => $request['shipping_name'],
            'shipping_phone' => $request['shipping_phone'],
            'shipping_email' => $request['shipping_email'],
            'shipping_address' => $request['shipping_address'],
            'shipping_notes' => $request['shipping_notes']
        ]);
        $shipping_id = $inserted->shipping_id;
        Session::put('shipping_id', $shipping_id);
        return Redirect::to('/payment');
    }
    public function payment()
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $cartItems = Cart::getContent();

        return view('pages.checkout.payment')->with('category', $category_product)
                                                ->with('brand', $brand_product)
                                                ->with('cartItems', $cartItems);
    }
    public function logout_checkout()
    {
        Cart::clear();
        Session::flush();
        return Redirect::to('/login_checkout');
    }
    public function login_customer(Request $request)
    {
        $email= $request->input('email');
        $password= $request->input('password');
        $user = Customer::where('customer_email', $email)->where('customer_password', $password)->first();
        if ($user) 
        {
            Session::put('customer_id', $user->customer_id);
            return Redirect::to('/checkout');
        } 
        else 
        {
            return Redirect::to('/login_checkout');
        }
    }
    public function order_place(Request $request)
    {
        $inserted_payment = Payment::create([
            'payment_method' => $request['payment_option'],
            'payment_status' => "1",
            
        ]);
        $inserted_order = Order::create([
            'customer_id' => Session::get('customer_id'),
            'shipping_id' => Session::get('shipping_id'),
            'payment_id' => $inserted_payment->payment_id,
            'order_total' => Cart::getTotal()*1.1,
            'order_status' => '1'
        ]);
        $cartItems = Session::get('cart', collect());
        foreach ($cartItems as $cartItem)
        {
            OrderDetails::create([
                "order_id"=> $inserted_order->order_id,
                "product_id" => $cartItem->id,
                'product_sales_quantity' => $cartItem->quantity
            ]);
        }
        Session::put('success', 'Đặt hàng thành công! Cảm ơn bạn đã mua hàng.');
        Cart::clear();
        return Redirect::to('/payment');
    }
}
