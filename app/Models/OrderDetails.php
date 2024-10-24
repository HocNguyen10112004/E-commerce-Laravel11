<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetails extends Model
{
    use HasFactory;
    protected $table = 'tbl_order_details'; // Tên bảng
    protected $primaryKey = 'order_details_id'; // Khóa chính là category_id, không phải id
    // Các trường được phép thêm/sửa
    protected $fillable = ['order_id', 'product_id', 'product_sales_quantity'];
}
