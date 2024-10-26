<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;
    protected $table = 'tbl_location'; // Tên bảng
    protected $primaryKey = 'location_id'; // Khóa chính là category_id, không phải id
    // Các trường được phép thêm/sửa
    public function shipping()
    {
        return $this->belongsTo(Shipping::class, 'shipping_id', 'shipping_id');
    }
    protected $fillable = ['latitude', 'longitude', 'distance', 'shipping_id'];
}
