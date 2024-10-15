@extends('welcome')
@section('content')
    <div class="col-sm-9 padding-right">
        <div class="features_items"><!--features_items-->
            <br>
            <h2 class="title text-center">Danh mục sản phẩm {{ $category_name->category_name }}</h2>
            @foreach ($category_by_id as $item)
                <a href="{{ URL::to('/chi_tiet_san_pham/' . $item->product_id) }}">
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="{{ URL::to('uploads/product/' . $item->product_image) }}" height="300px"
                                        width="100px" alt="" />
                                    <h2>{{ number_format((int) $item->product_price) . ' ' . 'VNĐ' }}</h2>
                                    <p>{{ $item->product_name }}</p>

                                    <a href="#" class="btn btn-default add-to-cart">
                                        <i class="fa fa-shopping-cart"></i>Add to cart
                                    </a>

                                </div>
                            </div>
                            <div class="choose">
                                <ul class="nav nav-pills nav-justified">
                                    <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                    <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </a>
            @endforeach

        </div><!--features_items-->
    </div>
@endsection
