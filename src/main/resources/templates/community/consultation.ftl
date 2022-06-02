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
    <div class="container-fluid bg-primary py-5 mb-5 page-header5">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">상담신청</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="text-center">
                <h6 class="section-title bg-white text-center text-primary px-3">상담신청</h6>
                <h4 class="mb-5">상담 신청 후 1일 이내 제공해 주신 연락처로 연락 드리겠습니다. 작성하신 개인정보는 상담 후, 자동 삭제 됨을 알려드립니다.</h4>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-7 offset-md-3" style="font-size: 20px;" data-wow-delay="0.2s">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <td class="bg-dark text-white text-center" style="border-radius: 30px 0 0 30px;"><i class="fa fa-edit"></i> 수강생 이름</td>
                                <td><input type="text" class="form-control" id="name"/></td>
                            </tr>
                            <tr>
                                <td class="bg-dark text-white text-center" style="border-radius: 30px 0 0 30px;"><i class="fa fa-edit"></i> 핸드폰</td>
                                <td><input type="text" class="form-control" id="phone"/></td>
                            </tr>
                            <tr>
                                <td class="bg-dark text-white text-center" style="border-radius: 30px 0 0 30px;"><i class="fa fa-edit"></i> E-mail</td>
                                <td><input type="text" class="form-control" id="email"/></td>
                            </tr>
                            <tr>
                                <td class="bg-dark text-white text-center" style="border-radius: 30px 0 0 30px;"><i class="fa fa-edit"></i> 상담요청내용</td>
                                <td><input type="text" class="form-control" id="reqInfo"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <button type="button" class="btn btn-primary btn-lg btn-block w-100" id="consultationBtn"><i class="fa fa-check"></i> 신청하기</button>
                    </div>
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
    <script src="page/consultation.js"></script>
</body>

</html>