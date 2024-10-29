<html>

<head>
    <style>
        * {
            box-sizing: border-box;
            font-family: DejaVu Sans !important;
        }

        body {
            background: linear-gradient(to right, #fbc2eb, #a6c1ee);
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            /* Đổi từ 80% thành 90% */
            max-width: 1200px;
            /* Giới hạn độ rộng tối đa */
            margin: 50px auto;
            background-color: #f0f8f0;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            /* Thêm khoảng cách giữa các bảng */
        }

        th,
        td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #e0f2e0;
            font-weight: bold;
            color: #666;
        }

        td {
            background-color: #f9f9f9;
            color: #333;
        }

        @media (max-width: 768px) {

            th,
            td {
                padding: 10px;
                /* Giảm padding cho thiết bị nhỏ */
            }

            .header {
                font-size: 20px;
                /* Giảm kích thước font tiêu đề */
            }
        }

        @media (max-width: 480px) {
            .header {
                font-size: 18px;
                /* Giảm thêm cho thiết bị rất nhỏ */
            }

            th,
            td {
                font-size: 14px;
                /* Giảm kích thước font cho bảng */
            }

            .container {
                padding: 10px;
                /* Giảm padding của container */
            }
        }

        .text-center {
            text-align: center;
            margin-top: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            /* Tạo hiệu ứng hover */
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">THÔNG TIN KHÁCH HÀNG</div>
        <table>
            <thead>
                <tr>
                    <th>Tên khách hàng</th>
                    <th>Email khách hàng</th>
                    <th>Số điện thoại</th>
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
    <div class="container">
        <div class="header">THÔNG TIN GIAO HÀNG</div>
        <table>
            <thead>
                <tr>
                    <th>Tên người nhận hàng</th>
                    <th>Email người nhận hàng</th>
                    <th>Số điện thoại người nhận hàng</th>
                    <th>Địa chỉ người nhận hàng</th>
                    <th>Phương thức thanh toán</th>
                    <th>Ghi chú</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{ $order->shipping->shipping_name }}</td>
                    <td>{{ $order->shipping->shipping_email }}</td>
                    <td>{{ $order->shipping->shipping_phone }}</td>
                    <td>{{ $order->shipping->shipping_address }}</td>
                    <td>{{ $order->payment->payment_method }}</td>
                    <td>{{ $order->shipping->shipping_notes }}</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="container">
        <div class="header">THÔNG TIN ĐƠN HÀNG</div>
        <table>
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
</body>

</html>
