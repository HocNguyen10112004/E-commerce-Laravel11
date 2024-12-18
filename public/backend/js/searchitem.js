$(document).ready(function() {
    $('#search').on('keyup', function() {
        var query = $(this).val().toLowerCase(); // Lấy giá trị và chuyển về chữ thường

        $('.itemfinder').each(function() {
            var itemText = $(this).text().toLowerCase(); // Lấy văn bản của mục

            // Kiểm tra xem mục có chứa từ khóa hay không
            if (itemText.indexOf(query) > -1) {
                $(this).show(); // Hiện mục nếu tìm thấy
            } else {
                $(this).hide(); // Ẩn mục nếu không tìm thấy
            }
        });
    });
});