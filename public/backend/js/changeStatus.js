$(document).on("click", ".toggle-status", function () {
    var categoryId = $(this).data("id");
    var currentIcon = $(this).find("span");
    var newStatus = currentIcon.hasClass("fa-thumbs-up") ? 0 : 1; // Nếu đang là thumbs-up thì đổi thành 0, ngược lại đổi thành 1

    $.ajax({
        url: "/active_category_product/" + categoryId,
        type: "GET",
        data: {
            _token: "{{ csrf_token() }}", // Thêm CSRF token
            category_status: newStatus, // Gửi trạng thái mới
        },
        success: function (response) {
            if (response.success) {
                // Cập nhật icon dựa trên trạng thái mới
                if (newStatus === 1) {
                    currentIcon
                        .removeClass("fa-thumbs-down")
                        .addClass("fa-thumbs-up");
                } else {
                    currentIcon
                        .removeClass("fa-thumbs-up")
                        .addClass("fa-thumbs-down");
                }
            } else {
                console.log(response.message); // Xử lý lỗi nếu cần
            }
        },
        error: function (xhr) {
            console.log(xhr.responseText); // Xử lý lỗi nếu cần
        },
    });
});
