var Contactus = function () {

    var list = function () {
        
        var form = $('#contactusform');
        var rules = {
            name: {required: true},
            email: {required: true,email:true},
            mobile: {required: true},
            message: {required: true},
        };

        handleFormValidate(form, rules, function (form) {
            handleAjaxFormSubmit(form, true);
        }); 
    }
    return {
        init: function () {
            list();
        }

    }
}();