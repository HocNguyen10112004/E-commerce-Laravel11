@extends('admin_layout')
@section('admin_content')
<div class="col-lg-12">
    <section class="panel">
        <header class="panel-heading">
            Chỉnh sửa danh mục sản phẩm
        </header>
        <div class="panel-body">

            <div class="position-center">
                
                <form role="form" action="{{ URL::to('/update_category_product/'.$edit_category_product->category_id) }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="category_product_name">Tên danh mục</label>
                        <input type="text" value="{{$edit_category_product->category_name}}" class="form-control" id="category_product_name" name="category_product_name"
                            >
                    </div>
                    <div class="form-group">
                        <label for="category_product_desc">Mô tả danh mục</label>
                        <textarea style="resize: none" rows="5" class="form-control" id="category_product_desc"
                            name="category_product_desc">{{$edit_category_product->category_desc}}</textarea>
                    </div>
                    <button type="submit" name="add_category_product" class="btn btn-info">Cập nhật danh mục</button>
                </form>
            </div>

        </div>
    </section>
</div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="{{ asset('backend/js/add_product.js') }}"></script>