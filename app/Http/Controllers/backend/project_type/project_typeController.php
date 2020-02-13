<?php

namespace App\Http\Controllers\backend\project_type;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\model\Project_type;

class project_typeController extends Controller {

    function __construct() {
        
    }

    public function index(Request $request) {

        if ($request->isMethod('post')) {
            $objProject = new Project_type();
            $res = $objProject->addProjectType($request);
            if ($res) {
                $return['status'] = 'success';
                $return['message'] = 'Project Type added successfully.';
                $return['redirect'] = route('project-type');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            echo json_encode($return);
            exit;
        }
        $data['title'] = 'Mototive Websolution - Project-Type';
        $data['css'] = array();
        $data['plugincss'] = array('dataTables.bootstrap4.min.css');
        $data['pluginjs'] = array('plugins/validate/jquery.validate.min.js', 'plugins/jquery.dataTables.min.js', 'plugins/dataTables.bootstrap4.min.js');
        $data['js'] = array('ajaxfileupload.js', 'jquery.form.min.js', 'project_type.js');
        $data['funinit'] = array('Project_type.init()');
        return view('backend.pages.project_type.project_type', $data);
    }

    public function editproject_type(Request $request) {

        if ($request->isMethod('post')) {

            $objProject = new Project_type();
            $data = $objProject->editproject_type($request);
            if ($data) {
                $return['status'] = 'success';
                $return['message'] = 'Project Type Edited successfully.';
                $return['redirect'] = route('project-type');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            return json_encode($return);
            exit;
        } else {
            return redirect('project-type');
        }
    }
    
    public function ajaxAction(Request $request) {
        $action = $request->input('action');
        switch ($action) {

            case 'getdatatable':
                $objProject_type = new Project_type();
                $list = $objProject_type->getdatatable();
                echo json_encode($list);
                break;
            
            case 'edittype':

                $objProject_type = new Project_type();
                $data['projecttype'] = $objProject_type->viewtype($request->input('id'));
                $result = view('backend.pages.project_type.edit_project_type', $data);
                echo $result;
                break;
            
             case 'deletetype':
                $objProject_type = new Project_type();

                $res = $objProject_type->deletetype($request->input('data'));
                if ($res) {
                    $return['status'] = 'success';
                    $return['message'] = 'Project Type deleted successfully.';
                    $return['redirect'] = route('project-type');
                } else {
                    $return['status'] = 'error';
                    $return['message'] = 'something will be wrong.';
                }
                echo json_encode($return);
                break;
        }
    }

}
