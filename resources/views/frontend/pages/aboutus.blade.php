@extends('frontend.layout.app')
@section('content')
<!-- START SECTION BANNER -->
<section class="background_bg breadcrumb_section overlay_bg2 page-title-light" data-img-src="{{ url('public/frontend/assets/images/about_bg.jpg') }}">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="page-title">
                    <h1>About Us</h1>
                </div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="{{ asset('/') }}">Home</a></li>
                        <li class="breadcrumb-item">About Us</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION BANNER --> 

<!-- START SECTION ABOUT US -->
<section class="small_pb overflow_hide">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-sm-12 p-lg-0 animation" data-animation="fadeInLeft" data-animation-delay="0.2s">
                <div class="small_padding bg-dark h-100 text_white d-lg-flex justify-content-center flex-lg-column">
                    <div class="heading_s3 mb-3"> 
                        <h3>About The MOTOTIVE</h3>
                    </div>
                    <p>We help you to transform your business by creating digital products with innovative ideas. We have nearly 60 clients who use our services regularly.</p>
                    <p>Our culture drives us and our values define us. Come discover Hidden Brains - the best platform to take your career to new heights.</p>
                </div>
            </div>
            <div class="col-lg-4 p-lg-0 animation" data-animation="zoomIn" data-animation-delay="0.2s">
                <div class="h-100 background_bg md-height-300" data-img-src="{{ url('public/frontend/assets/images/about_img7.jpg') }}"></div>
            </div>
            <div class="col-lg-4 p-lg-0 animation" data-animation="fadeInRight" data-animation-delay="0.2s">
                <div class="small_padding bg-dark h-100 text_white d-lg-flex justify-content-center flex-lg-column">
                    <div class="skill_content pr_style1">
                        <div class="progrees_bar_text">
                            <b>Web Hosting</b>
                        </div>
                        <div class="progress">
                            <div class="count_pr"><span class="counter">70</span>%</div>
                            <div class="progress-bar d-block" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
                            </div>
                        </div>
                    </div>
                    <div class="skill_content pr_style1">
                        <div class="progrees_bar_text">
                            <b>Development</b>
                        </div>
                        <div class="progress">
                            <div class="count_pr"><span class="counter">50</span>%</div>
                            <div class="progress-bar d-block" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                            </div>
                        </div>
                    </div>
                    <div class="skill_content pr_style1">
                        <div class="progrees_bar_text">
                            <b>Web Design</b>
                        </div>
                        <div class="progress">
                            <div class="count_pr"><span class="counter">80</span>%</div>
                            <div class="progress-bar d-block" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                            </div>
                        </div>
                    </div>
                    <div class="skill_content pr_style1">
                        <div class="progrees_bar_text">
                            <b>Marketing</b>
                        </div>
                        <div class="progress">
                            <div class="count_pr"><span class="counter">40</span>%</div>
                            <div class="progress-bar d-block" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                            </div>
                        </div>
                    </div>
                    <div class="skill_content pr_style1">
                        <div class="progrees_bar_text">
                            <b>Bussiness Strategy</b>
                        </div>
                        <div class="progress">
                            <div class="count_pr"><span class="counter">60</span>%</div>
                            <div class="progress-bar d-block" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION ABOUT US --> 

