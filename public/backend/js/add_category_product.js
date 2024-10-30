$(document).ready(function() {
    // Lắng nghe sự kiện submit của form
    $('#category-form').on('submit', function(e) {
        e.preventDefault(); // Ngăn chặn submit form thông thường

        // Lấy dữ liệu từ form
        var formData = {
            category_product_name: $('#category_product_name').val(),
            category_product_desc: $('#category_product_desc').val(),
            category_product_status: $('select[name="category_product_status"]').val(),
            _token: $('input[name="_token"]').val() // CSRF token
        };

        // Gửi AJAX request
        $.ajax({
            url:'/save_category_product', 
            type: "POST",
            data: formData,
            success: function(response) {
                    Swal.fire("Thêm danh mục thành công!", "", "success");
                    $('#category-form')[0].reset(); // Reset lại form sau khi thêm thành công
                },
                error: function(xhr) {
                    Swal.fire("Có lỗi xảy ra.", "Vui lòng thử lại.", "error");
                    console.log(xhr.responseText); // Kiểm tra lỗi phía server
                }
        });
    });
});
