@extends('admin_layout')
@section('admin_content')
<div class="col-lg-12">
    <section class="panel">
        <header class="panel-heading">
            Cập nhật sản phẩm
        </header>
        <div class="panel-body">

            <div class="position-center">
                
                <form role="form" id="product-form" role="form" method="POST" action="{{ URL::to('/update_product/'.$edit_product->product_id) }}" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label for="product_name">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="product_name" name="product_name" value="{{ $edit_product->product_name }}">
                    </div>
                    <div class="form-group">
                        <label for="product_price">Giá sản phẩm</label>
                        <input type="text" class="form-control" id="product_price" name="product_price" value="{{ $edit_product->product_price }}"
                            placeholder="Enter price of product">
                    </div>
                    <div class="form-group">
                        <label for="product_image">Hình ảnh sản phẩm</label>
                        <input type="file" class="form-control" id="product_image" name="product_image"
                            placeholder="Enter image of product">
                        <img src="{{ asset('uploads/product/' . $edit_product->product_image)}}" height="100px" width="100px" alt="">
                    </div>
                    <div class="form-group">
                        <label for="product_desc">Mô tả sản phẩm</label>
                        <textarea style="resize: none" rows="5" class="form-control" id="product_desc" 
                            name="product_desc" placeholder="Description of product">{{ $edit_product->product_desc }}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="product_content">Nội dung sản phẩm</label>
                        <textarea style="resize: none" rows="5" class="form-control" id="product_content" 
                            name="product_content" placeholder="Content of product">{{ $edit_product->product_content }}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="product_category">Danh mục sản phẩm</label>
                        <select name="product_category" class="form-control input-sm m-bot15">
                            @foreach($category_product as $item)
                                @if($item->category_id==$edit_product->category_id)
                                    <option selected value="{{$item->category_id}}">{{$item->category_name}}</option>
                                @else
                                    <option value="{{$item->category_id}}">{{$item->category_name}}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="product_brand">Thương hiệu sản phẩm</label>
                        <select name="product_brand" class="form-control input-sm m-bot15">
                            @foreach($brand_product as $item)
                                @if($item->brand_id==$edit_product->brand_id)
                                    <option selected value="{{$item->brand_id}}">{{$item->brand_name}}</option>
                                @else
                                    <option value="{{$item->brand_id}}">{{$item->brand_name}}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>
                    
                    <button type="submit" name="add_product" class="btn btn-info">Cập nhật sản phẩm</button>
                </form>
            </div>

        </div>
    </section>
</div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
