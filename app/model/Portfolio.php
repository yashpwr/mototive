<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use App\model\Portfolio_image;
use DB;
use Route;

class Portfolio extends Model {

    protected $table = "portfolio";

    public function getPortfoliodetails() {

        $result = Portfolio::select('portfolio.id', 'portfolio.name', 'portfolio.image', 'portfolio.short_description', 'project_type.type')
                ->leftjoin('project_type', 'project_type.id', '=', 'portfolio.category')
                ->get();
        return $result;
    }
    
    public function getPortfolio($request, $id) {

        $result = Portfolio::select('portfolio.id', 'portfolio.name', 'portfolio.image', 'portfolio.technology', 'portfolio.livelink', 'portfolio.short_description', 'portfolio.description', 'portfolio.category', 'portfolio_image.image_name')
                ->leftjoin('portfolio_image', 'portfolio_image.portfolio_id', '=', 'portfolio.id')
                ->where('portfolio.id', $id)
                ->get();
        return $result;
    }

    public function readmorePortfoliodetails($request, $id) {

        $result = Portfolio::select('portfolio.id', 'portfolio.name', 'portfolio.image', 'portfolio.technology', 'portfolio.livelink', 'portfolio.short_description', 'portfolio.description', 'project_type.type', 'portfolio_image.image_name')
                ->leftjoin('portfolio_image', 'portfolio_image.portfolio_id', '=', 'portfolio.id')
                ->leftjoin('project_type', 'project_type.id', '=', 'portfolio.category')
                ->where('portfolio.id', $id)
                ->get();
        return $result;
    }

    public function addPortfolio($request) {
        $objPortfolio = new Portfolio();

        $image = $request->file('image');
        $name = time() . '.' . $image->getClientOriginalExtension();
        $destinationPath = public_path('/uploads/portfolio/');
        $image->move($destinationPath, $name);

        $objPortfolio->image = $name;
        $objPortfolio->name = $request->input('name');
        $objPortfolio->category = $request->input('type');
        $objPortfolio->technology = $request->input('technology');
        $objPortfolio->livelink = $request->input('link');
        $objPortfolio->short_description = $request->input('short');
        $objPortfolio->description = $request->input('description');
        $objPortfolio->save();
        $result = $objPortfolio->id;

        if ($result != '' && $request->file() && $request->file('addimage') != '') {
            for ($i = 0; $i < count($request->file('addimage')); $i++) {

                $image = $request->file('addimage')[$i];
                $name = time() . $i . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('/uploads/portfolio/');
                $image->move($destinationPath, $name);
                $objProduct = new Portfolio_image();
                $objProduct->portfolio_id = $result;
                $objProduct->image_name = $name;
                $result = $objProduct->save();
            }
        }
        if ($result) {
            $return['status'] = 'success';
            $return['message'] = 'portfolio created successfully.';
        } else {
            $return['status'] = 'error';
            $return['message'] = 'something wrong';
            $return['redirect'] = route('portfolio');
        }
        return $return;
    }

    public function editPortfolio($request, $id) {

        $objPortfolio = Portfolio::find($id);
        if ($request->file('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/uploads/portfolio/');
            $image->move($destinationPath, $name);
            $objPortfolio->image = $name;
        }

        $objPortfolio->name = $request->input('name');
        $objPortfolio->category = $request->input('type');
        $objPortfolio->technology = $request->input('technology');
        $objPortfolio->livelink = $request->input('link');
        $objPortfolio->short_description = $request->input('short');
        $objPortfolio->description = $request->input('description');
        $result = $objPortfolio->save();

        if ($result != '' && $request->file() && $request->file('addimage') != '') {
            DB::table('portfolio_image')
                    ->where('portfolio_id', $id)->delete();
            for ($i = 0; $i < count($request->file('addimage')); $i++) {

                $image = $request->file('addimage')[$i];
                $name = time() . $i . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('/uploads/portfolio/');
                $image->move($destinationPath, $name);
                $objProduct = new Portfolio_image();
                $objProduct->portfolio_id = $id;
                $objProduct->image_name = $name;
                $result = $objProduct->save();
            }
        }
        if ($result) {
            $return['status'] = 'success';
            $return['message'] = 'portfolio created successfully.';
        } else {
            $return['status'] = 'error';
            $return['message'] = 'something wrong';
            $return['redirect'] = route('portfolio');
        }
        return $return;
    }

    public function deleteportfolio($data) {

        $resut = Portfolio::where('id', $data['id'])->delete();
        DB::table('portfolio_image')
                ->where('portfolio_id', $data['id'])->delete();
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
            1 => 'name',
        );

        $query = Project_type::from('portfolio');
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
                ->select('portfolio.id', 'portfolio.name', 'portfolio.image', 'portfolio.category', 'portfolio.technology', 'portfolio.livelink', 'portfolio.short_description', 'portfolio.description')
                ->get();
        $data = array();
        $i = 0;
        foreach ($resultArr as $row) {

            $imagepath = url('public/uploads/portfolio/' . $row['image']);
            $actionhtml = '';
            $actionhtml = '<center><a href="' . route('editportfolio', $row['id']) . '" class="btn btn-icon btn-outline-success"><i class="feather icon-edit" ></i></a>
                        <a href="" data-toggle="modal" data-target="#deletemodel" class="btn btn-icon btn-outline-danger deletetype" data-id="' . $row["id"] . '" ><i class="feather icon-trash-2" ></i></a></center>';
            $i++;
            $nestedData = array();
            $nestedData[] = '<center>' . $i . '</center>';
            $nestedData[] = '<center>' . $row['name'] . '</center>';
            $nestedData[] = '<center><img src="' . $imagepath . '" alt="contact-img" title="contact-img" class="rounded mr-3" height="48"></center>';
            $nestedData[] = '<center>' . $row['short_description'] . '</center>';
            $nestedData[] = '<center>' . substr($row['description'], 0, 20) . '....' . '</center>';
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
