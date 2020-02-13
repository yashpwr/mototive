<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;

class Project_type extends Model {

    protected $table = "project_type";

    public function addProjectType($request) {

        $objProject = new Project_type();
        $objProject->type = $request->input('type');
        $objProject->created_at = date("Y-m-d h:i:s");
        $objProject->updated_at = date("Y-m-d h:i:s");
        return $objProject->save();
    }

    public function gettype() {
        $query = Project_type::select('type', 'id')
                ->get();
        return $query;
    }
    
    public function viewtype($id) {
        $query = Project_type::from('project_type')
                ->where('id', $id)
                ->select('type', 'id')
                ->get();
        return $query[0];
    }

    public function editproject_type($request) {

        $objProject = Project_type::find($request->input('id'));
        $objProject->type = $request->input('type');
        $objProject->created_at = date("Y-m-d h:i:s");
        $objProject->updated_at = date("Y-m-d h:i:s");
        return $objProject->save();
    }

    public function deletetype($data) {

        $resut = Project_type::where('id', $data['id'])->delete();
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

        $query = Project_type::from('project_type');
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
                ->select('id', 'type')
                ->get();
        $data = array();
        $i = 0;
        foreach ($resultArr as $row) {


            $type = $row['type'];
            $actionhtml = '';
            $actionhtml = '<center><a href="" data-toggle="modal" data-target="#editmodel" class="btn btn-icon btn-outline-success edittype" data-id="' . $row["id"] . '"><i class="feather icon-edit" ></i></a>
                        <a href="" data-toggle="modal" data-target="#deletemodel" class="btn btn-icon btn-outline-danger deletetype" data-id="' . $row["id"] . '" ><i class="feather icon-trash-2" ></i></a></center>';
            $i++;
            $nestedData = array();
            $nestedData[] = '<center>' . $i . '</center>';
            $nestedData[] = '<center>' . $type . '</center>';
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
