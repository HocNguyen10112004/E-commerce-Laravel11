@extends('welcome')
@section('content')
    <section id="cart_items" class="col-sm-9">
        <div class="">
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
                        @foreach ($cartItems as $item)
                            <tr data-id="{{ $item->id }}">
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
        <div class="">
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
                            <li>Tổng<span id="ajax">{{ number_format((int) $totalAmount) . ' ' . 'VNĐ' }}</span></li>
                            <li>Thuế<span>10%</span></li>
                            <li>Phí vận chuyển<span>0</span></li>
                            <li>Thành tiền: <span id="final">{{ number_format($totalAmount * 1.1) . ' VNĐ' }}</span>
                            </li>
                        </ul>
                        {{-- <a class="btn btn-default check_out" href="/login_checkout">Check Out</a> --}}
                        @if (Session::get('customer_id') != null)
                            <a href="{{ URL::to('/checkout') }}" class="btn btn-default check_out"> Checkout</a>
                        @else
                            <a href="{{ URL::to('/login_checkout') }}" class="btn btn-default check_out">Checkout</a>
                        @endif
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
                        var currentValue = parseInt($('#ajax').text().replace(/,/g, ''),
                            10); // Chuyển đổi thành số nguyên
                        var pr = parseInt(row.find('.cart_price p').data(
                            'price')); // Lấy giá từ hàng hiện tại
                        var qt = parseInt(row.find('.cart_quantity_input')
                            .val()); // Lấy số lượng từ hàng hiện tại


                        var newValue = currentValue - pr * qt;

                        // Cập nhật lại nội dung của phần tử
                        $('#ajax').text(newValue.toLocaleString() + ' VNĐ');
                        $('#final').text((newValue * 1.1).toLocaleString() + ' VNĐ');
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
<script>
    $(document).ready(function() {
        // Khi nhấn nút tăng hoặc giảm số lượng
        $('.cart_quantity_up, .cart_quantity_down').click(function(e) {
            e.preventDefault();

            // Lấy thông tin cần thiết
            var $row = $(this).closest('tr');
            var $quantityInput = $row.find('.cart_quantity_input');
            var quantity = parseInt($quantityInput.val());
            var price = parseFloat($row.find('.cart_price p').data('price'));
            var productId = $row.data('id'); // Giả sử bạn có lưu id sản phẩm trong thẻ tr
            var action = $(this).hasClass('cart_quantity_up') ? 'increase' : 'decrease';

            // Tăng hoặc giảm số lượng dựa trên nút nhấn
            if (action === 'increase') {
                quantity += 1;
            } else if (action === 'decrease' && quantity > 1) {
                quantity -= 1;
            }

            // Cập nhật lại giá trị trong input
            $quantityInput.val(quantity);

            // Tính lại tổng tiền cho sản phẩm
            var total = price * quantity;
            $row.find('.cart_total_price').text(total.toLocaleString() + ' VNĐ');

            // Gửi AJAX để cập nhật Session Cart
            $.ajax({
                url: '/update_cart_quantity', // URL mà bạn sẽ xử lý logic cập nhật Cart trong Laravel
                method: 'POST',
                data: {
                    _token: '{{ csrf_token() }}', // Bảo mật CSRF token
                    product_id: productId,
                    quantity: quantity
                },

                success: function(response) {
                    // Cập nhật lại tổng giá trị của giỏ hàng nếu có
                    $('#ajax').text(response.totalAmount.toLocaleString() + ' VNĐ');
                    $('#final').text((response.totalAmount * 1.1).toLocaleString() +
                        ' VNĐ');
                },
                error: function(xhr) {
                    console.log(xhr.responseText); // Log lỗi nếu có
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function() {
        $('.cart_quantity_input').on('change', function(e) {
            e.preventDefault();
            var $row = $(this).closest('tr');
            var $quantityInput = $row.find('.cart_quantity_input');
            var quantity = parseInt($quantityInput.val());
            var price = parseFloat($row.find('.cart_price p').data('price'));
            var productId = $row.data('id');
            var total = price * quantity;
            $row.find('.cart_total_price').text(total.toLocaleString() + ' VNĐ');

            // Gửi AJAX để cập nhật Session Cart
            $.ajax({
                url: '/update_cart_quantity', // URL mà bạn sẽ xử lý logic cập nhật Cart trong Laravel
                method: 'POST',
                data: {
                    _token: '{{ csrf_token() }}', // Bảo mật CSRF token
                    product_id: productId,
                    quantity: quantity
                },

                success: function(response) {
                    // Cập nhật lại tổng giá trị của giỏ hàng nếu có
                    $('#ajax').text(response.totalAmount.toLocaleString() + ' VNĐ');
                    $('#final').text((response.totalAmount * 1.1).toLocaleString() +
                        ' VNĐ');
                },
                error: function(xhr) {
                    console.log(xhr.responseText); // Log lỗi nếu có
                }
            });
        });
    });
</script>
