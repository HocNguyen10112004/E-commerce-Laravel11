<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    protected $table = 'tbl_customers'; // Tên bảng
    protected $primaryKey = 'customer_id'; // Khóa chính là category_id, không phải id
    // Các trường được phép thêm/sửa
    public function order()
    {
        return $this->hasMany(Order::class, 'customer_id', 'customer_id');
    }
    public function review()
    {
        
        return $this->hasMany(Reviews::class, 'customer_id', 'customer_id');
    }
    protected $fillable = ['customer_email', 'customer_name', 'customer_phone', 'customer_password'];
}
