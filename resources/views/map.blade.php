<!DOCTYPE html>
<html>

<head>
    <title>Bản đồ Leaflet</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script src="https://unpkg.com/leaflet-routing-machine/dist/leaflet-routing-machine.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine/dist/leaflet-routing-machine.css" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        #map {
            height: 500px;
            width: 100%;
        }
    </style>
</head>

<body>
    <h3>Bản đồ Leaflet</h3>
    <div id="map"></div>
    {{-- <p id="coordinates"></p>
    <p id="distance"></p>
    <button id="save-btn">Lưu Tọa Độ</button> --}}
    <form id="coordinate-form" action="{{ URL::to('/save-coordinates') }}", method="POST">
        @csrf
        <label for="">Tọa độ latitude</label>
        <input name="latitude" readonly type="text" id="latitude">
        <label for="">Tọa độ longitude</label>
        <input name="longitude" readonly type="text" id="longitude">
        <label>Khoảng cách tính theo km"</label>
        <input name="distance" readonly type="text" id="distance">
        <button type="submit" id="save-btn">Lưu Tọa Độ</button>
    </form>

</body>

</html>
<script>
    var startLocation = [10.762622, 106.660172]; // Điểm gốc
    var map = L.map('map').setView(startLocation, 12);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    var marker;
    var routeControl;

    map.on('click', function(e) {
        var lat = e.latlng.lat;
        var lng = e.latlng.lng;

        if (marker) {
            map.removeLayer(marker);
        }

        marker = L.marker([lat, lng]).addTo(map);
        document.getElementById('latitude').value = lat.toFixed(6);
        document.getElementById('longitude').value = lng.toFixed(6);

        // Tính khoảng cách
        var distance1 = map.distance(startLocation, [lat, lng]);
        document.getElementById('distance').value = (distance1 / 1000).toFixed(2);

        if (routeControl) {
            map.removeControl(routeControl);
        }

        // Tạo đường đi từ điểm gốc đến vị trí người dùng chọn
        routeControl = L.Routing.control({
            waypoints: [
                L.latLng(startLocation[0], startLocation[1]),
                L.latLng(lat, lng)
            ],
            routeWhileDragging: true
        }).addTo(map);
    });
</script>
