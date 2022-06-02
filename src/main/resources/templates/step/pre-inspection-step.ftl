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
                    <h1 class="display-3 text-white animated slideInDown">청소 교육 과정</h1>
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
                    <table class="table table-hover" id="studyStepTable">
                        <thead class="bg-dark text-white text-center">
                            <tr>
                                <th style="border-radius: 30px 0 0 30px;">구분</th><th>교육과목</th><th>교육내용</th><th style="border-radius: 0px 30px 30px 0px;">교육시간(168h)</th>
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
       var studyCase = ["청소개론","청소의 기본원리","바닥청소","집기청소","청소계획 수립","청소능력 배양","석재관리","가전청소","청소회사 운영","마케팅","최종실습"];
       var studyInfo = [
                           "청소의 개론, 장비 및 세제 사용법, 안전사고 예방",
                           "재질별 특성, 재질별 장비 및 세제 사용법, 실습",
                           "재질별 청소법, 유지관리 방법",
                           "가구 청소의 세제 선택과 사용 방법",
                           "청소 계획표의 이해와 만들기",
                           "청소 실습",
                           "석재 종류별 청소 및 복원",
                           "가전제품의 정소 방법",
                           "창업, 운영절차 전반의 기본원리",
                           "영업의 방법, 청소 견적서 및 시방서 작성, 고객관리",
                           "전 교육과정 평가 및 보충"
                       ];
       var studyTime = [20,22,24,20,12,12,14,8,12,14,10];
        $.each(studyCase, function(index, element){
            $("#studyStepTable tbody").append('<tr><td class="text-center">'+(index+1)+'</td><td>'+element+'</td><td>'+studyInfo[index]+'</td><td class="text-center">'+studyTime[index]+'</td>')
        });
    });
</script>

</html>