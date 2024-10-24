<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
    use HasFactory;
    protected $table = 'tbl_shipping'; // Tên bảng
    protected $primaryKey = 'shipping_id'; // Khóa chính là category_id, không phải id
    // Các trường được phép thêm/sửa
    protected $fillable = ['shipping_email', 'shipping_name', 'shipping_phone', 'shipping_address', 'shipping_notes', 'customer_id'];
}
