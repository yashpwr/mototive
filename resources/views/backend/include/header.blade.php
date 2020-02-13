<head>
    <title>{{ $title }}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="shortcut icon" type="image/x-icon" href="{{ url('public/frontend/assets/images/fevicon.png') }}" sizes="16x16">
    <link href="{{ url('public/backend/assets/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css"/>
    <!-- vendor css -->
    <link rel="stylesheet" href="{{ url('public/backend/assets/css/style.css') }}">
    <link href="{{ url('public/frontend/assets/css/toastr.min.css') }}" rel="stylesheet">
    <script>
        var baseurl = "{{ asset('/') }}";
    </script>
    @if (!empty($plugincss)) 
    @foreach ($plugincss as $value) 
    @if(!empty($value))
    <link rel="stylesheet" href="{{ url('public/backend/assets/css/plugins/'.$value) }}">
    @endif
    @endforeach
    @endif
    @if (!empty($css)) 
    @foreach ($css as $value) 
    @if(!empty($value))
    <link rel="stylesheet" href="{{ url('public/backend/assets/'.$value) }}">
    @endif
    @endforeach
    @endif
</head>