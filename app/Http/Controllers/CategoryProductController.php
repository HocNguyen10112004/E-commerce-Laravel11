<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\CategoryProduct; // Thêm model ở đây
use App\Models\BrandProduct;
use App\Models\Product;
class CategoryProductController extends Controller
{
    public function add_category_product()
    {
        return view("admin.add_category_product");
    }

    public function all_category_product()
    {
        $all_category_product = CategoryProduct::all(); // Sử dụng Model để lấy tất cả dữ liệu
        return view('admin.all_category_product')->with('all_category_product', $all_category_product);
    }

    public function save_category_product(Request $request)
    {
        $data = $request->only('category_product_name', 'category_product_desc', 'category_product_status');

        $inserted = CategoryProduct::create([
            'category_name' => $data['category_product_name'],
            'category_desc' => $data['category_product_desc'],
            'category_status' => $data['category_product_status']
        ]);

        if ($inserted) {
            return response()->json(['success' => true]);
        } else {
            return response()->json(['success' => false]);
        }
    }

    public function active_category_product(Request $request, $category_id)
    {
        $newStatus = $request->input('category_status');
        
        $category = CategoryProduct::find($category_id);
        $category->category_status = $newStatus;
        $category->save();

        return response()->json(['success' => true]);
    }

    public function delete_category_product($category_id) 
    {
        $deleted = CategoryProduct::destroy($category_id);
        Session::put("message", "Xóa danh mục sản phẩm thành công");
        return redirect("all_category_product");
    }

    public function edit_category_product($category_id)
    {
        $edit_category_product = CategoryProduct::find($category_id);
        return view('admin.edit_category_product')->with('edit_category_product', $edit_category_product);
    }

    public function update_category_product(Request $request, $category_id)
    {

        // $data = $request->only('category_product_name', 'category_product_desc');
        $data=array();
        $data["category_name"]=$request->input("category_product_name");
        $data["category_desc"]=$request->input("category_product_desc");
        $category = CategoryProduct::find($category_id);
        $category->update($data);

        Session::put("message", "Cập nhật danh mục sản phẩm thành công");
        return redirect("all_category_product");
    }
    //End Admin
    public function show_category_home($category_id)
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $category_by_id = Product::whereHas('category', function ($query) use ($category_id) {
            $query->where('category_id', $category_id);})->with('category')->get();
        $catgory_name=CategoryProduct::where('category_id',$category_id)->first();
        return view("pages.category.show_category")->with('category', $category_product)
                                                        ->with('brand', $brand_product)
                                                        ->with('category_by_id', $category_by_id)
                                                        ->with('category_name', $catgory_name);

    }
}