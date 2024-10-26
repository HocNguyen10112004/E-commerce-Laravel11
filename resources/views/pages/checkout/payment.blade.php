@extends('welcome')
@section('content')
    <section id="cart_items" class="col-sm-9">
        <div class="">
            @if (Session::get('success1'))
                <div class="alert alert-success">
                    {{ Session::get('success1') }}

                </div>
                {{ Session::put('success1', null) }}
            @endif
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
        <a href="{{ URL::to('/map') }}">Chọn tọa độ</a>
        <h3>Bản đồ Leaflet</h3>
        <div id="map"></div>
        {{-- <p id="coordinates"></p>
    <p id="distance"></p>
    <button id="save-btn">Lưu Tọa Độ</button> --}}

        <div class="review-payment">
            <h2>Review & Payment</h2>
        </div>
        <br>

        <form action="{{ URL::to('/order_place') }}" method="POST">
            @csrf
            <div class="payment-options">
                <label for="">Tọa độ latitude</label>
                <input name="latitude" readonly type="text" id="latitude">
                <label for="">Tọa độ longitude</label>
                <input name="longitude" readonly type="text" id="longitude">
                <br>
                <label>Khoảng cách tính theo km"</label>
                <input name="distance" readonly type="text" id="distance">
                <br>
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
    <script>
        var startLocation = [10.762622, 106.660172]; // Điểm gốc
        var map = L.map('map').setView(startLocation, 12);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        var marker;
        var routeControl;

        // map.on('click', function(e) {
        //     var lat = e.latlng.lat;
        //     var lng = e.latlng.lng;

        //     if (marker) {
        //         map.removeLayer(marker);
        //     }

        //     marker = L.marker([lat, lng]).addTo(map);
        //     document.getElementById('latitude').value = lat.toFixed(6);
        //     document.getElementById('longitude').value = lng.toFixed(6);

        //     // Tính khoảng cách
        //     var distance1 = map.distance(startLocation, [lat, lng]);
        //     // var distance2 = e.routes[0].summary.totalDistance; // Khoảng cách đường bộ trong mét

        //     document.getElementById('distance').value = (distance1 / 1000).toFixed(2);

        //     if (routeControl) {
        //         map.removeControl(routeControl);
        //     }

        //     // Tạo đường đi từ điểm gốc đến vị trí người dùng chọn
        //     routeControl = L.Routing.control({
        //         waypoints: [
        //             L.latLng(startLocation[0], startLocation[1]),
        //             L.latLng(lat, lng)
        //         ],
        //         routeWhileDragging: true
        //     }).addTo(map);
        // });
        map.on('click', function(e) {
            var lat = e.latlng.lat;
            var lng = e.latlng.lng;

            if (marker) {
                map.removeLayer(marker);
            }

            marker = L.marker([lat, lng]).addTo(map);
            document.getElementById('latitude').value = lat.toFixed(6);
            document.getElementById('longitude').value = lng.toFixed(6);

            // Nếu routeControl đã tồn tại, không cần xóa nó, chỉ cập nhật waypoint
            if (!routeControl) {
                // Tạo đường đi lần đầu
                routeControl = L.Routing.control({
                    waypoints: [
                        L.latLng(startLocation[0], startLocation[1]),
                        L.latLng(lat, lng)
                    ],
                    routeWhileDragging: true,
                    createMarker: function() {
                        return null;
                    } // Không tạo marker cho các waypoint
                }).addTo(map);
            } else {
                // Cập nhật waypoint cho routeControl đã tồn tại
                routeControl.setWaypoints([
                    L.latLng(startLocation[0], startLocation[1]),
                    L.latLng(lat, lng)
                ]);
            }

            // Cập nhật khoảng cách
            routeControl.on('routesfound', function(e) {
                var distance = e.routes[0].summary.totalDistance; // Khoảng cách đường bộ trong mét
                document.getElementById('distance').value = (distance / 1000).toFixed(
                    2); // Chuyển đổi sang km
            });
        });
    </script>
@endsection
