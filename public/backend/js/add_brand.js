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
            url:'/save_brand_product', 
            type: "POST",
            data: formData,
            success: function(response) {
                alert("Thêm thương hiệu thành công!");
                $('#brand-form')[0].reset(); // Reset lại form sau khi thêm thành công
            },
            error: function(xhr) {
                alert("Có lỗi xảy ra. Vui lòng thử lại.");
                console.log(xhr.responseText); // Kiểm tra lỗi phía server
            }
        });
    });
});
