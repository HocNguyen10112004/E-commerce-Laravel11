<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory;
    protected $table = 'tbl_coupon'; // Tên bảng
    protected $primaryKey = 'coupon_id'; // Khóa chính là category_id, không phải id
    // Các trường được phép thêm/sửa
    protected $fillable = ['coupon_name', 'coupon_code', 'coupon_number', 'coupon_value', 'coupon_desc'];
    
}
