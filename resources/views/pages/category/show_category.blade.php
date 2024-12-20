@extends('welcome')
@section('content')
    <div class="col-sm-9 padding-right">
        <div class="features_items"><!--features_items-->
            <br>
            <h2 class="title text-center">Danh mục sản phẩm {{ $category_name->category_name }}</h2>
            @foreach ($category_by_id as $item)
                <a href="{{ URL::to('/chi_tiet_san_pham/' . $item->product_id) }}">
                    <div class="col-sm-4 itemfinder">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <div style="height: 250px; overflow: hidden; align-items: flex-end;">
                                        <img src="{{ URL::to('uploads/product/' . $item->product_image) }}" class="img-fluid mx-auto" alt="" />
                                    </div>
                                    <form class="add-to-cart-form" action="{{ URL::to('/save_cart') }}", method="POST">
                                        @csrf
                                        <span>
                                            <h2>{{ number_format((int) $item->product_price) . ' ' . 'VNĐ' }}</h2>
                                            <p style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis;">{{ $item->product_name }}</p>
                                            <input name="qty" type="hidden" value="1" />
                                            <input name="product_id_hidden" type="hidden"
                                                value="{{ $item->product_id }}" />
                                            <button type="submit" class="btn btn-fefault cart">
                                                <i class="fa fa-shopping-cart"></i>
                                                Add to cart
                                            </button>
                                        </span>
                                    </form>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('.add-to-cart-form').on('submit', function(event) {
            event.preventDefault(); // Ngăn chặn hành động mặc định của form

            $.ajax({
                type: 'POST',
                url: $(this).attr('action'),
                data: $(this).serialize(), // Gửi tất cả dữ liệu trong form
                success: function(response) {
                    // Hiển thị thông báo thành công bằng SweetAlert
                    swal("Thành công!", "Thêm thương hiệu thành công!", "success");
                },
                error: function(xhr) {
                    // Hiển thị thông báo lỗi
                    swal("Lỗi!", "Có lỗi xảy ra, vui lòng thử lại.", "error");
                }
            });
        });
    });
</script>
