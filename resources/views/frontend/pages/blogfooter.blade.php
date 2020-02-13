<h6 class="widget_title">RECENT POSTS</h6>
<ul class="recent_post border_bottom_dash list_none">
    @foreach($blogfooter as $value)
    <li>
        <div class="post_footer">
            <div class="post_img">
                <a href="{{ route('blogreadmore', $value->id) }}"><img  style="height: 60px;width: 110px;" src="{{ url('public/uploads/blog/'.$value->image) }}" alt="letest_post1" /></a>
            </div>
            <div class="post_content">
                <h6><a href="{{ route('blogreadmore', $value->id) }}">{{ $value->title }}</a></h6>
                <p class="small m-0">{{ date('d-M-Y',strtotime($value->created_at)) }}</p>
            </div>
        </div>
    </li>
    @endforeach
</ul>