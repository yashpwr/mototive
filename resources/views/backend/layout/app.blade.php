<!DOCTYPE html>
<html lang="en">
    @include('backend.include.header')
    <body class="background-img-2">
        @include('backend.include.sidebar')
            @include('backend.include.bodyheader')
            
                @yield('content')
            @include('backend.include.bodyfooter')
        @include('backend.include.footer')
    </body>
</html>
