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
    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'order_id');
    }
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'product_id');
    }
    protected $fillable = ['order_id', 'product_id', 'product_sales_quantity'];
}
