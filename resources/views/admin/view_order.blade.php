@extends('admin_layout')
@section('admin_content')
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Thông tin khách hàng
            </div>
            <div class="table-responsive">
                <table class="table table-striped b-t b-light">
                    <thead>
                        <tr>
                            <th>Tên khách hàng</th>
                            <th>Email khách hàng</th>
                            <th>Số điện thoại</th>
                            <th></th>
                            <th style="width:30px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{ $order->customer->customer_name }}</td>
                            <td>{{ $order->customer->customer_email }}</td>
                            <td>{{ $order->customer->customer_phone }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Thông tin giao hàng
            </div>
            <div class="table-responsive">
                <table class="table table-striped b-t b-light">
                    <thead>
                        <tr>
                            <th>Tên người nhận hàng</th>
                            <th>Email người nhận hàng</th>
                            <th>Số điện thoại người nhận hàng</th>
                            <th>Địa chỉ người nhận hàng</th>
                            <th>Phương thức thanh toán</th>
                            <th>Ghi chú</th>
                            <th style="width:30px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{ $order->shipping->shipping_name }}</td>
                            <td>{{ $order->shipping->shipping_email }}</td>
                            <td>{{ $order->shipping->shipping_phone }}</td>
                            <td>{{ $order->shipping->shipping_address }}</td>
                            <td> {{ $order->payment->payment_method }}</td>
                            <td>{{ $order->shipping->shipping_notes }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Chi tiết đơn hàng
            </div>
            <div class="table-responsive">
                <table class="table table-striped b-t b-light">
                    <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($collection as $item)
                            <tr>
                                <td>{{ $item->product->product_name }}</td>
                                <td>{{ $item->product_sales_quantity }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>