<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductController extends Controller
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
}
