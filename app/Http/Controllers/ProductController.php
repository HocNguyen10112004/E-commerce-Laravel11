<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\Product; // Thêm model ở đây
use App\Models\CategoryProduct;
use App\Models\BrandProduct;
class ProductController extends Controller
{
    public function add_product()
    {
        $category_product = CategoryProduct::orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::orderBy('brand_id', 'desc')->get();
        return view('admin.add_product')->with('category_product', $category_product)->with('brand_product', $brand_product);
    }

    public function all_product()
    {
        $all_product = Product::with(['brand', 'category'])->get();

        return view('admin.all_product')->with('all_product', $all_product);
    }

    public function save_product(Request $request)
    {
        $get_image = $request->file('product_image');
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image = $name_image.rand(0, 99) . '.'.$get_image->getClientOriginalExtension();
            $get_image->move('uploads/product',$new_image);
        }
        else{
            $new_image='';
        }
        $inserted = Product::create([
            'product_name' => $request->input("product_name"),
            'product_price' => $request->input("product_price"),
            'category_id' => $request->input("product_category"),
            'brand_id' => $request->input("product_brand"),
            'product_content' => $request->input("product_content"),
            'product_desc' => $request->input("product_desc"),
            'product_status' => $request->input("product_status"),
            'product_image' => $new_image
        ]);
        if ($inserted) {
            return response()->json(['success' => true]);
        } else {
            return response()->json(['success' => false]);
        }
    }

    public function active_product(Request $request, $product_id)
    {
        $newStatus = $request->input('product_status');
        
        $product = Product::find($product_id);
        $product->product_status = $newStatus;
        $product->save();

        return response()->json(['success' => true]);
    }

    public function delete_product($product_id) 
    {
        $deleted = Product::destroy($product_id);
        Session::put("message", "Xóa sản phẩm thành công");
        return redirect("all_product");
    }

    public function edit_product($product_id)
    {
        $category_product = CategoryProduct::orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::orderBy('brand_id', 'desc')->get();
        $edit_product = Product::find($product_id);
        return view('admin.edit_product')->with('edit_product', $edit_product)->with('category_product', $category_product)->with('brand_product', $brand_product);
    }

    public function update_product(Request $request, $product_id)
    {
        $data=array();
        $get_image = $request->file('product_image');
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image = $name_image.rand(0, 99) . '.'.$get_image->getClientOriginalExtension();
            $get_image->move('uploads/product',$new_image);
            $data['product_image'] = $new_image;
        }
        $data['product_name']=$request->input("product_name");
        $data['product_price'] = $request->input("product_price");
        $data['category_id'] = $request->input("product_category");
        $data['brand_id'] = $request->input("product_brand");
        $data['product_content'] = $request->input("product_content");
        $data['product_desc'] = $request->input("product_desc");
        
        
        $product = Product::find($product_id);
        $product->update($data);

        Session::put("message", "Cập nhật sản phẩm thành công");
        return redirect("all_product");
    }
    public function detail_product($product_id)
    {
        $category_product = CategoryProduct::where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = BrandProduct::where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
        $product = Product::with(['brand','category'])->where('product_id', $product_id)->where('product_status', '1')->first();
        $related_products=Product::with(['brand','category'])->where('brand_id',$product->brand_id)->where('category_id',$product->category_id)->where('product_status', '1')->whereNotIn('product_id', [$product->product_id])->orderBy('product_id', 'desc')->get();
        return view("pages.product.show_detail")  ->with('category', $category_product)
                                                        ->with('brand', $brand_product)
                                                        ->with('product', $product)
                                                        ->with('related_products', $related_products);
    }
}
