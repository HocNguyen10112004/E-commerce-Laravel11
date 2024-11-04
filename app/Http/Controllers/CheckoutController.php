<?php

namespace App\Http\Controllers;
use App\Mail\PasswordEmail;
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
use App\Models\Coupon;
use App\Models\Location;
use Darryldecode\Cart\Facades\CartFacade as Cart; // Sử dụng Facade
use Barryvdh\DomPDF\Facade\Pdf;
use App\Mail\OrderConfirmationEmail;
use Illuminate\Support\Facades\Mail;
use Str;
use Illuminate\Support\Facades\Http;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
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
        $existingCustomer = Customer::where('customer_email', $request['customer_email'])->first();
        $existingCustomer1 = Customer::where('customer_phone', $request['customer_phone'])->first();
        if ($existingCustomer or $existingCustomer1) {
            Session::put('error','Email hoặc số điện thoại đã tồn tại!');
            return Redirect::back();
        }
        // Tạo mật khẩu ngẫu nhiên
        $randomPassword = Str::random(10);
        $inserted = Customer::create([
            'customer_name' => $request['customer_name'],
            'customer_email' => $request['customer_email'],
            'customer_password' => $randomPassword,
            'customer_phone' => $request['customer_phone'],
        ]);
        Mail::to($inserted->customer_email)->send(new PasswordEmail($randomPassword));
        return Redirect::back();
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
            return Redirect::to('/');
        } 
        else 
        {
            Session::put('wrongacc','Tài khoản hoặc mật khẩu sai!');
            return Redirect::to('/login_checkout');
        }
    }
    public function order_place(Request $request)
    {
        $coupon = Session::get('coupon');
        if(!$coupon)
        {
            $latitude = $request->input('latitude');
            $shipping_id = Session::get('shipping_id');
            $longitude = $request->input('longitude');
            $distance = $request->input('distance');
            $inserted_payment = Payment::create([
                'payment_method' => $request['payment_option'],
                'payment_status' => "1",
                
            ]);
            $inserted_order = Order::create([
                'customer_id' => Session::get('customer_id'),
                'shipping_id' => Session::get('shipping_id'),
                'payment_id' => $inserted_payment->payment_id,
                'order_feeshipping' => round($distance)*1000,
                'order_total' => Cart::getTotal()*1.1,
                'order_status' => 'Đang chờ xác nhận'
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
            
            Location::create([
                'shipping_id' => $shipping_id,
                'latitude' => $latitude,
                'longitude' => $longitude,
                'distance' => $distance
            ]);
        }
        else
        {
            $inserted_payment = Payment::create([
                'payment_method' => $request['payment_option'],
                'payment_status' => "1",
                
            ]);
            $latitude = $request->input('latitude');
            $shipping_id = Session::get('shipping_id');
            $longitude = $request->input('longitude');
            $distance = $request->input('distance');
            if($coupon->coupon_desc == 0)
            {
                $cartTotal = Cart::getTotal()*1.1 - $coupon->coupon_value;
            }
            else
            {
                $cartTotal = Cart::getTotal()*1.1*(100 - $coupon->coupon_value)/100;
            }
            $inserted_order = Order::create([
                'customer_id' => Session::get('customer_id'),
                'shipping_id' => Session::get('shipping_id'),
                'payment_id' => $inserted_payment->payment_id,
                'order_feeshipping' => round($distance)*1000,
                'order_total' => $cartTotal,
                'order_status' => 'Đang chờ xác nhận'
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
            Coupon::where('coupon_id', $coupon->coupon_id)->decrement('coupon_number');
            
            Location::create([
                'shipping_id' => $shipping_id,
                'latitude' => $latitude,
                'longitude' => $longitude,
                'distance' => $distance
            ]);
        }
        // Gửi email xác nhận cho người dùng
        $customer_id = Session::get('customer_id');
        $customer = Customer::find($customer_id);
        Mail::to($customer->customer_email)->send(new OrderConfirmationEmail());
        Session::forget('coupon');
        Session::forget('shipping_id');
        Session::forget('cart');
        Cart::clear();
        Session::put('success1', 'Đặt hàng thành công! Cảm ơn bạn đã mua hàng.');
        return Redirect::to('/payment');
    }
    public function manage_order()
    {
        $all_order = Order::with(['customer','shipping', 'payment'])->get();
        return view("admin.manage_order")->with("all_order", $all_order);
    }
    public function delete_order($order_id) 
    {
        $delete = Order::find( $order_id );
        OrderDetails::where('order_id', $order_id)->delete();
        Location::where('shipping_id', $delete->shipping_id)->delete();
        Order::destroy($order_id);
        Shipping::destroy($delete->shipping_id);
        Payment::destroy($delete->payment_id);
        Session::put("message", "Xóa đơn hàng thành công");
        return Redirect::to("manage_order");
    }
    public function view_order($order_id)
    {
        $order = Order::with(["shipping","customer", "payment"])->find($order_id);
        $collection = OrderDetails::with("product")->where("order_id", $order_id)->get();
        return view("admin.view_order")->with("order", $order)->with("collection", $collection);

    }
    public function save_pdf($order_id)
    {
        // Lấy thông tin đơn hàng cùng các thông tin liên quan
        $order = Order::with(["shipping", "customer", "payment"])->find($order_id);
        $collection = OrderDetails::with("product")->where("order_id", $order_id)->get();
        
        // Kiểm tra nếu không tìm thấy đơn hàng
        if (!$order) {
            abort(404);
        }

        // Chỉ render phần nội dung của view_order
        $html = view('admin.view_order_pdf', compact('order', 'collection'))->render();

        // Tạo PDF từ HTML
        $pdf = Pdf::loadHTML($html);

        // Tải xuống PDF
        return $pdf->download('view_order_' . $order_id . '.pdf');
    }
    public function reset_password()
    {
        
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        return view('pages.checkout.reset_password')->with('category', $category_product)
                                                ->with('brand', $brand_product);
    }
    public function resend_password(Request $request)
    {
        $customer_email = $request->input('email');
        $customer = Customer::where('customer_email', $customer_email)->first();
        if (!$customer) {
           
            return response()->json(['success'=>false]);
        }
        $randomPassword = Str::random(10);
        Customer::where('customer_email', $customer_email)->update(['customer_password'=> $randomPassword]);
        Mail::to($customer_email)->send(new PasswordEmail($randomPassword));
        return response()->json(['success' => true]);
    }
    public function history_order()
    {
        $customer_id = Session::get('customer_id');
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $all_order = Order::with(['customer','shipping', 'payment'])->where('customer_id', $customer_id)->orderBy('order_id','desc')->get();
        // Lấy chi tiết đơn hàng cho tất cả các order_id trong $all_order
        $order_ids = $all_order->pluck('order_id'); // Lấy tất cả order_id vào một collection
        $order_details = OrderDetails::with('product')
            ->whereIn('order_id', $order_ids)
            ->get();

        // Nhóm các chi tiết theo order_id
        $grouped_details = $order_details->groupBy('order_id');
        return view("pages.checkout.history_order")->with('category', $category_product)
                                                ->with('brand', $brand_product)
                                                ->with("all_order", $all_order)
                                                ->with("grouped_details", $grouped_details);
    }
    public function delete_order_customer($order_id) 
    {
        $delete = Order::find( $order_id );
        if($delete->order_status == "Đã xác nhận")
        {
            return Redirect::back()->with("error","Đơn hàng đang được vận chuyển, không thể xóa!");
        }
        OrderDetails::where('order_id', $order_id)->delete();
        Location::where('shipping_id', $delete->shipping_id)->delete();
        Order::destroy($order_id);
        Shipping::destroy($delete->shipping_id);
        Payment::destroy($delete->payment_id);
        return response()->json(['success' => true]);
    }
    public function verify_order($order_id)
    {
        $order = Order::find($order_id);
        
        if (!$order) {
            return response()->json(['success' => false, 'message' => 'Đơn hàng không tồn tại.']);
        }

        if($order->order_status == "Đang chờ xác nhận")
        {
            Order::where("order_id", $order_id)->update(["order_status"=> "Đã xác nhận"]);
        }
        else if($order->order_status == "Đã xác nhận")
        {
            Order::where("order_id", $order_id)->update(["order_status"=> "Đã giao hàng"]);
        }
        else
        {
            Order::where("order_id", $order_id)->update(["order_status"=> "Đang chờ xác nhận"]);
        }
        $order->refresh(); // Tải lại thông tin từ cơ sở dữ liệu
        return response()->json(['success' => true, 'new_status' => $order->order_status]);
    }
}
