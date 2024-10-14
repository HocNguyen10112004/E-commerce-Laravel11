@extends('welcome')
@section('content')
    <section id="cart_items" class="col-sm-9">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="{{ URL::to('/') }}">Home</a></li>
                    <li class="active">Shopping Cart</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <thead>
                        <tr class="cart_menu">
                            <td class="image">Image</td>
                            <td class="description">Product</td>
                            <td class="price">Price</td>
                            <td class="quantity">Quantity</td>
                            <td class="total">Total</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // $cartItems = Session::get('cart', collect());
                        ?>
                        @foreach ($cartItems as $item)
                            <tr id="item-{{ $item->id }}">
                                <td class="cart_product">
                                    <a href=""><img
                                            src="{{ URL::to('uploads/product/' . $item->attributes->image) }}"
                                            height="100px" width="50px"></a>

                                </td>
                                <td class="cart_description">
                                    <h4><a href="">{{ $item->name }}</a></h4>
                                    <p>ID: {{ $item->id }}</p>
                                </td>
                                <td class="cart_price">
                                    <p data-price="{{ $item->price }}">
                                        {{ number_format((int) $item->price) . ' ' . 'VNĐ' }}</p>
                                </td>
                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <a class="cart_quantity_up" href=""> + </a>
                                        <input class="cart_quantity_input" type="text" name="quantity"
                                            value="{{ $item->quantity }}" autocomplete="off" size="2">
                                        <a class="cart_quantity_down" href=""> - </a>
                                    </div>
                                </td>
                                <td class="cart_total">
                                    <p class="cart_total_price">
                                        {{ number_format((int) $item->price * $item->quantity) . ' ' . 'VNĐ' }}</p>
                                </td>
                                <td class="cart_delete">
                                    <a class="cart_quantity_delete" href="{{ URL::to('/delete_to_cart/' . $item->id) }}">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </section> <!--/#cart_items-->
    <section id="do_action" class="col-sm-9">
        <div class="container">
            <div class="heading">
                <h3>What would you like to do next?</h3>
                <p>Choose if you have a discount code or reward points you want to use or would like to estimate your
                    delivery cost.</p>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="chose_area">
                        <ul class="user_option">
                            <li>
                                <input type="checkbox">
                                <label>Use Coupon Code</label>
                            </li>
                            <li>
                                <input type="checkbox">
                                <label>Use Gift Voucher</label>
                            </li>
                            <li>
                                <input type="checkbox">
                                <label>Estimate Shipping & Taxes</label>
                            </li>
                        </ul>
                        <ul class="user_info">
                            <li class="single_field">
                                <label>Country:</label>
                                <select>
                                    <option>United States</option>
                                    <option>Bangladesh</option>
                                    <option>UK</option>
                                    <option>India</option>
                                    <option>Pakistan</option>
                                    <option>Ucrane</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select>

                            </li>
                            <li class="single_field">
                                <label>Region / State:</label>
                                <select>
                                    <option>Select</option>
                                    <option>Dhaka</option>
                                    <option>London</option>
                                    <option>Dillih</option>
                                    <option>Lahore</option>
                                    <option>Alaska</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select>

                            </li>
                            <li class="single_field zip-field">
                                <label>Zip Code:</label>
                                <input type="text">
                            </li>
                        </ul>
                        <a class="btn btn-default update" href="">Get Quotes</a>
                        <a class="btn btn-default check_out" href="">Continue</a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="total_area">
                        <ul>
                            <li>Tổng<span id="ajax">{{ $totalAmount }}</span></li>
                            <li>Thuế<span></span></li>
                            <li>Phí vận chuyển<span>Free</span></li>
                            <li>Thành tiền<span>$61</span></li>
                        </ul>
                        <a class="btn btn-default update" href="">Update</a>
                        <a class="btn btn-default check_out" href="">Check Out</a>
                    </div>
                </div>
            </div>
        </div>
    </section><!--/#do_action-->
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).on('click', '.cart_quantity_delete', function(e) {
        e.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

        var deleteUrl = $(this).attr('href'); // Lấy URL từ thuộc tính href
        var row = $(this).closest('tr'); // Lấy hàng của sản phẩm cần xóa

        // Hiển thị hộp thoại xác nhận
        if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
            $.ajax({
                url: deleteUrl,
                type: 'GET',
                success: function(response) {
                    if (response.success) {
                        // Xóa hàng trực tiếp từ DOM
                        row.remove(); // Xóa hàng khỏi bảng
                        var currentValue = parseInt($('#ajax').text(),
                            10); // Chuyển đổi thành số nguyên
                        var pr = parseInt(row.find('.cart_price p').data(
                        'price')); // Lấy giá từ hàng hiện tại
                        var qt = parseInt(row.find('.cart_quantity_input')
                    .val()); // Lấy số lượng từ hàng hiện tại


                        var newValue = currentValue - pr * qt; // Trừ 100

                        // Cập nhật lại nội dung của phần tử
                        $('#ajax').text(newValue);
                        alert(response.message); // Hiển thị thông báo thành công
                    } else {
                        alert('Có lỗi xảy ra: ' + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    alert('Có lỗi xảy ra: ' + xhr.responseText);
                }
            });
        }
    });
</script>
