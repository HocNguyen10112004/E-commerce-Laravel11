@extends('welcome')
@section('content')
    <section id="cart_items" class="col-sm-9">
        <div class="">
            @if (Session::get('success'))
                <div class="alert alert-success">
                    {{ Session::get('success') }}

                </div>
                {{ Session::put('success', null) }}
            @endif
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="{{ URL::to('/') }}">Home</a></li>
                    <li class="active">Check out</li>
                </ol>
            </div><!--/breadcrums-->
            <div class="register-req">
                <p>Please use Register And Checkout to easily get access to your order history, or use Checkout as Guest</p>
            </div><!--/register-req-->

            <div class="">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="{{ URL::to('/') }}">Home</a></li>
                        <li class="active">Shopping Cart</li>
                    </ol>
                </div>
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Image</td>
                                <td class="description">Product</td>
                                <td class="price">Price</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($cartItems as $item)
                                <tr data-id="{{ $item->id }}">
                                    <td class="cart_product">
                                        <a href=""><img
                                                src="{{ URL::to('uploads/product/' . $item->attributes->image) }}"
                                                height="100px" width="50px"></a>

                                    </td>
                                    <td class="cart_description">
                                        <h4><a href="">{{ $item->name }}</a></h4>
                                        <p>ID: {{ $item->id }}</p>
                                    </td>
                                    <td class="cart_price">
                                        <p data-price="{{ $item->price }}">
                                            {{ number_format((int) $item->price) . ' ' . 'VNĐ' }}</p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <input class="cart_quantity_input" type="text" name="quantity"
                                                value="{{ $item->quantity }}" autocomplete="off" size="2">
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">
                                            {{ number_format((int) $item->price * $item->quantity) . ' ' . 'VNĐ' }}</p>
                                    </td>

                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="review-payment">
            <h2>Review & Payment</h2>
        </div>
        <br>
        <form action="{{ URL::to('/order_place') }}" method="POST">
            @csrf
            <div class="payment-options">
                <span>
                    <label><input name="payment_option" value="1" type="radio"> Direct Bank Transfer</label>
                </span>
                <span>
                    <label><input name="payment_option" value="2" type="radio">Thanh toán khi nhận hàng</label>
                </span>
                <br>
                <span>
                    <input type="submit" value="Order" class="btn btn-default check_out">
                </span>
            </div>
        </form>
    </section> <!--/#cart_items-->
@endsection
