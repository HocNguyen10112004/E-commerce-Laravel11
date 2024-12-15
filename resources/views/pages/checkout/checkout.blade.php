@extends('welcome')
@section('content')
    <section id="cart_items" class="col-sm-9">
        <div class="">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="{{ URL::to('/') }}">Home</a></li>
                    <li class="active">Check out</li>
                </ol>
            </div><!--/breadcrums-->
            <div class="register-req">
                <p>Please use Register And Checkout to easily get access to your order history, or use Checkout as Guest</p>
            </div><!--/register-req-->

            <div class="shopper-informations">
                <div class="row">

                    <div class="col-sm-12 clearfix">
                        <div class="bill-to">
                            <p>Điền mẫu gửi hàng</p>
                            <div class="form-one">
                                <form action="{{ URL::to('/save_checkout_customer') }}" method="POST">
                                    @csrf
                                    <input type="text" name="shipping_email" placeholder="Email" required >
                                    <input type="text" name="shipping_name" placeholder="Họ và tên" required >
                                    <input type="text" name="shipping_address" placeholder="Địa chỉ" required >
                                    <input type="text" name="shipping_phone" placeholder="Số điện thoại" required >
                                    <textarea name="shipping_notes" placeholder="Notes about your order, Special Notes for Delivery" rows="16"></textarea>
                                    <input type="submit" name="send_order" value="Gửi" class="btn btn-primary btn-sm"
                                        style="text-align: center">

                                </form>
                            </div>
                        </div>
                    </div>
                    {{-- <div class="col-sm-4">
                        <div class="order-message">
                            <p>Shipping Order</p>
                            <textarea name="message" placeholder="Notes about your order, Special Notes for Delivery" rows="16"></textarea>
                            <label><input type="checkbox"> Shipping to bill address</label>
                        </div>
                    </div> --}}

                </div>
            </div>
        </div>
    </section> <!--/#cart_items-->
@endsection
