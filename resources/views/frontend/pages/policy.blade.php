@extends('frontend.layout.app')
@section('content')
<section class="background_bg breadcrumb_section overlay_bg2 page-title-light" data-img-src="{{ url('public/frontend/assets/images/portfolio_signle_bg1.jpg') }}">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="page-title">
                    <h1>Privacy Policy</h1>
                </div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="{{ asset('/') }}">Home</a></li>
                        <li class="breadcrumb-item">Privacy Policy</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<section class="small_pb">
    <div class="container">
        <div class="row">
            <h1>Terms and Conditions</h1><br><br><br>
            <h3>For Software Development and Consulting services</h3>
            <p>This Service Agreement (“Agreement”) shall apply and govern the Statement of Work(s), project, letter of intent or any other document (“SOW”) executed between Persistent Systems Limited or any of its affiliates [specifically identified in the SOW] (“Consultant/Consultant”) and Customer, for the purpose of providing professional services (“Services”) or deliverables (“Deliverable”) for software development and consulting.</p>

            <h3>Payments:</h3>
            <p>Payment will be made by Customer within 15 days upon receipt of an invoice. In the event there is a delay in payment for more than 5 days from the due date, the Customer shall be liable to pay an interest of 1.5% per month or maximum permitted by applicable law, whichever is less, on the delayed payments from the due date of payment. Consultant shall be relieved of its obligations under this Agreement in the event of non-payment of the Fees or expenses due and shall retain the rights in the Services for which the amount is outstanding. Consultant will provide the Hardware and Software stated in Annexure – 01, as part of its standard package if required while providing the offshore Services from Consultant’s location(s) in India. Contractor’s relationship with Company is that of an independent contractor, and nothing in this Agreement will be construed to create a joint partnership, joint venture, agency, or employer-employee relationship.</p>
        </div>
    </div>
</section>
@endsection