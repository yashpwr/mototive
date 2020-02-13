@extends('frontend.layout.app')
@section('content')
<section class="background_bg breadcrumb_section overlay_bg2 page-title-light" data-img-src="{{ url('public/frontend/assets/images/portfolio_signle_bg1.jpg') }}">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="page-title">
                    <h1>Portfolio</h1>
                </div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="{{ asset('/') }}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ asset('portfolio') }}">Portfolio</a></li>
                        <li class="breadcrumb-item">Read More</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION BANNER --> 

<!-- START SECTION PORTFOLIO DETAIL -->
<section class="small_pb">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-7 mb-4 mb-md-0 animation" data-animation="fadeInUp" data-animation-delay="0.2s">
                <h5>{{ $details[0]->short_description }}</h5>
                <p>{{ $details[0]->description }}</p>
                <a href="{{ $details[0]->livelink }}" class="btn btn-outline-black btn-sm">Launch Website</a>
            </div>
            <div class="col-lg-4 col-md-5 animation" data-animation="fadeInUp" data-animation-delay="0.4s">
                <div class="bg_blue p-3 p-md-4">
                    <ul class="list_none portfolio_info_box pr_info_text_white">
                        <li><span class="text-uppercase">Project Name</span>{{ $details[0]->name }}</li>
                        <li><span class="text-uppercase">Project Technology</span>{{ $details[0]->technology }}</li>
                        <li><span class="text-uppercase">Category</span>{{ $details[0]->type }}</li>

                        <li><span class="text-uppercase">PROJECT link</span>{{ substr($details[0]->livelink, strpos($details[0]->livelink, "w") + 0) }}</li>
<!--                        <li><span class="text-uppercase">SHARE </span>
                            <ul class="list_none social_icons border_social social_white rounded_social">
                                <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                                <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                                <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                                <li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
                                <li><a href="#"><i class="ion-social-pinterest"></i></a></li>
                            </ul>
                        </li>-->
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION PORTFOLIO DETAIL -->

<!-- START SECTION PORTFOLIO SLIDER -->
<section class="small_pt">
    <div class="container">
        <div class="row">	
            <div class="col-md-12 animation" data-animation="fadeInUp" data-animation-delay="0.2s">
                <ul class="list_none carousel_slide1 owl-carousel owl-theme" data-autoheight="true" data-margin="15" data-dots="false" data-nav="true" data-loop="true" data-autoplay-timeout="3000">
                    @for($i = 0; $i < count($details); $i++ )
                    <li>
                        <img height="500px" src="{{ url('public/uploads/portfolio/'.$details[$i]->image_name) }}" alt="image">
                    </li>
                    @endfor
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION PORTFOLIO SLIDER -->

@endsection