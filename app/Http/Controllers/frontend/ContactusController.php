<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\model\Inquiry;
use App\model\SendSMS;


class ContactusController extends Controller {

    function __construct() {
        
    }

    public function contactus(Request $request) {

        if ($request->isMethod('post')) {

            $objInquiry = new Inquiry();
            $result = $objInquiry->contactus($request);
            $objSendSms = new SendSMS();
            $sendSMS = $objSendSms->sendMailltesting($request);
            if ($result) {
                $return['status'] = 'success';
                $return['message'] = 'Thanks for contact us. We will get you soon...';
                $return['redirect'] = route('contactus');
            } else {
                $return['status'] = 'error';
                $return['message'] = 'Category already exist.';
            }
            return json_encode($return);
            exit;
        }
        $data['title'] = 'Mototive Websolution - Contact us';
        $data['css'] = array();
        $data['plugincss'] = array();
        $data['pluginjs'] = array('jquery.validate.min.js');
        $data['js'] = array('ajaxfileupload.js', 'jquery.form.min.js', 'contactus.js');
        $data['funinit'] = array('Contactus.init()');
        return view('frontend.pages.contactus', $data);
    }

}