<!-- START SECTION FEATURE -->
<section class="small_pt">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-12 col-sm-12 mb-3 mb-lg-0 animation" data-animation="fadeInUp" data-animation-delay="0.2s">
                <div class="heading_s3 mb-3"> 
                    <h3>Why Choose Us</h3>
                </div>
                <p>MOTOTIVE WEB Solutions is a IT solution provider who values our relationships with clients. Strong, positive relationships.
                    We help you manage risks and build confidence in your technology systems.</p>
                <div class="list_style_4 color_blue">
                    <ul>
                        <li>Focus on innovation</li>
                        <li>True partners</li>
                        <li>Dedicated teams</li>
                        <li>Respect of the client needs</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-7 col-md-12 col-sm-12"> 
                <div class="row">
                    <div class="col-xl-6 col-lg-12 col-sm-6 animation" data-animation="fadeInUp" data-animation-delay="0.4s">
                        <div class="icon_box icon_box_style_2 mt-3">
                            <div class="box_icon">	
                                <i class="icon icon-sphere"></i>
                            </div>
                            <div class="icon_box_content">
                                <h5>Web Services</h5>
                                <p>Web services is a standardized way or medium to propagate communication between the client and server applications on the world wide web.</p>
                            </div>
                        </div>
                        <div class="icon_box icon_box_style_2 mt-3">
                            <div class="box_icon">	
                                <i class="icon icon-android"></i>
                            </div>
                            <div class="icon_box_content">
                                <h5>Android app development</h5>
                                <p>Our company provides android application development, shopping cart integration along with domain registration.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-12 col-sm-6 animation" data-animation="fadeInUp" data-animation-delay="0.5s">
                        <div class="icon_box icon_box_style_2 mt-3">
                            <div class="box_icon">	
                                <i class="icon icon-mobile"></i>
                            </div>
                            <div class="icon_box_content">
                                <h5>IOS app development</h5>
                                <p>Manage critical business processes with ease. Integrate seamlessly with other apps. Gain freedom from buggy, poorly coded apps.</p>
                            </div>
                        </div>
                        <div class="icon_box icon_box_style_2 mt-3">
                            <div class="box_icon">	
                                <i class="icon icon-embed2"></i>
                            </div>
                            <div class="icon_box_content">
                                <h5>Html / Css / Java / PHP / Laravel </h5>
                                <p>Responsive Website Development. Bootstrap Advance Java Script / Angular JS Development. Client Communication.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-12 col-sm-6 animation" data-animation="fadeInUp" data-animation-delay="0.5s">
                        <div class="icon_box icon_box_style_2 mt-3">
                            <div class="box_icon">	
                                <i class="fas fa-headset"></i>
                            </div>
                            <div class="icon_box_content">
                                <h5>Expert Support</h5>
                                <p>MOTOTIVE Expert support help businesses and individuals use technology to keep their Businsess running smoothly.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-12 col-sm-6 animation" data-animation="fadeInUp" data-animation-delay="0.5s">
                        <div class="icon_box icon_box_style_2 mt-3">
                            <div class="box_icon">	
                                <i class="icon icon-cog"></i>
                            </div>
                            <div class="icon_box_content">
                                <h5>Easy To Customize</h5>
                                <p>We provides easy customization on web services, android application and ios application. Depending on client's demand.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION FEATURE -->

<!-- START SECTION COUNTER --> 
<section class="counter_wrap light_gray_bg">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-md-5 text-center text-md-left mb-4 mb-md-0 animation" data-animation="fadeInUp" data-animation-delay="0.2s">
                <div class="heading_s3 mb-3 text-center text-md-left">
                    <h3>Get to know us!</h3>
                </div>
                <p>With every great company you'll find great people. MOTOTIVE WEB SOLUTION is no exception. Our team of experts will help design the right solutions for you.</p>
                <a href="#" class="btn btn-outline-black">know More</a>
            </div>
            <div class="col-lg-6 offset-lg-1 col-md-7 col-sm-12 col-11 animation" data-animation="fadeInUp" data-animation-delay="0.4s">
                <div class="row overflow_hide">
                    <div class="col-6 couter_border counter_border_black">
                        <div class="box_counter counter_style1 counter_dark text-center">
                            <i class="ion-coffee"></i>
                            <h3 class="counter_text"><span class="counter">400</span>+</h3>
                            <p>Cups of Coffee</p>
                        </div>
                    </div>
                    <div class="col-6 couter_border counter_border_black">
                        <div class="box_counter counter_style1 counter_dark text-center">
                            <i class="ion-clock"></i>
                            <h3 class="counter_text"><span class="counter">2400</span></h3>
                            <p>Hours of Development</p>
                        </div>
                    </div>
                    <div class="col-6 couter_border counter_border_black">
                        <div class="box_counter counter_style1 counter_dark text-center">
                            <i class="ion-easel"></i>
                            <h3 class="counter_text"><span class="counter">75</span>+</h3>
                            <p>Project Complete</p>
                        </div>
                    </div>
                    <div class="col-6 couter_border counter_border_black">
                        <div class="box_counter counter_style1 counter_dark text-center">
                            <i class="ion-android-contacts"></i>
                            <h3 class="counter_text"><span class="counter">60</span>+</h3>
                            <p>Happy Clients</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION COUNTER -->

