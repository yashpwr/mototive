<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use DB;

class Inquiry extends Model {

    protected $table = "inquiry";

    public function contactus($request) {
        $objInquiry = new Inquiry();
        $objInquiry->name = $request->input('name');
        $objInquiry->email = $request->input('email');
        $objInquiry->mobile = $request->input('mobile');
        $objInquiry->subject = $request->input('subject');
        $objInquiry->messege = $request->input('message');
        $objInquiry->created_at = date("Y-m-d h:i:s");
        $objInquiry->updated_at = date("Y-m-d h:i:s");
        return $objInquiry->save();
    }

}
