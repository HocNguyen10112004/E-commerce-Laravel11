@extends('admin_layout')
@section('admin_content')
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Thêm mã giảm giá
            </header>
            <div class="panel-body">

                <div class="position-center">

                    <form role="form" id="coupon-form">
                        @csrf
                        <div class="form-group">
                            <label for="coupon_name">Tên mã giảm giá</label>
                            <input type="text" class="form-control" id="coupon_name" name="coupon_name">
                        </div>
                        <div class="form-group">
                            <label for="category_product_desc">Mã giảm giá</label>
                            {{-- <textarea style="resize: none" rows="5" class="form-control" id="category_product_desc"
                                name="category_product_desc" placeholder="Description of product"></textarea> --}}
                            <input type="text" class="form-control" id="coupon_code" name="coupon_code">
                        </div>
                        <div class="form-group">
                            <label for="coupon_number">Số lượng</label>
                            <input type="number" class="form-control" id="coupon_number" name="coupon_number">
                        </div>
                        <div class="form-group">
                            <label for="coupon_desc">Tính năng</label>
                            <select name="coupon_desc" class="form-control input-sm m-bot15">
                                <option value="0">Giảm tiền </option>
                                <option value="1">Giảm %</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="coupon_value">Số tiền hoặc % giảm</label>
                            <input type="text" class="form-control" id="coupon_value" name="coupon_value">
                        </div>
                        <button type="submit" name="add_coupon" class="btn btn-info">Thêm mã giảm giá</button>
                    </form>
                </div>

            </div>
        </section>
    </div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        // Lắng nghe sự kiện submit của form
        $('#coupon-form').on('submit', function(e) {
            e.preventDefault(); // Ngăn chặn submit form thông thường

            // Lấy dữ liệu từ form
            var formData = {
                coupon_name: $('#coupon_name').val(),
                coupon_code: $('#coupon_code').val(),
                coupon_number: $('#coupon_number').val(),
                coupon_desc: $('select[name="coupon_desc"]').val(),
                coupon_value: $('#coupon_value').val(),

                _token: $('input[name="_token"]').val() // CSRF token
            };

            // Gửi AJAX request
            $.ajax({
                url: '/insert_coupon_code',
                type: "POST",
                data: formData,
                success: function(response) {
                    alert("Thêm mã giảm giá thành công!");
                    $('#coupon-form')[0].reset(); // Reset lại form sau khi thêm thành công
                },
                error: function(xhr) {
                    alert("Có lỗi xảy ra. Vui lòng thử lại.");
                    console.log(xhr.responseText); // Kiểm tra lỗi phía server
                }
            });
        });
    });
</script>
