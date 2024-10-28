<?php

namespace App\Http\Controllers;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\BrandProduct; // Thêm model ở đây
use App\Models\CategoryProduct; // Thêm model ở đây
use App\Models\Product;

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
        if ($newStatus == 0) {
            // Nếu trạng thái danh mục là 0 (ẩn), ẩn tất cả sản phẩm
            Product::where('brand_id', $brand_id)->update(['product_status' => 0]);}
        return response()->json(['success' => true]);
    }

    public function delete_brand_product($brand_id) 
    {
        $brand = BrandProduct::find($brand_id);
        if ($brand->products()->count() > 0) {
            Session::put("message", "Cannot delete category with existing products.");
            return redirect()->back();
        }
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
    public function show_brand_home($brand_id)
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $brand_by_id = Product::whereHas('brand', function ($query) use ($brand_id) {
            $query->where('brand_id', $brand_id);})->with('brand')->where('product_status', '1')->get();
        $brand_name=BrandProduct::where('brand_id',$brand_id)->first();
        return view("pages.brand.show_brand")->with('category', $category_product)
                                                        ->with('brand', $brand_product)
                                                        ->with('brand_by_id', $brand_by_id)
                                                        ->with( 'brand_name', $brand_name);
    }
}

