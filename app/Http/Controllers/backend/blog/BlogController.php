<?php

namespace App\Http\Controllers\backend\blog;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\model\Blog;
use App\model\Blog_category;

class BlogController extends Controller {

    function __construct() {
        
    }

    public function index(Request $request) {

        if ($request->isMethod('post')) {
            $objBlog = new Blog();
            $res = $objBlog->addBlog($request);
            if ($res) {
                $return['status'] = 'success';
                $return['message'] = 'Blog added successfully.';
                $return['redirect'] = route('admin-blog');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            echo json_encode($return);
            exit;
        }
        
        $objcategory = new Blog_category();
        $data['category'] = $objcategory->viewblogcategory();
        
        $data['title'] = 'Mototive Websolution - Blog';
        $data['css'] = array();
        $data['plugincss'] = array('dataTables.bootstrap4.min.css');
        $data['pluginjs'] = array('plugins/validate/jquery.validate.min.js', 'plugins/jquery.dataTables.min.js', 'plugins/dataTables.bootstrap4.min.js');
        $data['js'] = array('ajaxfileupload.js', 'jquery.form.min.js', 'blog.js');
        $data['funinit'] = array('Blog.init()');
        return view('backend.pages.blog.blog', $data);
    }

    public function editblog(Request $request) {

        if ($request->isMethod('post')) {
            $objBlog = new Blog();
            $data = $objBlog->editblog($request);
            if ($data) {
                $return['status'] = 'success';
                $return['message'] = 'Blog Edited successfully.';
                $return['redirect'] = route('admin-blog');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'something will be wrong.';
            }
            echo json_encode($return);
            exit;
        } else {
            return redirect('admin-blog');
        }
    }

    public function ajaxAction(Request $request) {
        $action = $request->input('action');
        switch ($action) {

            case 'getdatatable':
                $objBlog = new Blog();
                $list = $objBlog->getdatatable();
                echo json_encode($list);
                break;

            case 'editblog':
                $objBlog = new Blog();
                $data['viewblog'] = $objBlog->viewblog($request->input('id'));
                
                $objBlogcategory = new Blog_category();
                $data['viewblogcategory'] = $objBlogcategory->viewblogcategory();
                $result = view('backend.pages.blog.editblog', $data);
                echo $result;
                break;

            case 'deleteblog':
                $objBlog = new Blog();
                $res = $objBlog->deleteblog($request->input('data'));
                if ($res) {
                    $return['status'] = 'success';
                    $return['message'] = 'Blog deleted successfully.';
                    $return['redirect'] = route('admin-blog');
                } else {
                    $return['status'] = 'error';
                    $return['message'] = 'something will be wrong.';
                }
                echo json_encode($return);
                break;
        }
    }

}
