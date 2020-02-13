<footer class="overlay_bg3 background_bg" data-img-src="{{ url('public/frontend/assets/images/footer_bg.jpg') }}">
    <div class="top_footer text_white">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 animation p-t-2" data-animation="fadeInUp" data-animation-delay="0.2s">
                    <div class="footer_logo">
                        <a href="{{ asset('/') }}"><img style="height: 80px" alt="logo" src="{{ url('public/frontend/assets/images/logo_white.png') }}"></a>
                    </div>
                    {{ csrf_field() }}
                    <p>If you have any query or suggestions you can contact us.</p>
                    <ul class="contact_info contact_info_light list_none">
                        <li>
                            <span class="ti-location-pin"></span>
                            <address>G-106 Titanium City Center, Satellite, Ahmedabad, Gujarat, India</address>
                        </li>
                        <li>
                            <span class="ti-email"></span>
                            <a href="mailto:info@mototivewebsolution.com">info@mototivewebsolution.com</a>
                        </li>
                        <li>
                            <span class="ti-mobile"></span>
                            <p>+91 88666 20260</p>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 mb-4 mb-lg-0 animation" data-animation="fadeInUp" data-animation-delay="0.3s">
                    <h6 class="widget_title">USEFUL LINKS</h6>
                    <ul class="list_none widget_links">
                        <li><a href="{{ route('aboutus') }}">About Us</a></li>
                        <li><a href="{{ route('features') }}">Features</a></li>
                        <li><a href="{{ route('services') }}">Service</a></li>
                        <li><a href="{{ route('contactus') }}">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 animation blogfooter" data-animation="fadeInUp" data-animation-delay="0.4s">
                    
                </div>
                <div class="col-lg-4 col-md-6 animation" data-animation="fadeInUp" data-animation-delay="0.5s">
                    <h6 class="widget_title">Subscribe Newsletter</h6>
                    <p>Stay with us and enjoy all the new update about MOTOTIVE WEB SOLUTION.</p>
                    <div class="newsletter_form mb-4">
                        <form> 
                            <div class="outline_input">
                                <input type="text" required placeholder="Enter Email Address"/>
                            </div>
                            <button type="submit" title="Subscribe" class="btn btn-submit" name="submit" value="Submit">
                                <span class="ion-android-send"></span>
                            </button>
                        </form>
                    </div>
                    <h6 class="widget_title">Follow Us</h6>
                    <ul class="list_none footer_social">
                         <li><a target="_blank" href="https://www.facebook.com/mototive.websolution.73"><i class="ion-social-facebook"></i></a></li>
                        <li><a target="_blank" href="https://twitter.com/MototiveW"><i class="ion-social-twitter"></i></a></li>
                        <li><a  href="#"><i class="ion-social-googleplus"></i></a></li>
                        <li><a target="_blank" href="https://www.linkedin.com/in/mototive-web-solution/"><i class="ion-social-linkedin-outline"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom_footer text_white border_top_tran">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <p class="copyright m-md-0 text-center text-md-left">&copy; {{ date('Y') }} All Rights Reserved by Mototive.</p>
                </div>
                <div class="col-md-6">
                    <ul class="list_none footer_link text-center text-md-right">
                        <li><a href="{{ route('policy') }}">Privacy Policy</a></li>
                        <li><a href="{{ route('terms') }}">Terms & Conditions</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>