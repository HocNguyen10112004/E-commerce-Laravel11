<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoryProduct extends Model
{
    use HasFactory; 
    protected $table = 'tbl_category_product'; // Tên bảng
    protected $primaryKey = 'category_id'; // Khóa chính là category_id, không phải id
    // Mối quan hệ với Product
    public function products()
    {
        return $this->hasMany(Product::class, 'category_id', 'category_id');
    }
    // Các trường được phép thêm/sửa
    protected $fillable = ['category_name', 'category_desc', 'category_status'];
}