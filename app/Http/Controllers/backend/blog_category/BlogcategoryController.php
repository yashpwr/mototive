<?php

namespace App\Http\Controllers\backend\blog_category;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\model\Blog_category;

class BlogcategoryController extends Controller {

    function __construct() {
        
    }

    public function index(Request $request) {

        if ($request->isMethod('post')) {
            $objcategory = new Blog_category();
            $res = $objcategory->addCategory($request);
            if ($res) {
                $return['status'] = 'success';
                $return['message'] = 'Blog Category added successfully.';
                $return['redirect'] = route('blog-category');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            echo json_encode($return);
            exit;
        }
        $data['title'] = 'Mototive Websolution - Blog Category';
        $data['css'] = array();
        $data['plugincss'] = array('dataTables.bootstrap4.min.css');
        $data['pluginjs'] = array('plugins/validate/jquery.validate.min.js', 'plugins/jquery.dataTables.min.js', 'plugins/dataTables.bootstrap4.min.js');
        $data['js'] = array('ajaxfileupload.js', 'jquery.form.min.js', 'blog_category.js');
        $data['funinit'] = array('Blog_category.init()');
        return view('backend.pages.blog_category.index', $data);
    }

    public function editblogcategory(Request $request) {

        if ($request->isMethod('post')) {

            $objcategory = new Blog_category();
            $data = $objcategory->editblog_category($request);
            if ($data) {
                $return['status'] = 'success';
                $return['message'] = 'Blog Category Edited successfully.';
                $return['redirect'] = route('blog-category');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            return json_encode($return);
            exit;
        } else {
            return redirect('blog-category');
        }
    }

    public function ajaxAction(Request $request) {
        $action = $request->input('action');
        switch ($action) {

            case 'getdatatable':
                $objcategory = new Blog_category();
                $list = $objcategory->getdatatable();
                echo json_encode($list);
                break;

            case 'edittype':

                $objcategory = new Blog_category();
                $data['blogcategory'] = $objcategory->viewDetails($request->input('id'));
                $result = view('backend.pages.blog_category.edit_blog_category', $data);
                echo $result;
                break;

            case 'deletetype':
                $objcategory = new Blog_category();
                $res = $objcategory->deletetype($request->input('data'));
                if ($res) {
                    $return['status'] = 'success';
                    $return['message'] = 'Blog Category deleted successfully.';
                    $return['redirect'] = route('blog-category');
                } else {
                    $return['status'] = 'error';
                    $return['message'] = 'something will be wrong.';
                }
                echo json_encode($return);
                break;
        }
    }

}
