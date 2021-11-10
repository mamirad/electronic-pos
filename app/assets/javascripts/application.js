// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require toastr
//= require easyautocomplete/jquery.easy-autocomplete
//= require easyautocomplete/search
//= require select2-full
//= require parsley
//= require awesomplete.min
//= require bootstrap.min
//= require jquery.validate.min
//= require main
//= require my_select2
//= require social-share-button
//= require quagga
//= require custom_quagga
//= require chartkick
//= require Chart.bundle
//  require_tree .




$(document).ready(function() {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "500",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
});

$(document).ajaxStart(function () {
    $('.overlay').show();

}).ajaxStop(function () {
    $('.overlay').hide();
});
