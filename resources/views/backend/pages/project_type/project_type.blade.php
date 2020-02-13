@extends('backend.layout.app')
@section('content')
<section class="pcoded-main-container">{{ csrf_field() }}
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin-dashboard') }}"><i class="feather icon-home"></i>&nbsp;&nbsp;Home</a></li>
                            <li class="breadcrumb-item"><a href="#!">Project Type List</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-sm-12">
                <div class="card support-bar overflow-hidden">
                    <div class="card-body pb-0">
                        <h2 class="m-0">Project Type List</h2>
                        <span class="text-c-blue">&nbsp;</span>

                    </div>

                    <div class="card-footer bg-primary text-white">
                        <div class="row text-center">

                        </div>
                    </div>
                </div>
            </div>
            <!-- [ form-element ] start -->
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header text-right">
                        <div class="row p-b-20 pull-right">
                            <div class="btn-group">
                                <button class="btn  btn-sm btn-info has-ripple" data-toggle="modal" data-target="#addprojectmodel"><i class="feather icon-plus"></i> Add Project Type</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table id="projecttypedatatable" class="table mb-0">
                            <thead class="thead-light">
                                <tr>
                                    <th class="text-center">Sr.No</th>
                                    <th class="text-center">Type</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- [ form-element ] end -->
        </div>
        <!-- [ Main Content ] end -->

    </div>
</section>
<div id="editmodel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editmodel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit Slider</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>

            <div class="modal-body">
                <form id="edittype" name="edittypeform" method="post" action="{{ route('editproject-type') }}" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class=" editdiv">



                    </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn  btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn  btn-primary">Edit Project Type</button>
            </div>
            </form>
        </div>
    </div>
</div> 
<!--Add Product model --> 
<div id="addprojectmodel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="addproductmodel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Project Type</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form id="addprojecttype" name="addprojectform" method="post"  enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="form-label">Project Type</label>
                                <div><br>
                                    <input type="text" class="form-control" name="type" placeholder="Add Project Type"><br>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn  btn-primary">Add Project Type</button>
            </div>
            </form>
        </div>
    </div>
</div>
@endsection