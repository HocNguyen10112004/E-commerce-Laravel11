@extends('admin_layout')
@section('admin_content')
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Thêm thương hiệu sản phẩm
            </header>
            <div class="panel-body">

                <div class="position-center">

                    <form role="form" id="brand-form">
                        @csrf
                        <div class="form-group">
                            <label for="brand_product_name">Tên thương hiệu</label>
                            <input type="text" class="form-control" id="brand_product_name" name="brand_product_name"
                                placeholder="Enter name of brand">
                        </div>
                        <div class="form-group">
                            <label for="brand_product_desc">Mô tả thương hiệu</label>
                            <textarea style="resize: none" rows="5" class="form-control" id="brand_product_desc" name="brand_product_desc"
                                placeholder="Description of brand"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="brand_product_status">Trạng thái hiển thị</label>
                            <select name="brand_product_status" class="form-control input-sm m-bot15">
                                <option value="0">Ẩn</option>
                                <option value="1">Hiển Thị</option>
                            </select>
                        </div>
                        <button type="submit" name="add_brand_product" class="btn btn-info">Thêm thương hiệu</button>
                    </form>
                </div>

            </div>
        </section>
    </div>
@endsection

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="{{ asset('backend/js/add_brand.js') }}"></script>
