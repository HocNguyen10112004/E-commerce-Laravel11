@extends('admin_layout')
@section('admin_content')
<div class="col-lg-12">
    <section class="panel">
        <header class="panel-heading">
            Chỉnh sửa thương hiệu sản phẩm
        </header>
        <div class="panel-body">

            <div class="position-center">
                
                <form role="form" action="{{ URL::to('/update_brand_product/'.$edit_brand_product->brand_id) }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="brand_product_name">Tên thương hiệu</label>
                        <input type="text" value="{{$edit_brand_product->brand_name}}" class="form-control" id="brand_product_name" name="brand_product_name"
                            >
                    </div>
                    <div class="form-group">
                        <label for="brand_product_desc">Mô tả thương hiệu</label>
                        <textarea style="resize: none" rows="5" class="form-control" id="brand_product_desc"
                            name="brand_product_desc">{{$edit_brand_product->brand_desc}}</textarea>
                    </div>
                    <button type="submit" name="brand_category_product" class="btn btn-info">Cập nhật thương hiệu</button>
                </form>
            </div>

        </div>
    </section>
</div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="{{ asset('backend/js/add_brand.js') }}"></script>