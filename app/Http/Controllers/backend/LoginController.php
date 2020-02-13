<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\Hash;
use Session;

class LoginController extends Controller {

    
    function __construct() {
        
    }

    public function login(Request $request) {
        if ($request->isMethod('post')) {
            $this->validate($request, [
                'email' => 'required|email',
                'password' => 'required'
            ]);

            if (Auth::guard('admin')->attempt(['email' => $request->input('email'), 'password' => $request->input('password'), 'usertype' => 'admin'])) {

                $loginData = array(
                    'name' => Auth::guard('admin')->user()->name,
                    'email' => Auth::guard('admin')->user()->email,
                    'type' => Auth::guard('admin')->user()->type,
                    'user_image' => Auth::guard('admin')->user()->user_image,
                    'id' => Auth::guard('admin')->user()->id
                );
                Session::push('logindata', $loginData);
                $return['status'] = 'success';
                $return['message'] = "Well Done login Successfully!";
                $return['redirect'] = route('admin-dashboard');
            } else if (Auth::guard('user')->attempt(['email' => $request->input('email'), 'password' => $request->input('user'), 'usertype' => 'user'])) {

                $loginData = array(
                    'name' => Auth::guard('user')->user()->name,
                    'email' => Auth::guard('user')->user()->email,
                    'type' => Auth::guard('user')->user()->type,
                    'user_image' => Auth::guard('user')->user()->user_image,
                    'id' => Auth::guard('user')->user()->id
                );
                Session::push('logindata', $loginData);
                $return['status'] = 'success';
                $return['message'] = "Well Done login Successfully!";
                $return['redirect'] = route('dashboard');
            } else {
                $return['status'] = 'error';
                $return['message'] = "Invaild Id Or Password";
            }
            return json_encode($return);
            exit();
        }
        $data['title'] = 'Mototive Websolution - Login';
        $data['css'] = array();
        $data['plugincss'] = array();
        $data['pluginjs'] = array('validate/jquery.validate.min.js');
        $data['js'] = array('ajaxfileupload.js', 'jquery.form.min.js', 'login.js');
        $data['funinit'] = array('Login.init()');
        return view('backend.pages.login', $data);
    }

    public function getLogout() {
        $this->resetGuard();
        return redirect()->route('admin');
    }

    public function resetGuard() {
        Auth::logout();
        Auth::guard('admin')->logout();
        Auth::guard('user')->logout();
        Session::forget('logindata');
    }

    public function createPassword() {
        print_r(Hash::make('123'));
    }

}
