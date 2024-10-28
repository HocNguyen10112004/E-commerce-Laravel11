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
    public function orderDetails()
    {
        return $this->hasMany(OrderDetails::class, 'order_id', 'order_id');
    }
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id', 'customer_id');
    }
    public function shipping()
    {
        return $this->hasOne(Shipping::class, 'shipping_id', 'shipping_id');
    }
    public function payment()
    {
        return $this->hasOne(Payment::class, 'payment_id', 'payment_id');
    }
    protected $fillable = ['customer_id', 'shipping_id', 'payment_id', 'order_total', 'order_status', 'order_feeshipping'];
}
