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
<script>
    $(document).ready(function() {
        // Lắng nghe sự kiện submit của form
        $('#brand-form').on('submit', function(e) {
            e.preventDefault(); // Ngăn chặn submit form thông thường

            // Lấy dữ liệu từ form
            var formData = {
                brand_product_name: $('#brand_product_name').val(),
                brand_product_desc: $('#brand_product_desc').val(),
                brand_product_status: $('select[name="brand_product_status"]').val(),
                _token: $('input[name="_token"]').val() // CSRF token
            };

            // Gửi AJAX request
            $.ajax({
                url: '/save_brand_product',
                type: "POST",
                data: formData,
                success: function(response) {
                    Swal.fire("Thêm thương hiệu thành công!", "", "success");
                    $('#brand-form')[0].reset(); // Reset lại form sau khi thêm thành công
                },
                error: function(xhr) {
                    Swal.fire("Có lỗi xảy ra.", "Vui lòng thử lại.", "error");
                    console.log(xhr.responseText); // Kiểm tra lỗi phía server
                }
            });
        });
    });
</script>
