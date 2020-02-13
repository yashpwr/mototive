@php
$currRoute = Route::current()->getName();
$items = Session::get('logindata');
@endphp
<div class="loader-bg">
    <div class="loader-track">
        <div class="loader-fill"></div>
    </div>
</div>
<!-- [ Pre-loader ] End -->
<!-- [ navigation menu ] start -->
<nav class="pcoded-navbar menu-light ">
    <div class="navbar-wrapper  ">
        <div class="navbar-content scroll-div " >

            <div class="">
                <div class="main-menu-header">
                    <img class="img-radius" src="{{ url('public/backend/assets/images/user/avatar-2.jpg')}}" alt="User-Profile-Image">
                    <div class="user-details">
                        <div id="more-details">ADMIN <i class="fa fa-caret-down"></i></div>
                    </div>
                </div>
                <div class="collapse" id="nav-user-link">
                    <ul class="list-inline">
                        <li class="list-inline-item"><a href="user-profile.html" data-toggle="tooltip" title="View Profile"><i class="feather icon-user"></i></a></li>
                        <li class="list-inline-item"><a href="email_inbox.html"><i class="feather icon-mail" data-toggle="tooltip" title="Messages"></i><small class="badge badge-pill badge-primary">5</small></a></li>
                        <li class="list-inline-item"><a href="{{ route('logout') }}" data-toggle="tooltip" title="Logout" class="text-danger"><i class="feather icon-power"></i></a></li>
                    </ul>
                </div>
            </div>

            <ul class="nav pcoded-inner-navbar ">
                <li class="nav-item pcoded-menu-caption">
                    <label>Navigation</label>
                </li>
                <li class="nav-item {{ ($currRoute == 'admin-dashboard')  ? 'active' : '' }}">
                    <a href="{{ route('admin-dashboard') }}" class="nav-link "><span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">Dashboard</span></a>
                </li>
                <li class="nav-item {{ ($currRoute == 'slider' || $currRoute == 'addslider')  ? 'active' : '' }}">
                    <a href="{{ route('slider') }}" class="nav-link "><span class="pcoded-micon"><i class="feather icon-film"></i></span><span class="pcoded-mtext">Slider</span></a>
                </li>
                <li class="nav-item {{ ($currRoute == 'project-type')  ? 'active' : '' }}">
                    <a href="{{ route('project-type') }}" class="nav-link "><span class="pcoded-micon"><i class="feather icon-command"></i></span><span class="pcoded-mtext">Project-Type</span></a>
                </li>
                <li class="nav-item {{ ($currRoute == 'admin-portfolio' || $currRoute == "addportfolio")  ? 'active' : '' }}">
                    <a href="{{ route('admin-portfolio') }}" class="nav-link "><span class="pcoded-micon"><i class="fa fa-briefcase" aria-hidden="true"></i></span><span class="pcoded-mtext">Portfolio</span></a>
                </li>
                <li class="nav-item {{ ($currRoute == 'blog-category')  ? 'active' : '' }}">
                    <a href="{{ route('blog-category') }}" class="nav-link "><span class="pcoded-micon"><i class="fa fa-list-alt" aria-hidden="true"></i></span><span class="pcoded-mtext">Blog Category</span></a>
                </li>
                <li class="nav-item {{ ($currRoute == 'admin-blog')  ? 'active' : '' }}">
                    <a href="{{ route('admin-blog') }}" class="nav-link "><span class="pcoded-micon"><i class="fab fa-blogger"></i></span><span class="pcoded-mtext">Blog</span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>