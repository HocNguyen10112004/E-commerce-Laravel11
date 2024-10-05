<?php

namespace App\Http\Controllers;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\BrandProduct; // Thêm model ở đây

class BrandProductController extends Controller
{
    public function add_brand_product()
    {
        return view("admin.add_brand_product");
    }

    public function all_brand_product()
    {
        $all_brand_product = BrandProduct::all(); // Sử dụng Model để lấy tất cả dữ liệu
        return view('admin.all_brand_product')->with('all_brand_product', $all_brand_product);
    }

    public function save_brand_product(Request $request)
    {
        $data = $request->only('brand_product_name', 'brand_product_desc', 'brand_product_status');

        $inserted = BrandProduct::create([
            'brand_name' => $data['brand_product_name'],
            'brand_desc' => $data['brand_product_desc'],
            'brand_status' => $data['brand_product_status']
        ]);

        if ($inserted) {
            return response()->json(['success' => true]);
        } else {
            return response()->json(['success' => false]);
        }
    }

    public function active_brand_product(Request $request, $brand_id)
    {
        $newStatus = $request->input('brand_status');
        
        $brand = BrandProduct::find($brand_id);
        $brand->brand_status = $newStatus;
        $brand->save();

        return response()->json(['success' => true]);
    }

    public function delete_brand_product($brand_id) 
    {
        $deleted = BrandProduct::destroy($brand_id);
        Session::put("message", "Xóa thương hiệu sản phẩm thành công");
        return redirect("all_brand_product");
    }

    public function edit_brand_product($brand_id)
    {
        $edit_brand_product = BrandProduct::find($brand_id);
        return view('admin.edit_brand_product')->with('edit_brand_product', $edit_brand_product);
    }

    public function update_brand_product(Request $request, $brand_id)
    {

        // $data = $request->only('category_product_name', 'category_product_desc');
        $data=array();
        $data["brand_name"]=$request->input("brand_product_name");
        $data["brand_desc"]=$request->input("brand_product_desc");
        $brand = BrandProduct::find($brand_id);
        $brand->update($data);

        Session::put("message", "Cập nhật thương hiệu sản phẩm thành công");
        return redirect("all_brand_product");
    }
}

