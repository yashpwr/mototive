<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PolicyController extends Controller {

    function __construct() {
        
    }

    public function policy() {

        $data['title'] = 'Mototive Websolution - Privacy Policy';
        $data['css'] = array();
        $data['plugincss'] = array();
        $data['pluginjs'] = array();
        $data['js'] = array();
        $data['funinit'] = array();
        return view('frontend.pages.policy', $data);
    }

}
