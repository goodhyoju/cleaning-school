(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Initiate the wowjs
    new WOW().init();


    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.sticky-top').css('top', '0px');
        } else {
            $('.sticky-top').css('top', '-100px');
        }
    });
    
    
    // Dropdown on mouse hover
    const $dropdown = $(".dropdown");
    const $dropdownToggle = $(".dropdown-toggle");
    const $dropdownMenu = $(".dropdown-menu");
    const showClass = "show";
    
    $(window).on("load resize", function() {
        if (this.matchMedia("(min-width: 992px)").matches) {
            $dropdown.hover(
            function() {
                const $this = $(this);
                $this.addClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "true");
                $this.find($dropdownMenu).addClass(showClass);
            },
            function() {
                const $this = $(this);
                $this.removeClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "false");
                $this.find($dropdownMenu).removeClass(showClass);
            }
            );
        } else {
            $dropdown.off("mouseenter mouseleave");
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Header carousel
    $(".header-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        items: 1,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ]
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: true,
        margin: 24,
        dots: true,
        loop: true,
        nav : false,
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });
    
})(jQuery);
var APIIP = "http://49.50.174.83:8081/";

$(document).ready(function() {
    $("body").css("overflow-x","hidden");
    var myip = $("#myip").val();
    if(myip=='180.70.55.111' || myip=='203.236.8.208'){
        APIIP = "http://localhost:8081/";
    }
    //  APIIP = "http://localhost:8081/";

    $(".nav-link").removeClass('active');
    var getPageName = $("#pagename").val();

    $.each($(".smenu"), function (i,v){
        var getHref = $(this).attr('href');
        if((getHref=='index'|| getHref=='startupSupport') && getPageName==getHref){
            $(this).addClass('active');
        }else if(getPageName==getHref){
            $(this).parent().prev().addClass('active');
        }
    });
});
var isEmpty = function(value){ if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ return true }else{ return false } };
function randName() {
    var text = "";
    var first = "???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????";
    var last = "??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????";

    for (var i = 0; i < 1; i++)
        text += first.charAt(Math.floor(Math.random() * first.length));
    for (var i = 0; i < 2; i++)
        text += last.charAt(Math.floor(Math.random() * last.length));

    return text;
}

function destroyMask(string) {
    return string.replace(/\D/g, '').substring(0, 11);
}

function createMask(string) {
    return string.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
}


function getParam(name)
{
    var curr_url = location.search.substr(location.search.indexOf("?") + 1);
    var svalue = "";
    curr_url = curr_url.split("&");
    for (var i = 0; i < curr_url.length; i++)
    {
        temp = curr_url[i].split("=");
        if ([temp[0]] == name) { svalue = temp[1]; }
    }
    console.log(svalue);
    return svalue;
}
var lang_kor = {
    "decimal" : "",
    "emptyTable" : "???????????? ????????????.",
    "info" : "_START_ - _END_ (??? _TOTAL_ ???)",
    "infoEmpty" : "0???",
    "infoFiltered" : "(?????? _MAX_ ??? ??? ????????????)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "_MENU_ ?????? ??????",
    "loadingRecords" : "?????????...",
    "processing" : "?????????...",
    "search" : "<i class=\"fa fa-search\" aria-hidden=\"true\"></i> ?????? : ",
    "searchPlaceholder": "????????? ?????? ??? ??????",
    "zeroRecords" : "????????? ???????????? ????????????.",
    "paginate" : {
        "first" : "??? ?????????",
        "last" : "????????? ?????????",
        "next" : "??????",
        "previous" : "??????"
    },
    "aria" : {
        "sortAscending" : " :  ???????????? ??????",
        "sortDescending" : " :  ???????????? ??????"
    }
};
