            @extends('admin_layout')
            @section('admin_content')
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Thêm danh mục sản phẩm
                        </header>
                        <div class="panel-body">
                            <?php
		                        $message=Session::get('message');
		                        if($message)
		                        {
			                        echo '<span style="color:red">'.$message.'</span>';
			                        Session::put('message',null);
		                        }
	                        ?>
                            <div class="position-center">
                                <form role="form" action="{{ URL::to('/save_category_product') }}" method="POST">
                                @csrf
                                <div class="form-group">
                                    <label for="category_product_name">Tên danh mục</label>
                                    <input type="text" class="form-control" id="category_product_name" name="category_product_name" placeholder="Enter name of product">
                                </div>
                                <div class="form-group">
                                    <label for="category_product_desc">Mô tả danh mục</label>
                                    <textarea style="resize: none" rows="5" class="form-control" id="category_product_desc" name="category_product_desc" placeholder="Description of product"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="category_product_status">Trạng thái hiển thị</label>
                                    <select name="category_product_status" class="form-control input-sm m-bot15">
                                        <option value="0">Ẩn</option>
                                        <option value="1">Hiển Thị</option>    
                                    </select>
                                </div>
                                <button type="submit" name="add_category_product" class="btn btn-info">Thêm danh mục</button>
                            </form>
                            </div>

                        </div>
                    </section>
            </div>
            @endsection