<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- SITE TITLE -->
    <title>{{ $title }}</title>
    <!-- Favicon Icon -->
    <link rel="shortcut icon" type="image/x-icon" href="{{ url('public/frontend/assets/images/fevicon.png') }}" sizes="16x16">
    <!-- Animation CSS -->
    <link rel="stylesheet" href="{{ url('public/frontend/assets/css/animate.css') }}">	
    <!-- Latest Bootstrap min CSS -->
    <link rel="stylesheet" href="{{ url('public/frontend/assets/bootstrap/css/bootstrap.min.css') }}">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <!-- Icon Font -->
    <link href="{{ url('public/frontend/assets/css/ico-moon.css') }}" rel="stylesheet">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="{{ url('public/frontend/assets/css/ionicons.min.css') }}">
    <link rel="stylesheet" href="{{ url('public/frontend/assets/css/themify-icons.css') }}">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="{{ url('public/frontend/assets/css/all.min.css') }}">
    <!--- owl carousel CSS-->
    <link rel="stylesheet" href="{{ url('public/frontend/assets/owlcarousel/css/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ url('public/frontend/assets/owlcarousel/css/owl.theme.css') }}">
    <link rel="stylesheet" href="{{ url('public/frontend/assets/owlcarousel/css/owl.theme.default.min.css') }}">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="{{ url('public/frontend/assets/css/magnific-popup.css') }}">
    <!-- Style CSS -->
    <link rel="stylesheet" href="{{ url('public/frontend/assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ url('public/frontend/assets/css/responsive.css') }}">
    <link rel="stylesheet" id="layoutstyle" href="{{ url('public/frontend/assets/color/theme.css') }}">
    <link href="{{ url('public/frontend/assets/css/toastr.min.css') }}" rel="stylesheet">
    <script>
        var baseurl = "{{ asset('/') }}";
    </script>
   
    @if (!empty($plugincss)) 
    @foreach ($plugincss as $value) 
    @if(!empty($value))
    <link rel="stylesheet" href="{{ url('public/frontend/assets/plugins/'.$value) }}">
    @endif
    @endforeach
    @endif
    @if (!empty($css)) 
    @foreach ($css as $value) 
    @if(!empty($value))
    <link rel="stylesheet" href="{{ url('public/frontend/assets/'.$value) }}">
    @endif
    @endforeach
    @endif
</head>