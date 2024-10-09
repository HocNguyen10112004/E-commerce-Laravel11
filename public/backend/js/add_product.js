$(document).ready(function() {
    // Lắng nghe sự kiện submit của form
    $('#product-form').on('submit', function(e) {
        e.preventDefault(); // Ngăn chặn submit form thông thường

        // Lấy dữ liệu từ form
        var formData = {
            product_name: $('#product_name').val(),
            product_desc: $('#product_desc').val(),
            product_price: $('#product_price').val(),
            product_content: $('#product_content').val(),
            product_image: $('#product_image').val(),
            product_brand: $('select[name="product_brand"]').val(),
            product_category: $('select[name="product_category"]').val(),
            product_status: $('select[name="product_status"]').val(),
            _token: $('input[name="_token"]').val() // CSRF token
        };

        // Gửi AJAX request
        $.ajax({
            url:'/save_product', 
            type: "POST",
            data: formData,
            success: function(response) {
                alert("Thêm thương hiệu thành công!");
                $('#product-form')[0].reset(); // Reset lại form sau khi thêm thành công
            },
            error: function(xhr) {
                alert("Có lỗi xảy ra. Vui lòng thử lại.");
                console.log(xhr.responseText); // Kiểm tra lỗi phía server
            }
        });
    });
});
