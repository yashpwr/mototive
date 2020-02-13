@extends('frontend.layout.app')
@section('content')
<!-- START SECTION BANNER -->
<section class="background_bg breadcrumb_section overlay_bg2 page-title-light" data-img-src="{{ url('public/frontend/assets/images/contact-bg.jpg') }}">
	<div class="container">
    	<div class="row">
        	<div class="col-md-12 text-center">
            	<div class="page-title">
            		<h1>Contact</h1>
                </div>
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="{{ asset('/') }}">Home</a></li>
                    <li class="breadcrumb-item">Contact Us</li>
                  </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION BANNER -->

<!-- START SECTION CONTACT -->
<section>
	<div class="container">
    	<div class="row">
        	<div class="col-lg-4 col-md-6 animation" data-animation="fadeInUp" data-animation-delay="0.2s">
            	<div class="heading_s2">
                	<span class="sub_title">Contact Us</span>
                	<h2>Get In touch</h2>
                </div>
                <p>Present your information in a unique way. </p>
                <ul class="contact_info contact_info_style1 list_none">
                    <li>
                        <span class="ti-location-pin"></span>
                        <address>G-106 Titanium City Center, Satellite, Ahmedabad, Gujarat, India</address>
                    </li>
                    <li>
                        <span class="ti-email"></span>
                        <a href="mailto: info@mototivewebsolution.com"> info@mototivewebsolution.com</a>
                    </li>
                    <li>
                        <span class="ti-mobile"></span>
                        <p>+91 88666 20260</p>
                    </li>
                </ul>
                <span id="map" class="btn btn-outline-black mt-3">View Map</span>
            </div>
            <div class="col-lg-8 col-md-6 animation" data-animation="fadeInUp" data-animation-delay="0.4s">
            	<div class="clearfix large_divider d-none d-md-block"></div>
                <div class="clearfix medium_divider d-xl-none"></div>
            	<div class="form-group">
                        <form method="post" id="contactusform" action="{{ route('contactus') }}">{{ csrf_field() }}
                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <input placeholder="Enter Name" id="name" class="form-control" name="name" type="text">
                                </div>
                                <div class="form-group col-lg-6">
                                    <input  placeholder="Enter Email" id="email" class="form-control" name="email" type="email">
                                </div>
                                <div class="form-group col-lg-6">
                                    <input  placeholder="Enter Phone No." id="mobile" class="form-control" name="mobile" type="phone">
                                </div>
                                <div class="form-group col-lg-6">
                                    <input placeholder="Enter Subject" id="subject" class="form-control" name="subject" type="subject">
                                </div>
                                <div class="form-group col-lg-12">
                                    <textarea  placeholder="Message" id="message" class="form-control" name="message" rows="4"></textarea>
                                </div>
                                <div class="col-lg-12">
                                    <button type="submit" title="Submit Your Message!" class="btn btn-default" id="submitbtn" name="submit" value="Submit">Submit</button>
                                </div>
                                <div class="col-lg-12">
                                    <div id="alert-msg" class="alert-msg text-center"></div>
                                </div>
                            </div>
                    </form>		
                    </div>
                <div class="map">
                	<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1836.1645697474746!2d72.5222322!3d23.0116842!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e85d10985e8e9%3A0x414d09be4caf2ec9!2sTitanium%20City%20Center%20(A%20To%20H%20Block)!5e0!3m2!1sen!2sin!4v1573213197668!5m2!1sen!2sin" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION CONTACT -->
@endsection
