<?php

namespace App\Exceptions;

use Throwable; // Thêm import cho Throwable
use Exception;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;

class Handler extends ExceptionHandler
{
    protected $dontReport = [];

    public function render($request, Throwable $exception) // Thay Exception bằng Throwable
    {
        // Trả về trang 404 cho mọi lỗi
        return response()->view('error404', [], 404);
    }
}
