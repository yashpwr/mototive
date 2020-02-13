<?php

namespace App\Http\Controllers\backend\dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Session;
use App\model\Dashboard;

class DashboardController extends Controller
{
    function __construct() {
//         parent::__construct();
        $this->middleware('admin');
    }
    
    public function dashboard(Request $request){
        
        
        $data['title'] = 'Mototive Websolution - Dashboard';
        $data['css'] = array();
        $data['plugincss'] = array();
        $data['pluginjs'] = array();
        $data['js'] = array();
        $data['funinit'] = array(); 
        return view('backend.pages.dashboard.dashboard',$data);
    }
}
