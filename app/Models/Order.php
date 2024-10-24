<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $table = 'tbl_order'; // Tên bảng
    protected $primaryKey = 'order_id'; // Khóa chính là category_id, không phải id
    // Các trường được phép thêm/sửa
    protected $fillable = ['customer_id', 'shipping_id', 'payment_id', 'order_total', 'order_status'];
}
