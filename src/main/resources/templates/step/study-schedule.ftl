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
    <div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">교육 일정</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="text-center">
                <h3 class="section-title bg-white text-center text-primary px-3">청소 전문가 양성 과정</h3>
            </div>

            <div class="row">
                <div class="col-md-12" style="font-size: 20px;" data-wow-delay="0.2s">
                    <table class="table table-hover" id="">
                        <thead class="bg-dark text-white text-center">
                            <tr>
                                <th style="border-radius: 30px 0 0 30px;">구분</th><th>강좌</th><th>개강일</th><th>접수기간</th><th>교육기간</th><th>교육시간</th><th style="border-radius: 0px 30px 30px 0px;">교육장소</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="2" class="text-center align-middle">청소전문가</td>
                                <td>창업반</td>
                                <td>매월 첫째주 월요일</td>
                                <td>매월 25일까지</td>
                                <td>첫째주 월요일~넷째주 금요일</td>
                                <td>168h</td>
                                <td>수유동 본원</td>
                            </tr>
                            <tr>
                                <td>취업반</td>
                                <td>매월 첫째주 월요일</td>
                                <td>매월 25일까지</td>
                                <td>첫째주 월요일~넷째주 금요일</td>
                                <td>168h</td>
                                <td>수유동 본원</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="text-center">
                <h3 class="section-title bg-white text-center text-primary px-3">사전 전문가 전문가 양성 과정</h3>
            </div>

            <div class="row">
                <div class="col-md-12" style="font-size: 20px;" data-wow-delay="0.2s">
                    <table class="table table-hover" id="">
                        <thead class="bg-dark text-white text-center">
                        <tr>
                            <th style="border-radius: 30px 0 0 30px;">구분</th><th>강좌</th><th>개강일</th><th>접수기간</th><th>교육기간</th><th>교육시간</th><th style="border-radius: 0px 30px 30px 0px;">교육장소</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td rowspan="2" class="text-center align-middle">사전점검 전문가</td>
                            <td>창업반</td>
                            <td>매월 둘째주 월요일</td>
                            <td>매월 25일까지</td>
                            <td>둘째주 월요일~둘째주 금요일</td>
                            <td>80h</td>
                            <td>수유동 본원</td>
                        </tr>
                        <tr>
                            <td>취업반</td>
                            <td>매월 둘째주 월요일</td>
                            <td>매월 25일까지</td>
                            <td>둘째주 월요일~둘째주 금요일</td>
                            <td>80h</td>
                            <td>수유동 본원</td>
                        </tr>
                        </tbody>
                    </table>
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
</body>
<script>
    $(document).ready(function() {

    });
</script>

</html>