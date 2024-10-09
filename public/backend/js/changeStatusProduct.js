$(document).on("click", ".toggle-status", function () {
    var productId = $(this).data("id");
    var currentIcon = $(this).find("span");
    var newStatus = currentIcon.hasClass("fa-thumbs-up") ? 0 : 1; // Nếu đang là thumbs-up thì đổi thành 0, ngược lại đổi thành 1

    // Đảm bảo CSRF token được thêm vào headers của AJAX request
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $.ajax({
        url: "/active_product/" + productId, // URL động theo categoryId
        type: "POST", // Sử dụng phương thức POST
        data: {
            product_status: newStatus, // Gửi trạng thái mới
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
                console.log(response.message); // Hiển thị thông báo lỗi từ server
            }
        },
        error: function (xhr) {
            console.log("Error: " + xhr.responseText); // Hiển thị lỗi phía server nếu có
        }
    });
});
