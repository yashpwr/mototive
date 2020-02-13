<script src="{{ url('public/frontend/assets/js/jquery-1.12.4.min.js') }}"></script> 
<!-- jquery-ui --> 
<script src="{{ url('public/frontend/assets/js/jquery-ui.js') }}"></script>
<!-- popper min js --> 
<script src="{{ url('public/frontend/assets/js/popper.min.js') }}"></script>
<!-- Latest compiled and minified Bootstrap --> 
<script src="{{ url('public/frontend/assets/bootstrap/js/bootstrap.min.js') }}"></script> 
<!-- owl-carousel min js  --> 
<script src="{{ url('public/frontend/assets/owlcarousel/js/owl.carousel.min.js') }}"></script> 
<!-- magnific-popup min js  --> 
<script src="{{ url('public/frontend/assets/js/magnific-popup.min.js') }}"></script> 
<!-- waypoints min js  --> 
<script src="{{ url('public/frontend/assets/js/waypoints.min.js') }}"></script> 
<!-- parallax js  --> 
<script src="{{ url('public/frontend/assets/js/parallax.js') }}"></script> 
<!-- countdown js  --> 
<script src="{{ url('public/frontend/assets/js/jquery.countdown.min.js') }}"></script> 
<!-- fit video  -->
<script src="{{ url('public/frontend/assets/js/jquery.fitvids.js') }}"></script>
<!-- jquery.counterup.min js --> 
<script src="{{ url('public/frontend/assets/js/jquery.counterup.min.js') }}"></script>
<!-- isotope min js --> 
<script src="{{ url('public/frontend/assets/js/isotope.min.js') }}"></script>
<!-- elevatezoom js -->
<script src="{{ url('public/frontend/assets/js/jquery.elevatezoom.js') }}"></script> 
<!-- scripts js --> 
<script src="{{ url('public/frontend/assets/js/scripts.js') }}"></script>
@if (!empty($pluginjs)) 
@foreach ($pluginjs as $value) 
<script src="{{ url('public/frontend/assets/js/'.$value) }}" type="text/javascript"></script>
@endforeach
@endif
@if (!empty($js)) 
@foreach ($js as $value) 
<script src="{{ url('public/frontend/assets/js/'.$value) }}" type="text/javascript"></script>
@endforeach
@endif

<script src="{{ url('public/frontend/assets/js/toastr.min.js') }}" type="text/javascript"></script>
<script src="{{ url('public/frontend/assets/js/comman_function.js') }}" ></script>

<script>
jQuery(document).ready(function () {
    @if (!empty($funinit))
            @foreach ($funinit as $value)
            {{ $value }}
    @endforeach
            @endif
});
</script>
<script> 
$.ajax({
    type: "POST",
    headers: {
        'X-CSRF-TOKEN': $('input[name="_token"]').val(),
    },
    url: baseurl + "blog-footer",
    success: function (data) {
        
        $(".blogfooter").html(data);
    }
});
</script>