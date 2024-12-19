@extends('admin_layout')
@section('admin_content')
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách đơn hàng
            </div>
            <?php
            $message = Session::get('message');
            if ($message) {
                echo '<span style="color: red">' . $message . '</span>';
                Session::put('message', null);
            }
            ?>
            <div class="row w3-res-tb">
                <div class="col-sm-5 m-b-xs">
                    <select class="input-sm form-control w-sm inline v-middle">
                        <option value="0">Bulk action</option>
                        <option value="1">Delete selected</option>
                        <option value="2">Bulk edit</option>
                        <option value="3">Export</option>
                    </select>
                    <button class="btn btn-sm btn-default">Apply</button>
                </div>
                <div class="col-sm-4">
                </div>
                <div class="col-sm-3">
                    <div class="input-group">
                        <input id="search" type="text" class="input-sm form-control" placeholder="Search">

                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped b-t b-light">
                    <thead>
                        <tr>
                            <th style="width:20px;">
                                <label class="i-checks m-b-none">
                                    <input type="checkbox"><i></i>
                                </label>
                            </th>
                            <th>Tên khách hàng</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($all_order as $item)
                            <tr class="item">
                                <td><label class="i-checks m-b-none"><input type="checkbox" name="post[]"><i></i></label>
                                </td>
                                <td>{{ $item->customer->customer_name }}</td>
                                <td>{{ $item->order_total }}</td>
                                <td id="{{ $item->order_id }}">
                                    <span class="order-text">{{ $item->order_status }}</span>
                                    <a href="#" class="verify-order" data-order-id="{{ $item->order_id }}">
                                        <i class="fa fa-check-circle" style="color: green;"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="{{ URL::to('/edit_order/' . $item->order_id) }}" class="active styling-edit"
                                        ui-toggle-class="">
                                        <i class="fa fa-pencil-square-o text-success text-active"></i>
                                    </a>
                                    <a onclick="return confirm('Are you sure to delete?')"
                                        href="{{ URL::to('/delete_order/' . $item->order_id) }}" class="active styling-edit"
                                        ui-toggle-class="">
                                        <i class="fa fa-times text-danger text"></i>
                                    </a>

                                    <a href="{{ URL::to('/save_pdf/' . $item->order_id) }}" class="active styling-edit"
                                        ui-toggle-class="">
                                        <i class="fa fa-file-pdf-o text-danger text-active"></i>
                                    </a>


                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

        </div>
    </div>
@endsection

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).on('click', '.verify-order', function(e) {
        e.preventDefault(); // Ngăn chặn hành động mặc định của thẻ a

        var orderId = $(this).data('order-id');

        $.ajax({
            url: '/verify_order/' + orderId,
            type: 'POST',
            data: {
                _token: '{{ csrf_token() }}' // Đảm bảo thêm token CSRF
            },
            success: function(response) {
                if (response.success) {

                    // Cập nhật giao diện nếu cần
                    // $('#orderId .order-text').text(response.new_status);
                    $('#' + orderId + ' .order-text').text(response.new_status);
                } else {
                    alert(response.message);
                }
            },
            error: function(xhr, status, error) {
                console.error(error);
                alert('Có lỗi xảy ra. Vui lòng thử lại.');
            }
        });
    });
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="{{ asset('backend/js/search.js') }}"></script>
