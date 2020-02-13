<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;

class Blog_category extends Model {

    protected $table = "blog_category";

    public function addCategory($request) {

        $objblogcategory = new Blog_category();
        $objblogcategory->name = $request->input('name');
        $objblogcategory->created_at = date("Y-m-d h:i:s");
        $objblogcategory->updated_at = date("Y-m-d h:i:s");
        return $objblogcategory->save();
    }

    public function viewblogcategory() {

        $objblogcategory = new Blog_category();
        $result = Blog_category::select('id', 'name')->get();
        return $result;
    }

    public function viewDetails($id) {

        $objblogcategory = new Blog_category();
        $result = Blog_category::select('id', 'name')->where('id', $id)->get();
        return $result[0];
    }

    public function editblog_category($request) {

        $objblogcategory = Blog_category::find($request->input('id'));
        $objblogcategory->name = $request->input('name');
        $objblogcategory->created_at = date("Y-m-d h:i:s");
        $objblogcategory->updated_at = date("Y-m-d h:i:s");
        return $objblogcategory->save();
    }

    public function deletetype($data) {

        $resut = Blog_category::where('id', $data['id'])->delete();
        if ($resut) {
            return true;
        } else {
            return false;
        }
    }

    public function getdatatable() {
        $requestData = $_REQUEST;
        $columns = array(
            // datatable column index  => database column name
            0 => 'id',
            1 => 'type',
        );

        $query = Blog_category::from('blog_category');
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
                ->select('id', 'name')
                ->get();
        $data = array();
        $i = 0;
        foreach ($resultArr as $row) {

            $actionhtml = '';
            $actionhtml = '<center><a href="" data-toggle="modal" data-target="#editmodel" class="btn btn-icon btn-outline-success edittype" data-id="' . $row["id"] . '"><i class="feather icon-edit" ></i></a>
                        <a href="" data-toggle="modal" data-target="#deletemodel" class="btn btn-icon btn-outline-danger deletetype" data-id="' . $row["id"] . '" ><i class="feather icon-trash-2" ></i></a></center>';
            $i++;
            $nestedData = array();
            $nestedData[] = '<center>' . $i . '</center>';
            $nestedData[] = '<center>' . $row['name'] . '</center>';
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
