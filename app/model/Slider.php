<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;

class Slider extends Model {

    protected $table = 'slider';

    public function addSlider($request) {

        if ($request->file()) {
            $image = $request->file('sliderimage');
            $name = 'admin' . time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/slider/');
            $image->move($destinationPath, $name);

            $objSlider = new Slider();
            $objSlider->image = $name;
            $objSlider->text = $request->input('text');
            $objSlider->title = $request->input('title');
            $objSlider->created_at = date("Y-m-d h:i:s");
            $objSlider->updated_at = date("Y-m-d h:i:s");
            return $objSlider->save();
        } else {
            return false;
        }
    }

    public function getSlider() {
        $result = Slider::select("id", "image", "text", "title")
                ->get();
        return $result;
    }

    public function editslider($request) {

        if ($request->file()) {

            $image = $request->file('sliderimage');
            $name = 'admin' . time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('uploads/slider/');
            $image->move($destinationPath, $name);

            $objSlider = Slider::find($request->input('id'));
            $objSlider->image = $name;
            $objSlider->text = $request->input('text');
            $objSlider->title = $request->input('title');
            $objSlider->created_at = date("Y-m-d h:i:s");
            $objSlider->updated_at = date("Y-m-d h:i:s");
            return $objSlider->save();
        } else {

            $objSlider = Slider::find($request->input('id'));
            $objSlider->text = $request->input('text');
            $objSlider->title = $request->input('title');
            $objSlider->created_at = date("Y-m-d h:i:s");
            $objSlider->updated_at = date("Y-m-d h:i:s");
            return $objSlider->save();
        }
    }

    public function deleteSlider($data) {

        $resut = Slider::where('id', $data['id'])->delete();
        if ($resut) {
            $path = 'public/uploads/slider/' . $data['sliderimage'];

            if (file_exists($path)) {
                unlink($path);
            }
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
            1 => 'image',
            2 => 'text',
            3 => 'title',
        );

        $query = Slider::from('slider');
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
                ->select('id', 'image', 'text', 'title')
                ->get();
        $data = array();
        $i = 0;
        foreach ($resultArr as $row) {

            $imagepath = url('public/uploads/slider/' . $row['image']);
            $text = $row['text'];
            $title = $row['title'];
            $actionhtml = '';
            $actionhtml = '<center><a href="" data-toggle="modal" data-target="#editmodel" class="btn btn-icon btn-outline-success editslider" data-sliderimage="' . $row["image"] . '"  data-id="' . $row["id"] . '"><i class="feather icon-edit" ></i></a>
                        <a href="" data-toggle="modal" data-target="#deletemodel" class="btn btn-icon btn-outline-danger deleteslider" data-sliderimage="' . $row["image"] . '"  data-id="' . $row["id"] . '" ><i class="feather icon-trash-2" ></i></a></center>';
            $i++;
            $nestedData = array();
            $nestedData[] = '<center>' . $i . '</center>';
            $nestedData[] = '<center><img src="' . $imagepath . '" alt="contact-img" title="contact-img" class="rounded mr-3" height="48"></center>';
            $nestedData[] = '<center>' . $text . '</center>';
            $nestedData[] = '<center>' . $title . '</center>';
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

    public function viewsilder($id) {
        $query = Slider::from('slider')
                ->where('id', $id)
                ->select('image', 'id', 'title', 'text')
                ->get();
        return $query[0];
    }

}
