<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;

class AdminController extends Controller
{
    public function index()
    {
        return view("admin_login");
    }

    public function show_dashboard()
    {
        return view("admin.dashboard");
    }

    public function dashboard(Request $request)
    {
        $admin_email = $request->input("admin_email");
        $admin_password = md5($request->input("admin_password"));
        $result = DB::table("table_admin")
            ->where("admin_email", $admin_email)
            ->where("admin_password", $admin_password)
            ->first();

        if ($result) {
            // Sử dụng Session::put thay vì session::put
            Session::put("admin_name", $result->admin_name);
            Session::put("admin_id", $result->admin_id);
            return Redirect::to("/dashboard");
        } else {
            Session::put("message", "Wrong account or password");
            return Redirect::to("/admin");
        }
    }

    public function logout()
    {
        Session::put("admin_name", null);
        Session::put("admin_id", null);
        return Redirect::to("/admin");
    }
}
