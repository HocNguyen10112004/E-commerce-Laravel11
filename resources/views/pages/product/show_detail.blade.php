@extends('welcome')
@section('content')
    <div class="product-details"><!--product-details-->
        <div class="col-sm-5">
            <div class="view-product">
                <img src="{{ URL::to('uploads/product/' . $product->product_image) }}" alt="" />
                <h3>ZOOM</h3>
            </div>
            <div id="similar-product" class="carousel slide" data-ride="carousel">

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
                    </div>
                    <div class="item">
                        <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
                    </div>
                    <div class="item">
                        <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
                        <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
                    </div>

                </div>
                <br>

                <!-- Controls -->
                <a class="left item-control" href="#similar-product" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="right item-control" href="#similar-product" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>

        </div>
        <div class="col-sm-7">
            <div class="product-information"><!--/product-information-->
                <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                <h2>{{ $product->product_name }}</h2>
                <p>Mã sản phẩm {{ $product->product_id }}</p>
                <img src="images/product-details/rating.png" alt="" />

                <form id="add-to-cart-form" action="{{ URL::to('/save_cart') }}" method="POST">
                    @csrf
                    <span>
                        <span>{{ number_format((int) $product->product_price) . ' ' . 'VNĐ' }}</span>
                        <label>Quantity:</label>
                        <input name="qty" type="number" min="1" value="1" />
                        <input name="product_id_hidden" type="hidden" value="{{ $product->product_id }}" />
                        <button type="submit" class="btn btn-fefault cart">
                            <i class="fa fa-shopping-cart"></i>
                            Add to cart
                        </button>
                    </span>
                </form>
                <div id="alert" class="alert" style="display: none;"></div>

                <p><b>Tình trạng:</b>Còn Hàng</p>
                <p><b>Điều kiện:</b>100%</p>
                <p><b>Thương hiệu:</b>{{ $product->brand->brand_name }}</p>
                <p><b>Danh mục:</b>{{ $product->category->category_name }}</p>
                <a href=""><img src="images/product-details/share.png" class="share img-responsive"
                        alt="" /></a>
            </div><!--/product-information-->
        </div>
    </div><!--/product-details-->
    <div class="category-tab shop-details-tab"><!--category-tab-->
        <div class="col-sm-12">
            <ul class="nav nav-tabs">
                <li><a href="#details" data-toggle="tab">Mô tả</a></li>
                <li><a href="#companyprofile" data-toggle="tab">Chi tiết sản phẩm</a></li>
                <li class="active"><a href="#reviews" data-toggle="tab">Reviews</a></li>
            </ul>
        </div>
        <div class="tab-content">
            <div class="tab-pane fade" id="details">
                <p>{!! nl2br(e($product->product_content)) !!}</p>
            </div>

            <div class="tab-pane fade" id="companyprofile">
                <p>{!! nl2br(e($product->product_desc)) !!}</p>
            </div>

            

            <div class="tab-pane fade" id="tag">
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery1.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i
                                        class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery2.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i
                                        class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery3.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i
                                        class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/home/gallery4.jpg" alt="" />
                                <h2>$56</h2>
                                <p>Easy Polo Black Edition</p>
                                <button type="button" class="btn btn-default add-to-cart"><i
                                        class="fa fa-shopping-cart"></i>Add to cart</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade active in" id="reviews">
                <div class="col-sm-12">
                    <p><b>Write Your Review</b></p>
                    <form action="{{ URL::to('/add_review/' . $product->product_id) }}" method="POST">
                        @csrf
                        <textarea style="height: 10%" name="review_content" placeholder="review"></textarea>
                        {{-- <b>Rating: </b> <img src="images/product-details/rating.png" alt="" /> --}}
                        <button type="submit" class="btn btn-default pull-right">
                            Submit
                        </button>
                    </form>
                    <br>
                    <br>
                </div>
                <div class="scroll-view"
                    style="max-height: 300px; overflow-y: auto; border: 1px solid #ddd;padding: 10px; background-color: #f9f9f9">
                    @foreach ($reviews_product as $item)
                        <div class="review mb-3 border rounded p-3 bg-light">
                            <h5 class="card-title mb-1" style="color: orange">
                                {{ $item->customer->customer_name }}
                            </h5>
                            <p class="card-text mb-0">{{ $item->review_content }}</p>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div><!--/category-tab-->
    <div class="recommended_items"><!--recommended_items-->
        <h2 class="title text-center">recommended items</h2>

        <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                {{-- class="item active" --}}
                @foreach ($related_products as $item)
                    <a href="{{ URL::to('/chi_tiet_san_pham/' . $item->product_id) }}">
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="{{ URL::to('uploads/product/' . $item->product_image) }}" height="300px"
                                        width="100px" alt="" />
                                    <h2>{{ number_format((int) $item->product_price) . ' ' . 'VNĐ' }}</h2>
                                    <p>{{ $item->product_name }}</p>
                                    <!-- <button type="button" class="btn btn-default add-to-cart"><i
                                            class="fa fa-shopping-cart"></i>Add to cart</button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    </a>
                @endforeach

            </div>
            <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>
        </div>
    </div><!--/recommended_items-->
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#add-to-cart-form').on('submit', function(event) {
            event.preventDefault(); // Ngăn chặn hành động mặc định của form

            $.ajax({
                type: 'POST',
                url: $(this).attr('action'),
                data: $(this).serialize(), // Gửi tất cả dữ liệu trong form
                success: function(response) {
                    // Hiển thị thông báo thành công
                    $('#alert').text('Sản phẩm đã được thêm vào giỏ hàng!').css(
                        'background-color', '#4CAF50').fadeIn().delay(3000).fadeOut();
                },
                error: function(xhr) {
                    // Xử lý lỗi
                    $('#alert').text('Có lỗi xảy ra, vui lòng thử lại.').css(
                        'background-color', '#f44336').fadeIn().delay(3000).fadeOut();
                }
            });
        });
    });
</script>
