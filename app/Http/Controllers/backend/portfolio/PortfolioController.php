<?php

namespace App\Http\Controllers\backend\portfolio;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Session;
use App\model\Portfolio;
use App\model\Project_type;

class PortfolioController extends Controller {

    function __construct() {
        $this->middleware('admin');
    }

    public function index(Request $request) {

        $data['title'] = 'Mototive Websolution - Portfolio';
        $data['css'] = array();
        $data['plugincss'] = array('dataTables.bootstrap4.min.css');
        $data['pluginjs'] = array('plugins/validate/jquery.validate.min.js', 'plugins/jquery.dataTables.min.js', 'plugins/dataTables.bootstrap4.min.js');
        $data['js'] = array('ajaxfileupload.js', 'jquery.form.min.js', 'portfolio.js');
        $data['funinit'] = array('Portfolio.init()');
        return view('backend.pages.portfolio.portfolio_list', $data);
    }

    public function addportfolio(Request $request) {
        if ($request->isMethod('post')) {
            $objPortfolio = new Portfolio();
            $res = $objPortfolio->addportfolio($request);
            if ($res) {
                $return['status'] = 'success';
                $return['message'] = 'Portfolio added successfully.';
                $return['redirect'] = route('admin-portfolio');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            echo json_encode($return);
            exit;
        }

        $objType = new Project_type;
        $data['type'] = $objType->gettype();

        $data['title'] = 'Mototive Websolution - Dashboard';
        $data['css'] = array();
        $data['plugincss'] = array('dataTables.bootstrap4.min.css');
        $data['pluginjs'] = array('plugins/validate/jquery.validate.min.js', 'plugins/jquery.dataTables.min.js', 'plugins/dataTables.bootstrap4.min.js');
        $data['js'] = array('ajaxfileupload.js', 'jquery.form.min.js', 'portfolio.js');
        $data['funinit'] = array('Portfolio.init()');
        return view('backend.pages.portfolio.addportfolio', $data);
    }

    public function editportfolio(Request $request, $id) {

        if ($request->isMethod('post')) {
            $objPortfolio = new Portfolio();
            $res = $objPortfolio->editportfolio($request, $id);
            if ($res) {
                $return['status'] = 'success';
                $return['message'] = 'Portfolio added successfully.';
                $return['redirect'] = route('admin-portfolio');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            echo json_encode($return);
            exit;
        }

        $objPortfolio = new Portfolio;
        $data['portfolio'] = $objPortfolio->getPortfolio($request, $id);

        $objType = new Project_type;
        $data['type'] = $objType->gettype();

        $data['title'] = 'Mototive Websolution - Dashboard';
        $data['css'] = array();
        $data['plugincss'] = array('dataTables.bootstrap4.min.css');
        $data['pluginjs'] = array('plugins/validate/jquery.validate.min.js', 'plugins/jquery.dataTables.min.js', 'plugins/dataTables.bootstrap4.min.js');
        $data['js'] = array('ajaxfileupload.js', 'jquery.form.min.js', 'portfolio.js');
        $data['funinit'] = array('Portfolio.edit()');
        return view('backend.pages.portfolio.editportfolio', $data);
    }

    public function ajaxAction(Request $request) {
        $action = $request->input('action');
        switch ($action) {

            case 'getdatatable':
                $objPortfolio = new Portfolio();
                $list = $objPortfolio->getdatatable();
                echo json_encode($list);
                break;

            case 'delete':
                $objPortfolio = new Portfolio();
                $res = $objPortfolio->deleteportfolio($request->input('data'));
                if ($res) {
                    $return['status'] = 'success';
                    $return['message'] = 'Portfolio deleted successfully.';
                    $return['redirect'] = route('admin-portfolio');
                } else {
                    $return['status'] = 'error';
                    $return['message'] = 'something will be wrong.';
                }
                echo json_encode($return);
                break;
        }
    }

}
