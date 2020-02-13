<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\model\Portfolio;

class PortfolioController extends Controller
{
    function __construct() {
       
    }
    public function portfolio(){
        
        $objPortfolio = new Portfolio();
        $data['details'] = $objPortfolio->getPortfoliodetails();
        $data['title'] = 'Mototive Websolution - Portfolio';
        $data['css'] = array();
        $data['plugincss'] = array();
        $data['pluginjs'] = array();
        $data['js'] = array();
        $data['funinit'] = array(); 
        return view('frontend.pages.portfolio',$data);
    }
    
    public function readmore(Request $request, $id){
        
        $objPortfolio = new Portfolio();
        $data['details'] = $objPortfolio->readmorePortfoliodetails($request, $id);
        $data['title'] = 'Mototive Websolution - Portfolio';
        $data['css'] = array();
        $data['plugincss'] = array();
        $data['pluginjs'] = array();
        $data['js'] = array();
        $data['funinit'] = array(); 
        return view('frontend.pages.aboutportfolio',$data);
    }
}
