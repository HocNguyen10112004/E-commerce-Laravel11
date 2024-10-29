@extends('welcome')
@section('content')
    <section id="cart_items" class="col-sm-9">
        <div class="">

            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="{{ URL::to('/') }}">Home</a></li>
                    <li class="active">Danh sách đơn hàng</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <thead>
                        <tr class="cart_menu">
                            <td>Mã số</td>
                            <td>Người nhận</td>
                            <td>Chi tiết đơn hàng</td>
                            <td>Địa chỉ giao hàng</td>
                            <td>Email</td>
                            <td>Số điện thoại</td>
                            <td>Tổng tiền</td>
                            <td>Trạng thái</td>
                            <td>Xóa</td>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($all_order as $item)
                            <tr>
                                <td>{{ $item->order_id }}</td>
                                <td>{{ $item->shipping->shipping_name }}</td>
                                <td>
                                    <ul>
                                        @foreach ($grouped_details[$item->order_id] as $item1)
                                            <li>{{ $item1->product_sales_quantity }} - {{ $item1->product->product_name }}
                                            </li>
                                        @endforeach
                                    </ul>
                                </td>
                                <td>{{ $item->shipping->shipping_address }}</td>
                                <td>{{ $item->shipping->shipping_email }}</td>
                                <td>{{ $item->shipping->shipping_phone }}</td>
                                <td>{{ $item->order_total + $item->order_feeshipping }}</td>
                                <td>{{ $item->order_status }}</td>
                                <td class="cart_delete">
                                    <!-- Thay đổi height theo nhu cầu -->
                                    <a class="cart_quantity_delete"
                                        href="{{ URL::to('/delete_order_customer/' . $item->order_id) }}">
                                        <i style="margin-top: 50%" class="fa fa-times"></i>
                                    </a>
                                </td>

                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </section> <!--/#cart_items-->
@endsection
