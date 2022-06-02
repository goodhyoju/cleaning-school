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
                    <h1 class="display-3 text-white animated slideInDown">사전점검 교육과정</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="text-center">
                <h6 class="section-title bg-white text-center text-primary px-3">교육안내</h6>
            </div>

            <div class="row">
                <div class="col-md-12" style="font-size: 20px;" data-wow-delay="0.2s">
                    <table class="table table-hover" id="preInspectionStepTable">
                        <thead class="bg-dark text-white text-center">
                            <tr>
                                <th style="border-radius: 30px 0 0 30px;">구분</th><th>교육과목</th><th>교육내용</th><th style="border-radius: 0px 30px 30px 0px;">교육시간(80h)</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
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
       var studyCase = ["사전점검 개론","점검의 기본원리","바닥점검","벽체점검","가구점검","타일점검","창호점검","도어점검","수압점검","배수점검","누수점검","회사의 운영","마케팅","최종 실습 및 평가"];
       var studyInfo = [
                       "사전점검의 개론, 장비사용 및 안전사고 예방"
                       ,"점검 순서 및 계획"
                       ,"바닥체 점검 방법 및 주의사항"
                       ,"벽체 점검 방법 및 주의사항"
                       ,"가구 점검 방법 및 주의사항"
                       ,"타일 점검 방법 및 주의사항"
                       ,"창호 점검 방법 및 주의사항"
                       ,"도어 점검 방법 및 주의사항"
                       ,"수압 점검 방법 및 주의사항"
                       ,"배수 점검 방법 및 주의사항"
                       ,"전 교육과정 평가 및 보충"
                       ,"창업 / 운영전반의 관련 내용"
                       ,"영업의 방법 / 견적서 작성 / 고객관리"
                       ,"전 교육과정의 평가 및 보충"
                       ];
       var studyTime = [4,4,8,8,8,4,4,4,4,4,4,8,8,8];
        $.each(studyCase, function(index, element){
            $("#preInspectionStepTable tbody").append('<tr><td class="text-center">'+(index+1)+'</td><td>'+element+'</td><td>'+studyInfo[index]+'</td><td class="text-center">'+studyTime[index]+'</td>')
        });
    });
</script>

</html>