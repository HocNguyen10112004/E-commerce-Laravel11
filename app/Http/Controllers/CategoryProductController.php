<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;

class CategoryProductController extends Controller
{
    public function add_category_product()
    {
        return view("admin.add_category_product");
    }
    public function all_category_product()
    {
        $all_category_product = DB::table('tbl_category_product')->get(); 
        return view('admin.all_category_product')->with('all_category_product', $all_category_product);
    }
    public function save_category_product(Request $request)
    {
        $data=array();
        $data["category_name"]=$request->input("category_product_name");
        $data["category_desc"]=$request->input("category_product_desc");
        $data["category_status"]=$request->input("category_product_status");
        DB::table("tbl_category_product")->insert($data);
        Session::put("message","Thêm danh mục sản phẩm thành công");
        return Redirect::to("add_category_product");
    }
    public function active_category_product(Request $request, $category_id)
    {
    // Lấy trạng thái mới từ yêu cầu
        $newStatus = $request->input('category_status');

    // Cập nhật trạng thái trong cơ sở dữ liệu
        DB::table("tbl_category_product")
            ->where("category_id", $category_id)
            ->update(["category_status" => $newStatus]);

    // Trả về phản hồi JSON cho AJAX
        return response()->json(['success' => true]);
    }

}
