@php
$currRoute = Route::current()->getName();
@endphp
<header class="header_wrap fixed-top light_skin hover_menu_style2 transparent-header">
    <div class="top-header light_skin d-none d-md-block">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <ul class="contact_detail list_none text-center text-md-left">
                        <li><i class="ti-mobile"></i>+91 88666 20260</li>
                        <li><i class="ti-email"></i> info@mototivewebsolution.com</li>
                        <li><i class="ti-skype"></i> mototive Websolution</li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list_none social_icons text-center border_social rounded_social social_white  text-md-right mt-2 mt-md-0">
                        <li><a target="_blank" href="https://www.facebook.com/mototive.websolution.73"><i class="ion-social-facebook"></i></a></li>
                        <li><a target="_blank" href="https://twitter.com/MototiveW"><i class="ion-social-twitter"></i></a></li>
                        <li><a  href="#"><i class="ion-social-googleplus"></i></a></li>
                        <li><a target="_blank" href="https://www.linkedin.com/in/mototive-web-solution/"><i class="ion-social-linkedin-outline"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container p-t-0">
        <nav class="navbar navbar-expand-lg"> 
            <a class="navbar-brand" href="{{ asset('/') }}">
                <img style="height: 125px;" class="logo_light" src="{{ url('public/frontend/assets/images/logo_white.png') }}" alt="logo" />
                <img style="height: 125px;" class="logo_dark" src="{{ url('public/frontend/assets/images/logo.png') }}" alt="logo" />
                <img style="height: 125px;" class="logo_default" src="{{ url('public/frontend/assets/images/logo.png') }}" alt="logo" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="ion-android-menu"></span> </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="dropdown dropdown-mega-menu">
                        <a class="nav-link {{ ($currRoute == 'home')  ? 'active' : '' }}" href="{{ asset('/') }}">Home</a>  
                    </li>
                    <li class=" dropdown-mega-menu">
                        <a class="nav-link {{ ($currRoute == 'services')  ? 'active' : '' }}" href="{{ route('services') }}">Services</a>  
                    </li>
                    <li class="dropdown dropdown-mega-menu">
                        <a class="nav-link {{ ($currRoute == 'portfolio' || $currRoute == "portfolioreadmore" )  ? 'active' : '' }}" href="{{ route('portfolio') }}">Portfolio</a>  
                    </li>
                    <li class="dropdown dropdown-mega-menu">
                        <a class="nav-link {{ ($currRoute == 'aboutus')  ? 'active' : '' }}" href="{{ route('aboutus') }}">About Us</a>  
                    </li>
                    <li class="dropdown dropdown-mega-menu">
                        <a class="nav-link {{ ($currRoute == 'blog' || $currRoute == "blogreadmore")  ? 'active' : '' }}" href="{{ route('blog') }}">Blog</a>  
                    </li>
                    <li class="dropdown dropdown-mega-menu">
                        <a class="nav-link {{ ($currRoute == 'contactus')  ? 'active' : '' }}" href="{{ route('contactus') }}">Contact Us</a>  
                    </li>
                </ul>
            </div>
            @if($currRoute != "contactus")
            <a href="{{ route('contactus') }}" class="btn btn-black  d-none d-sm-block" style='border-radius: 25px;'>Get Started</a>
            @endif
        </nav>
    </div>
</header>