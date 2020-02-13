<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;

class Blog extends Model {

    protected $table = "blog";

    public function addBlog($request) {

        if ($request->file()) {
            $image = $request->file('image');
            $name = 'admin' . time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/blog/');
            $image->move($destinationPath, $name);

            $objBlog = new Blog();
            $objBlog->image = $name;
            $objBlog->title = $request->input('title');
            $objBlog->category = $request->input('category');
            $objBlog->author = $request->input('author');
            $objBlog->content = $request->input('content');
            $objBlog->created_at = date("Y-m-d h:i:s");
            $objBlog->updated_at = date("Y-m-d h:i:s");
            return $objBlog->save();
        } else {
            return false;
        }
    }

    public function editblog($request) {

        if ($request->file()) {

            $image = $request->file('image');
            $name = 'admin' . time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/blog/');
            $image->move($destinationPath, $name);

            $objBlog = Blog::find($request->input('id'));
            $objBlog->image = $name;
            $objBlog->title = $request->input('title');
            $objBlog->category = $request->input('category');
            $objBlog->author = $request->input('author');
            $objBlog->content = $request->input('content');
            $objBlog->created_at = date("Y-m-d h:i:s");
            $objBlog->updated_at = date("Y-m-d h:i:s");
            return $objBlog->save();
        } else {

            $objBlog = Blog::find($request->input('id'));
            $objBlog->title = $request->input('title');
            $objBlog->category = $request->input('category');
            $objBlog->author = $request->input('author');
            $objBlog->content = $request->input('content');
            $objBlog->created_at = date("Y-m-d h:i:s");
            $objBlog->updated_at = date("Y-m-d h:i:s");
            return $objBlog->save();
        }
    }

    public function viewblog($id) {
        $query = Blog::from('blog')
                ->select('blog.id', 'blog.image', 'blog.title', 'blog.author', 'blog.content', 'blog.category')
                ->where('blog.id', $id)
                ->get();
        return $query[0];
    }

    public function deleteblog($data) {

        $resut = Blog::where('id', $data['id'])->delete();
        if ($resut) {
            return true;
        } else {
            return false;
        }
    }

    public function viewDetails() {
        $query = Blog::from('blog')
                ->select('blog.id', 'blog.image', 'blog.title', 'blog.author', 'blog.content', 'blog.category', 'blog.created_at')
                ->get();
        return $query;
    }
    
    public function viewDetailsFooter() {
        $query = Blog::from('blog')
                ->select('id', 'image', 'title', 'blog.created_at')
                ->orderBy('id', 'DESC')
                ->take(3)
                ->get();
        return $query;
    }

    public function getdatatable() {

        $requestData = $_REQUEST;
        $columns = array(
            // datatable column index  => database column name
            0 => 'id',
            1 => 'title',
        );

        $query = Blog::from('blog');
        if (!empty($requestData['search']['value'])) {   // if there is a search parameter, $requestData['search']['value'] contains search parameter
            $searchVal = $requestData['search']['value'];
            $query->where(function($query) use ($columns, $searchVal, $requestData) {
                $flag = 0;
                foreach ($columns as $key => $value) {
                    $searchVal = $requestData['search']['value'];
                    if ($requestData['columns'][$key]['searchable'] == 'true') {
                        if ($flag == 0) {
                            $query->where($value, 'like', '%' . $searchVal . '%');
                            $flag = $flag + 1;
                        } else {
                            $query->orWhere($value, 'like', '%' . $searchVal . '%');
                        }
                    }
                }
            });
        }

        $temp = $query->orderBy($columns[$requestData['order'][0]['column']], $requestData['order'][0]['dir']);

        $totalData = count($temp->get());
        $totalFiltered = count($temp->get());

        $resultArr = $query->skip($requestData['start'])
                ->take($requestData['length'])
                ->select('blog.id', 'blog.image', 'blog.title', 'blog.content', 'blog.author', 'blog_category.name')
                ->leftjoin('blog_category', 'blog_category.id', '=', 'blog.category')
                ->get();
        $data = array();
        $i = 0;
        foreach ($resultArr as $row) {

            $imagepath = url('public/uploads/blog/' . $row['image']);
            $actionhtml = '';
            $actionhtml = '<center><a href="" data-toggle="modal" data-target="#editmodel" class="btn btn-icon btn-outline-success editblog" data-id="' . $row["id"] . '"><i class="feather icon-edit" ></i></a>
                        <a href="" data-toggle="modal" data-target="#deletemodel" class="btn btn-icon btn-outline-danger deleteblog" data-id="' . $row["id"] . '" ><i class="feather icon-trash-2" ></i></a></center>';
            $i++;
            $nestedData = array();
            $nestedData[] = '<center>' . $i . '</center>';
            $nestedData[] = '<center><img src="' . $imagepath . '" alt="contact-img" title="contact-img" class="rounded mr-3" height="48"></center>';
            $nestedData[] = '<center>' . $row['title'] . '</center>';
            $nestedData[] = '<center>' . $row['name'] . '</center>';
            $nestedData[] = '<center>' . $row['author'] . '</center>';
            $nestedData[] = '<center>' . $row['content'] . '</center>';
            $nestedData[] = $actionhtml;
            $data[] = $nestedData;
        }
        $json_data = array(
            "draw" => intval($requestData['draw']), // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
            "recordsTotal" => intval($totalData), // total number of records
            "recordsFiltered" => intval($totalFiltered), // total number of records after searching, if there is no searching then totalFiltered = totalData
            "data" => $data   // total data array
        );
        return $json_data;
    }

}
