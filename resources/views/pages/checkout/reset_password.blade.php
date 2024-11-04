@extends('welcome')
@section('content')
    <section id="form"><!--form-->
        <div class="container">

            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form">
                        <h2>Login to your account</h2>
                        <form id="reset_password" method="POST">
                            @csrf
                            <input id="email" type="email" name="email" placeholder="Email Address" />

                            <button type="submit" class="btn btn-default">Reset password</button>
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
                url: '/resend_password',
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
