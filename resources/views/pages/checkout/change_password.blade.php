@extends('welcome')
@section('content')
    <section id="form"><!--form-->
        <div class="container">

            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form">
                        <h2>Đổi mật khẩu</h2>
                        @if (Session::get('notipass'))
                            <div class="alert alert-success">
                                {{ Session::get('notipass') }}

                            </div>
                            {{ Session::put('notipass', null) }}
                        @endif
                        <form id="change_password" action="{{ URL::to('/send_new_password') }}" method="POST">
                            @csrf
                            <input id="currentpassword" type="text" name="currentpassword" placeholder="Mật khẩu hiện tại" required />
                            <input id="newpassword" type="password" name="newpassword" placeholder="Mật khẩu mới" required />
                            <input id="newpassword2" type="password" name="newpassword2" placeholder="Nhập lại mật khẩu mới" required />
                            <button type="submit" class="btn btn-default">Change password</button>
                        </form>


                    </div>
                </div>
            </div>
        </div>
    </section><!--/form-->
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        // Lắng nghe sự kiện submit của form
        $('#reset_password').on('submit', function(e) {
            e.preventDefault();
            var formData = {
                email: $('#email').val(),
                _token: $('input[name="_token"]').val() // CSRF token
            };

            // Gửi AJAX request
            $.ajax({
                url: '',
                type: "POST",
                data: formData,
                success: function(response) {
                    if (response.success) {
                        // swal("Reset mật khẩu thành công!");
                        swal("Reset mật khẩu thành công!", "success");
                        $('#reset_password')[0].reset();
                    } else {
                        // swal("Email không tồn tại. Vui lòng thử lại!");
                        swal("Email không tồn tại. Vui lòng thử lại!", "error");
                        $('#reset_password')[0].reset();

                    }
                },
                error: function(xhr) {
                    swal("Xảy ra lỗi. Vui lòng thử lại!");
                    console.log(xhr.responseText); // Kiểm tra lỗi phía server
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        $("#change_password").on("submit", function (e) {
            e.preventDefault(); // Ngăn form gửi thông thường

            const formData = $(this).serialize(); // Lấy toàn bộ dữ liệu form
            const actionUrl = $(this).attr("action"); // URL của form

            $.ajax({
                url: actionUrl,
                type: "POST",
                data: formData,
                success: function (response) {
                    if (response.success) {
                        swal("Thành công!", response.success, "success");
                        $('#change_password')[0].reset(); // Reset form
                    }
                },
                error: function (xhr) {
                    // Xử lý lỗi trả về từ server
                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        swal("Lỗi!", xhr.responseJSON.message, "error");
                    } else {
                        swal("Lỗi!", "Có lỗi xảy ra. Vui lòng thử lại sau.", "error");
                    }
                },
            });
        });
    });
</script>

