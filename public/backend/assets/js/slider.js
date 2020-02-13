var Slider = function () {



    var sliderlist = function () {

        var dataArr = {};
        var columnWidth = {"width": "10%", "targets": 0};

        var arrList = {
            'tableID': '#slider-table',
            'ajaxURL': baseurl + "slider-ajaxAction",
            'ajaxAction': 'getdatatable',
            'postData': dataArr,
            'hideColumnList': [],
            'noSearchApply': [0],
            'noSortingApply': [0, 1],
            'defaultSortColumn': 0,
            'defaultSortOrder': 'desc',
            'setColumnWidth': columnWidth
        };
        getDataTable(arrList);

        var form = $('#addSlider');
        var rules = {
            sliderimage: {required: true},
            text: {required: true},
            title: {required: true}
        };
        handleFormValidate(form, rules, function (form) {
            handleAjaxFormSubmit(form, true);
        });



        $('body').on("click", ".editslider ", function () {
            var id = $(this).attr("data-id");
            var silderimage = $(this).attr("data-sliderimage");
            $.ajax({
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': $('input[name="_token"]').val(),
                },
                url: baseurl + "slider-ajaxAction",
                data: {'action': 'editslider', 'id': id, 'silderimage': silderimage},
                success: function (data) {

                    $(".editdiv").html(data);
                    handleFormValidate(form, rules, function (form) {
                        handleAjaxFormSubmit(form, true);
                    });
                }
            });

        });

        var form = $('#editslider');
        var rules = {
            text: {required: true},
            title: {required: true}
        };
        handleFormValidate(form, rules, function (form) {
            handleAjaxFormSubmit(form, true);
        });

        $('body').on("click", ".deleteslider", function () {
            var id = $(this).attr("data-id");
            var sliderimage = $(this).attr("data-sliderimage");
            setTimeout(function () {
                $('.yes-sure:visible').attr('data-id', id);
                $('.yes-sure:visible').attr('data-sliderimage', sliderimage);

            }, 500);

        });

        $('body').on('click', '.yes-sure', function () {
            var id = $(this).attr('data-id');
            var sliderimage = $(this).attr('data-sliderimage');
            var data = {id: id, sliderimage: sliderimage, _token: $('#_token').val()};

            $.ajax({
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': $('input[name="_token"]').val(),
                },
                url: baseurl + "slider-ajaxAction",
                data: {'action': 'deleteSlider', 'data': data},
                success: function (data) {
                    handleAjaxResponse(data);
                }
            });
        });
    }
    return {
        init: function () {
            sliderlist();
        },
    }
}();