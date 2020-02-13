<?php

namespace App\Http\Controllers\backend\slider;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\model\Slider;

class SliderController extends Controller {

    public function __construct() {
        
    }

    public function slider(Request $request) {
        if ($request->isMethod('post')) {
            $objSlider = new Slider();
            $res = $objSlider->addSlider($request);
            if ($res) {
                $return['status'] = 'success';
                $return['message'] = 'Slider added successfully.';
                $return['redirect'] = route('slider');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            echo json_encode($return);
            exit;
        }
        
        $data['title'] = 'Mototive Websolution - Dashboard';
        $data['css'] = array();
        $data['plugincss'] = array('dataTables.bootstrap4.min.css');
        $data['pluginjs'] = array('plugins/validate/jquery.validate.min.js', 'plugins/jquery.dataTables.min.js', 'plugins/dataTables.bootstrap4.min.js');
        $data['js'] = array('ajaxfileupload.js', 'jquery.form.min.js', 'slider.js');
        $data['funinit'] = array('Slider.init()');
        return view('backend.pages.slider.slider_list', $data);
    }

    public function editslider(Request $request) {

        if ($request->isMethod('post')) {

            $objSlider = new Slider();
            $data = $objSlider->editslider($request);
            if ($data) {
                $return['status'] = 'success';
                $return['message'] = 'Slider Edited successfully.';
                $return['redirect'] = route('slider');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            echo json_encode($return);
            exit;
        } else {
            return redirect('slider');
        }
    }

    public function ajaxAction(Request $request) {
        $action = $request->input('action');
        switch ($action) {

            case 'getdatatable':
                $objsliderlist = new slider();
                $list = $objsliderlist->getdatatable();
                echo json_encode($list);
                break;

            case 'editslider':

                $objSlider = new Slider();
                $data['viewslider'] = $objSlider->viewsilder($request->input('id'));
                $result = view('backend.pages.slider.editslider', $data);
                echo $result;
                break;

            case 'deleteSlider':
                $objSlider = new Slider();

                $res = $objSlider->deleteSlider($request->input('data'));
                
                if ($res) {
                    $return['status'] = 'success';
                    $return['message'] = 'Slider deleted successfully.';
                    $return['redirect'] = route('slider');
                } else {
                    $return['status'] = 'error';
                    $return['message'] = 'something will be wrong.';
                }
                echo json_encode($return);
                break;
        }
    }

}
