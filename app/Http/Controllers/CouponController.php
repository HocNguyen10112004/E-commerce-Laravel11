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
use App\Models\Coupon;
class CouponController extends Controller
{
    public function insert_coupon()
    {
        return view("admin.coupon.insert_coupon");
    }
    public function insert_coupon_code(Request $request)
    {
        $inserted = Coupon::create([
            'coupon_name' => $request['coupon_name'],
            'coupon_code' => $request['coupon_code'],
            'coupon_number' => $request['coupon_number'],
            'coupon_desc' => $request['coupon_desc'],
            'coupon_value'=> $request['coupon_value'],
        ]);
        if ($inserted) {
            return response()->json(['success' => true]);
        } else {
            return response()->json(['success' => false]);
        }
    }
    public function list_coupon()
    {
        $coupons = Coupon::orderBy('coupon_id','desc')->get();
        return view('admin.coupon.list_coupon')->with('coupons', $coupons);
    }
    public function delete_coupon($coupon_id)
    {
        Coupon::destroy($coupon_id);
        Session::put('message', 'Xoá mã giảm giá');
        return Redirect::back();
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
            $coupon = Coupon::where('coupon_code', $input_coupon_code)->where('coupon_number', '>', 0)->first();
            if($coupon)
            {
                Session::put('coupon', $coupon);
                Session::put('coupon_apply', "Áp dụng mã giảm giá " . $coupon->coupon_code . " thành công");
            }
            else
            {
                Session::put('coupon_apply', "Mã giảm giá sai hoặc đã hết hạn");
            }
        }
        return Redirect::back();
    }
}
