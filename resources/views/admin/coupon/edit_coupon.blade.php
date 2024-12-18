@extends('admin_layout')
@section('admin_content')
<div class="col-lg-12">
    <section class="panel">
        <header class="panel-heading">
            Chỉnh sửa mã giảm giá
        </header>
        <div class="panel-body">

            <div class="position-center">
                
                <form role="form" action="{{ URL::to('/update_coupon/'.$edit_coupon->coupon_id) }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="coupon_name">Tên mã giảm giá</label>
                            <input type="text" class="form-control" id="coupon_name" name="coupon_name">
                        </div>
                        <div class="form-group">
                            <label for="category_product_desc">Mã giảm giá</label>
                            <input type="text" class="form-control" id="coupon_code" name="coupon_code">
                        </div>
                        <div class="form-group">
                            <label for="coupon_number">Số lượng</label>
                            <input type="number" class="form-control" id="coupon_number" name="coupon_number">
                        </div>
                        <div class="form-group">
                            <label for="coupon_desc">Tính năng</label>
                            <select name="coupon_desc" class="form-control input-sm m-bot15">
                                <option value="0">Giảm tiền </option>
                                <option value="1">Giảm %</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="coupon_value">Số tiền hoặc % giảm</label>
                            <input type="text" class="form-control" id="coupon_value" name="coupon_value">
                        </div>
                        <button type="submit" name="add_coupon" class="btn btn-info">Thêm mã giảm giá</button>
                    
                </form>
            </div>

        </div>
    </section>
</div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
