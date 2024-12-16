@extends('admin_layout')
@section('admin_content')
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh sách sản phẩm
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
                            <th>Tên sản phẩm</th>
                            <th>Tên danh mục</th>
                            <th>Tên thương hiệu</th>
                            <th>Mô tả</th>
                            <th>Nội dung</th>
                            <th>Giá tiền</th>
                            <th>Ảnh</th>
                            <th>Hiển thị</th>

                            <th style="width:30px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($all_product as $item)
                            <tr class="item">
                                <td><label class="i-checks m-b-none"><input type="checkbox" name="post[]"><i></i></label>
                                </td>
                                <td>{{ $item->product_name }}</td>
                                <td>{{ $item->category->category_name }}</td>
                                <td>{{ $item->brand->brand_name }}</td>
                                <td>{{ $item->product_desc }}</td>
                                <td>{{ $item->product_content }}</td>
                                <td>{{ $item->product_price }}</td>
                                <td><img src="{{ asset('uploads/product/' . $item->product_image) }}" height="100px"
                                        width="100px" alt=""></td>

                                <td>
                                    <span class="text-ellipsis">
                                        @if ($item->product_status == 1)
                                            <a href="javascript:void(0);" class="toggle-status"
                                                data-id="{{ $item->product_id }}">
                                                <span class="fa-thumbs-styling fa fa-thumbs-up"></span>
                                            </a>
                                        @else
                                            <a href="javascript:void(0);" class="toggle-status"
                                                data-id="{{ $item->product_id }}">
                                                <span class="fa-thumbs-styling fa fa-thumbs-down"></span>
                                            </a>
                                        @endif

                                    </span>
                                </td>

                                <td>
                                    <a href="{{ URL::to('/edit_product/' . $item->product_id) }}"
                                        class="active styling-edit" ui-toggle-class="">
                                        <i class="fa fa-pencil-square-o text-success text-active"></i>
                                    </a>
                                    <a onclick="return confirm('Are you sure to delete?')"
                                        href="{{ URL::to('/delete_product/' . $item->product_id) }}"
                                        class="active styling-edit" ui-toggle-class="">
                                        <i class="fa fa-times text-danger text"></i>
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
<script src="{{ asset('backend/js/changeStatusProduct.js') }}"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="{{ asset('backend/js/search.js') }}"></script>
