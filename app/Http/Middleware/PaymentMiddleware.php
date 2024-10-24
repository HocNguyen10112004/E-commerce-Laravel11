<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Redirect;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Session;
class PaymentMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (!Session::has('customer_id')) {
            return Redirect::to('/login_checkout');
        }
        if (!Session::has('cart')) {
            return Redirect::to('/show_cart');
        }
        if (!Session::has("shipping_id")) {
            return Redirect::to('/checkout');
        }

        return $next($request);
    }
}
