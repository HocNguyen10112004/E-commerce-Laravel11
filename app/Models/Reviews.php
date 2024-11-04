<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reviews extends Model
{
    use HasFactory;
    protected $table = 'tbl_reviews'; // Tên bảng
    protected $primaryKey = 'review_id'; // Khóa chính là category_id, không phải id
    
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id', 'customer_id');
    }
    public function product()
    {
        
        return $this->belongsTo(Product::class, 'product_id', 'product_id');
    }
    // Các trường được phép thêm/sửa
    protected $fillable = ['customer_id', 'product_id', 'review_content'];
}

