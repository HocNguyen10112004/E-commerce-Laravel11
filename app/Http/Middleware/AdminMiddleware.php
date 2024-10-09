<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Kiểm tra nếu chưa có thông tin admin trong session
        if (!Session::has('admin_id')) {
            return redirect('/admin'); // Chuyển hướng đến trang login cho admin
        }

        return $next($request); // Cho phép truy cập nếu admin đã đăng nhập
    }
}
