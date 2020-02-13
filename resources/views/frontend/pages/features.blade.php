@extends('frontend.layout.app')
@section('content')
<section class="background_bg breadcrumb_section overlay_bg2 page-title-light" data-img-src="{{ url('public/frontend/assets/images/banner15.jpg') }}">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="page-title">
                    <h1>Features</h1>
                </div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="{{ asset('/') }}">Home</a></li>
                        <li class="breadcrumb-item">Features</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<section class="small_pt small_pb">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="heading_s3">
                    <h5>Our Features</h5>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text_white text-center">
                <div class="cta_section_small bg_blue">
                    <h2 class="">On Time Delivery</h2>
                    <p>Mototive Websolution are committed to provide customers a homely solutions for their business. We always maintain long term relation with our client's.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="small_pt small_pb">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text_white text-center">
                <div class="cta_section_small bg_blue">
                    <h2 class="">Field work</h2>
                    <p>Field work is a first priority for our team.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="small_pt small_pb">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text_white text-center">
                <div class="cta_section_small bg_blue">
                    <h2 class="">Latest Technologies</h2>
                    <p>We keep our technologies updated to provide our best output for the client's and customer.</p>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection