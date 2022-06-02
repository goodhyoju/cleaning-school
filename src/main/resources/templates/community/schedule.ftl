<!DOCTYPE html>
<html lang="en">

<!-- common css Start -->
<#include "/common/common_css.ftl">
<!-- common css End -->

<body>
    <!-- Spinner Start -->
    <#include "/common/common_spinner.ftl">
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <#include "/common/common_navbar.ftl">
    <!-- Navbar End -->


    <!-- Header Start -->
    <div class="container-fluid bg-primary py-5 mb-5 page-header7">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">개강일정</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="text-center">
                <h6 class="section-title bg-white text-center text-primary px-3">개강일정</h6>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div id='calendar'></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->
        

    <!-- Footer Start -->
    <#include "/common/common_footer.ftl">
    <!-- Footer End -->

    <!-- JavaScript Libraries -->
    <#include "/common/common_js.ftl">
    <script src="page/schedule.js"></script>
</body>

</html>