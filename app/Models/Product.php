<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = 'tbl_product'; // Tên bảng
    protected $primaryKey = 'product_id'; // Khóa chính là category_id, không phải id
    // Mối quan hệ với BrandProduct
    public function brand()
    {
        return $this->belongsTo(BrandProduct::class, 'brand_id', 'brand_id');
    }

    // Mối quan hệ với CategoryProduct
    public function category()
    {
        return $this->belongsTo(CategoryProduct::class, 'category_id', 'category_id');
    }
    public function orderDetails()
    {
        
        return $this->hasMany(OrderDetails::class, 'product_id', 'product_id');
    }
    // Các trường được phép thêm/sửa
    protected $fillable = ['product_name', 'product_price', 'product_image', 'category_id', 'brand_id', 'product_content', 'product_desc', 'product_status'];
}
