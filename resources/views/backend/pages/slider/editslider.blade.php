<div class="row ">
    <div class="col-md-12">
        <div class="form-group">
            <div>
                <img src="{{ url('public/uploads/slider/'.$viewslider['image'] ) }}" alt="silder_image" title="contact-img" class="rounded mr-4" height="100" />
                <br>
                <label class="form-label">Slider Image</label>
                <input type="file" class="form-control" name="sliderimage"><br>
                <input type="hidden" class="form-control hidden" value="{{ $viewslider['id'] }}" name="id"><br>
                <input type="text" class="form-control" value="{{ $viewslider['text'] }}" name="text"><br>
                <input type="text" class="form-control" value="{{ $viewslider['title'] }}" name="title"><br>
            </div>
        </div>
    </div>
</div>
