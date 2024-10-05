<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BrandProduct extends Model
{
    use HasFactory;
    protected $table = 'tbl_brand'; // Tên bảng
    protected $primaryKey = 'brand_id'; // Khóa chính là category_id, không phải id

    // Các trường được phép thêm/sửa
    protected $fillable = ['brand_name', 'brand_desc', 'brand_status'];
}
