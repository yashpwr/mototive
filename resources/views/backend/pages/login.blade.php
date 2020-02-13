@extends('backend.layout.login')
@section('content')
<div class="auth-wrapper align-items-stretch aut-bg-img">
    <div class="flex-grow-1">
        <div class="h-100 d-md-flex align-items-center auth-side-img">
            <div class="col-sm-10 auth-content w-auto">
                <h1 class="text-white my-4">MOTOTIVE WEB SOLUTION</h1>
                <h1 class="text-white my-4">Welcome Back!</h1>
                <h4 class="text-white font-weight-normal">Signin to your account and get explore the MOTOTIVE.<br/></h4>
            </div>
        </div>
        <div class="auth-side-form">
            <div class=" auth-content">
                <img src="{{ url('public/backend/assets/images/auth/auth-logo-dark.png') }}" alt="" class="img-fluid mb-4 d-block d-xl-none d-lg-none">
                <h3 class="mb-4 f-w-400">Signin</h3>
                <form class="" role="form" id="login" method="POST" action="{{ route('admin') }}">
                    {{ csrf_field() }}
                    <div class="form-group mb-3">
                        <label class="floating-label" for="Email">Email address</label>
                        <input type="text" class="form-control" id="Email" name="email" placeholder="">
                    </div>
                    <div class="form-group mb-4">
                        <label class="floating-label" for="Password">Password</label>
                        <input type="password" class="form-control" id="Password" name="password" placeholder="">
                    </div>
                    <button class="btn btn-block btn-primary mb-4">Signin</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection