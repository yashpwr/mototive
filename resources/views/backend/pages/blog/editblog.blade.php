<div class="row ">
    <div class="col-md-12">
        <div class="form-group">
            <div>
                <img src="{{ url('public/uploads/blog/'.$viewblog['image'] ) }}" alt="blog_image" title="blog-img" class="rounded mr-4" height="100" />
                <br>
                <label class="form-label">Blog Image</label>
                <input type="file" class="form-control" name="image"><br>
                <input type="hidden" class="form-control hidden" value="{{ $viewblog['id'] }}" name="id"><br>
                <select class="form-control" name="category">
                    @foreach($viewblogcategory as $value)
                    <option value="{{ $value->id }}" {{ $value->id == $viewblog['category'] ? 'selected' : ''}}>{{ $value->name }}</option>
                    @endforeach 
                </select><br>
                <input type="text" class="form-control" name="title" placeholder="Enter Title" value="{{ $viewblog['title'] }}"><br>
                <input type="text" class="form-control" name="author" placeholder="Enter Author Name" value="{{ $viewblog['author'] }}"><br>
                <textarea class="form-control" name="content" placeholder="Enter Content here">{{ $viewblog['content'] }}</textarea><br>
            </div>
        </div>
    </div>
</div>