<!-- START SECTION TESTIMONIAL -->
<section class="small_pb">	
    <div class="container">
        <div class="row">
            <div class="col-md-12 animation" data-animation="fadeInUp" data-animation-delay="0.2s">
                <div class="heading_s3 text-center">
                    <h3>Our Clients Say!</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="cleafix small_divider"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 animation" data-animation="fadeInUp" data-animation-delay="0.4s">
                <div class="testimonial_slider testimonial_style4 carousel_slide2 owl-carousel owl-theme" data-margin="30" data-loop="true" data-autoplay="true">
                    <div class="item">
                        <div class="testimonial_box">
                            <div class="testimonial_img">
                                <img class="rounded-circle m-auto" src="{{ url('public/frontend/assets/images/user1.jpg') }}" alt="user"/>
                            </div>
                            <div class="testi_meta">
                                <h6>Lissa Castro</h6>
                                <span>Co-Founder</span>
                                <p>Great work!!! The team was solid, efficient and knowledgeable. They did an amazing job on my very challenging app. I will be using them again. Thank you for doing such a great job!</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial_box">
                            <div class="testimonial_img">
                                <img class="rounded-circle m-auto" src="{{ url('public/frontend/assets/images/user2.jpg') }}" alt="user"/>
                            </div>
                            <div class="testi_meta">
                                <h6>Alden Smith</h6>
                                <span>Creative Designer</span>
                                <p>MOTOTIVE WEB Solutions has done a great job taking our company’s idea and developing a website as per our niche specifications. The team is technically strong and creative. I will not hesitate to recommend them.</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial_box">
                            <div class="testimonial_img">
                                <img class="rounded-circle m-auto" src="{{ url('public/frontend/assets/images/user3.jpg') }}" alt="user"/>
                            </div>
                            <div class="testi_meta">
                                <h6>Daisy Lana</h6>
                                <span>Creative Director</span>
                                <p>We got our APP delivered on time. we are quite happy with the work. I see a great future for this company. Keep making happy clients</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial_box">
                            <div class="testimonial_img">
                                <img class="rounded-circle m-auto" src="{{ url('public/frontend/assets/images/user4.jpg') }}" alt="user"/>
                            </div>
                            <div class="testi_meta">
                                <h6>Alfred Amos</h6>
                                <span>Creative Director</span>
                                <p>It has been an easy ride being associated with MOTOTIVE. They provide wide range of solutions for all spheres of our business. Their softwares are user friendly and the MOTOTIVE team is readily available 24*7 for support.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION TESTIMONIAL -->
<!-- START SECTION CALL TO ACTION -->
<section class="small_pt">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="cta_section_small background_bg blue_overlay_bg position-relative fixed_bg animation" data-animation="fadeInUp" data-animation-delay="0.2s" data-img-src="{{ url('public/frontend/assets/images/cta_bg.jpg') }}">
                    <div class="row align-items-center">
                        <div class="col-md-8 text_white">
                            <h2 class="">We always stay with you.</h2>
                            <p class="mb-md-0">We provide a broad range of software development services to help you.</p>
                        </div>
                        <div class="col-md-4 text-md-right">	
                            <a href="{{ route('contactus') }}" class="btn btn-outline-white">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION CALL TO ACTION -->

<!-- START SECTION CLIENT LOGO -->
<section class="small_pt small_pb light_gray_bg">
    <div class="container">
        <div class="row">
            <div class="col-md-12 animation" data-animation="fadeInUp" data-animation-delay="0.2s">
                <div class="cl_logo_slider owl-carousel owl-theme" data-margin="30" data-loop="true" data-autoplay="true" data-dots="false" data-autoplay-timeout="2000">
                    <div class="item">
                        <a href="#"><img src="{{ url('public/frontend/assets/images/cl_logo1.png') }}" alt="cl_logo1"/></a>
                    </div>
                    <div class="item">
                        <a href="#"><img src="{{ url('public/frontend/assets/images/cl_logo2.png') }}" alt="cl_logo2"/></a>
                    </div>
                    <div class="item">
                        <a href="#"><img src="{{ url('public/frontend/assets/images/cl_logo3.png') }}" alt="cl_logo3"/></a>
                    </div>
                    <div class="item">
                        <a href="#"><img src="{{ url('public/frontend/assets/images/cl_logo4.png') }}" alt="cl_logo4"/></a>
                    </div>
                    <div class="item">
                        <a href="#"><img src="{{ url('public/frontend/assets/images/cl_logo5.png') }}" alt="cl_logo5"/></a>
                    </div>
                    <div class="item">
                        <a href="#"><img src="{{ url('public/frontend/assets/images/cl_logo6.png') }}" alt="cl_logo6"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- START SECTION CLIENT LOGO -->

<!-- START SECTION CONTACT -->
<!-- END SECTION CONTACT -->
@endsection