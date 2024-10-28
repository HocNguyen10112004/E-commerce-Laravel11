@extends('welcome')
@section('content')
    <section id="form"><!--form-->
        <div class="container">
            @if (Session::get('wrong_email'))
                <div class="alert alert-success">
                    {{ Session::get('wrong_email') }}

                </div>
                {{ Session::put('wrong_email', null) }}
            @endif
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        <h2>Login to your account</h2>
                        <form action="{{ URL::to('/resend_password') }}" method="POST">
                            @csrf
                            <input type="email" name="email" placeholder="Email Address" />

                            <button type="submit" class="btn btn-default">Reset password</button>
                        </form>
                    </div><!--/login form-->
                </div>
            </div>
        </div>
    </section><!--/form-->
@endsection
