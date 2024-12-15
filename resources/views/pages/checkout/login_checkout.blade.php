@extends('welcome')
@section('content')
    <section id="form"><!--form-->
        <div class="container">
            @if (Session::get('error'))
                <div class="alert alert-success">
                    {{ Session::get('error') }}

                </div>
                {{ Session::put('error', null) }}
            @endif
            @if (Session::get('wrongacc'))
                <div class="alert alert-success">
                    {{ Session::get('wrongacc') }}

                </div>
                {{ Session::put('wrongacc', null) }}
            @endif
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        <h2>Login to your account</h2>
                        <form action="{{ URL::to('/login_customer') }}" method="POST">
                            @csrf
                            <input type="email" name="email" placeholder="Email Address" required />
                            <input type="password" name="password" placeholder="Password" required />
                            <span>
                                <input type="checkbox" class="checkbox">
                                Keep me signed in
                            </span>
                            <br>
                            <a href="{{ URL::to('/reset_password') }}">Forget password?</a>
                            <button type="submit" class="btn btn-default">Login</button>
                        </form>
                    </div><!--/login form-->
                </div>
                <div class="col-sm-1">
                    <h2 class="or">OR</h2>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form"><!--sign up form-->
                        <h2>New User Signup!</h2>
                        <form action="{{ URL::to('/add_customer') }}" method="POST">
                            @csrf
                            <input type="text" placeholder="Name" name="customer_name" />
                            <input type="email" placeholder="Email Address" name="customer_email" />
                            <input type="text" placeholder="Phone number" name="customer_phone">
                            <button type="submit" class="btn btn-default">Sign up</button>
                        </form>
                    </div><!--/sign up form-->
                </div>
            </div>
        </div>
    </section><!--/form-->
@endsection
