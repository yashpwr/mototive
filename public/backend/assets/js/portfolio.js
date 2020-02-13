var Portfolio = function () {

    var list = function () {

        var dataArr = {};
        var columnWidth = {"width": "10%", "targets": 0};

        var arrList = {
            'tableID': '#portfoliolisttable',
            'ajaxURL': baseurl + "portfolio-ajaxAction",
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

        $('body').on("click", ".addimage", function () {
            var html = '<div class="row removediv">' +
                    '<div class="col-md-10 p-b-25">' +
                    '<div class="form-group">' +
                    '<input type="file" name="addimage[]" class="form-control" name="image">' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-md-2 p-b-25">' +
                    '<div class="form-group">' +
                    '<button type="button" class="btn  btn-danger remove">Remove Images</button>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
            $(".append").append(html);
        });

        $('body').on("click", ".remove", function () {
            $(this).closest('.removediv').remove();
        });

        var form = $('#addportfolio');
        var rules = {
            name: {required: true},
            link: {required: true},
            title: {required: true},
            short: {required: true, maxlength: 30},
            description: {required: true},
            type: {required: true},
            image: {required: true},
        };
        handleFormValidate(form, rules, function (form) {
            handleAjaxFormSubmit(form, true);
        });

        $('body').on("click", ".deletetype", function () {
            var id = $(this).attr("data-id");
            setTimeout(function () {
                $('.yes-sure:visible').attr('data-id', id);
            }, 500);
        });

        $('body').on('click', '.yes-sure', function () {
            var id = $(this).attr('data-id');
            var data = {id: id, _token: $('#_token').val()};
            $.ajax({
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': $('input[name="_token"]').val(),
                },
                url: baseurl + "portfolio-ajaxAction",
                data: {'action': 'delete', 'data': data},
                success: function (data) {
                    handleAjaxResponse(data);
                }
            });
        });
    }

    var editportfolio = function () {

        var form = $('#editportfolio');
        var rules = {
            name: {required: true},
            link: {required: true},
            title: {required: true},
            short: {required: true, maxlength: 30},
            description: {required: true},
            type: {required: true},
        };
        handleFormValidate(form, rules, function (form) {
            handleAjaxFormSubmit(form, true);
        });

        $('body').on("click", ".addimage", function () {
            var html = '<div class="row removediv">' +
                    '<div class="col-md-10 p-b-25">' +
                    '<div class="form-group">' +
                    '<input type="file" name="addimage[]" class="form-control" name="image">' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-md-2 p-b-25">' +
                    '<div class="form-group">' +
                    '<button type="button" class="btn  btn-danger remove">Remove Images</button>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
            $(".append").append(html);
        });

        $('body').on("click", ".remove", function () {
            $(this).closest('.removediv').remove();
        });
    }

    return{
        init: function () {
            list();
        },
        edit: function () {
            editportfolio();
        }
    }
}();