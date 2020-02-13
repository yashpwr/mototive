<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use App\model\Sendmail;

class SendSMS extends Model {

    public function sendMailltesting($request) {

        $mailData['data'] = $request;
        $mailData['subject'] = 'From Mototive Web Solution Contact Us';
        $mailData['attachment'] = array();
        $mailData['template'] = "email.contactus";
        $mailData['mailto'] = 'mandaliyabansi123@gmail.com';
        $sendMail = new Sendmail;
        return $sendMail->sendSMTPMail($mailData);
    }

}
