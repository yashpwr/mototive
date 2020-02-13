@extends('frontend.layout.app')
@section('content')
<!-- START SECTION BANNER -->
<section class="page-title-light breadcrumb_section gray_bg background_bg overlay_bg2" data-img-src="{{ url('public/frontend/assets/images/breadcrumb_bg.jpg') }}">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <div class="page-title">
                    <h1>Blog</h1>
                </div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="{{ asset('/') }}">Home</a></li>
                        <li class="breadcrumb-item">Blog</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION BANNER --> 

<!-- START SECTION BLOG -->
<section>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-9">
                <div class="row blog_thumbs">
                    @foreach($blog as $value)
                    <div class="col-md-12 mb-md-4 mb-2 pb-2">
                        <div class="blog_post">
                            <div class="blog_img">
                                <a href="#">
                                    <img src="{{ url('public/uploads/blog/', $value->image) }}" alt="blog_small_img2_350X198">
                                </a>
                            </div>
                            <div class="blog_content bg-white">
                                <div class="blog_text">
                                    <h6 class="blog_title"><a href="#">{{ $value->title }}</a></h6>
                                    <ul class="list_none blog_meta">
                                        @php $time = strftime( '%Y-%m-%d', strtotime( $value->created_at) );;@endphp
                                        <li><a href="#"><i class="ion-calendar"></i>{{ ' '.$time }}</a></li>
                                        <li><a href="#"><i class="ion-chatboxes"></i> 2 Comment</a></li>
                                    </ul>
                                    <p>{{ substr($value->content, 0, 150).' .....' }}</p>
                                    <a href="{{ route('blogreadmore', $value->id) }}" class="text-capitalize">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    @Endforeach
                </div>
                <div class="row">
                    <div class="col-12 mt-4">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1"><i class="ion-ios-arrow-thin-left"></i></a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#"><i class="ion-ios-arrow-thin-right"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION BLOG -->
@endsection