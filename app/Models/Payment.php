<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;
    protected $table = 'tbl_payment'; // Tên bảng
    protected $primaryKey = 'payment_id'; // Khóa chính là category_id, không phải id
    // Các trường được phép thêm/sửa
    public function order()
    {
        return $this->belongsTo(Order::class, 'payment_id', 'payment_id');
    }
    protected $fillable = ['payment_method', 'payment_status'];
}
