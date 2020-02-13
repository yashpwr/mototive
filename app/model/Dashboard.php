<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use DB;

class Dashboard extends Model
{
    protected $table = 'users'; 
    public function getUserdata($id){
     
        $result = Dashboard::select('name','email')
                ->get();
        return $result;
    }
}
