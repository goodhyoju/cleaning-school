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
    <div class="container-fluid bg-primary py-5 mb-5 page-header4">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">공지사항</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="text-center">
                <h6 class="section-title bg-white text-center text-primary px-3">공지사항 안내</h6>
            </div>

            <div class="row">
                <!-- table start -->
                <table id="notiTable" class="ui celled table hover display nowrap" style="width:100%">
                    <thead>
                    <tr class="text-center">
                        <th>ID</th>
                        <th>구분</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성일</th>
                        <th>작성자</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                </table>
                <!-- table end -->
            </div>
        </div>
    </div>
    <!-- Testimonial End -->
    <!-- Modal start -->
    <div class="modal fade" id="addNotisModal" tabindex="-1" role="dialog" aria-labelledby="addNotisModalLabel" aria-hidden="true" >
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addNotisModalLabel">공지사항 입력</h5>
                    <a id="addNotisCloseBtn"><span class="text-dark fw-bold">x</span> </a>
                </div>
                <div class="modal-body" style="z-index: 1">
                    <div class="col-md-12">
                        <div class="row g-2">
                            <div class="col-md-12">
                                <label for="notisType"><i class="fa fa-check"></i>서비스</label>
                                <select class="form-select border-1 py-3" id="notisType">
                                    <option value="공지사항" selected>공지사항</option>
                                    <option value="이벤트">이벤트</option>
                                    <option value="장애알림">장애알림</option>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label for="notisTitle"><i class="fas fa-edit"></i>제목</label>
                                <input type="text" id="notisTitle" class="form-control border-1 py-3">
                            </div>
                            <div class="col-md-12">
                                <label for="notisComment"><i class="fas fa-edit"></i>내용</label>
                                <textarea type="text" id="notisComment" class="form-control border-1 py-3" cols="3"> </textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="notisWriter"><i class="fa fa-check"></i>작성자</label>
                                <select class="form-select border-1 py-3" id="notisWriter">
                                    <option value="운영자" selected>운영자</option>
                                    <option value="고객센터">고객센터</option>
                                    <option value="상담원">상담원</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-success" id="addNotisSaveBtn"><i class="fa fa-check"></i> 저장</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal" id="addNotisCancelBtn"><i class="fa fa-times"></i> 취소</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal end -->


    <!-- Modal start -->
    <div class="modal fade" id="viewNotisModal" tabindex="-1" role="dialog" aria-labelledby="viewNotisModalLabel" aria-hidden="true" >
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewNotisModalLabel">공지사항</h5>
                    <a id="viewNotisCloseBtn"><span class="text-dark fw-bold">x</span> </a>
                </div>
                <div class="modal-body" style="z-index: 1">
                    <div class="col-md-12">
                        <div class="row g-2">
                            <div class="col-md-12">


                                <div class="owl-item" style="width: 100%;"><div class="testimonial-item bg-light rounded p-3">
                                        <div class="bg-white border rounded p-4">

                                            <div class="d-flex align-items-center">
                                                <img class="img-fluid flex-shrink-0 rounded" src="img/icon-alert.png" style="width: 45px; height: 45px;">
                                                <div class="ps-3">
                                                    <h6 class="fw-bold mb-1" id="viewNotisTitle"></h6>
                                                    <small id="viewNotisWriter"></small>
                                                </div>
                                            </div>
                                            <p id="viewNotisComment" class="mt-1 mb-0"></p>
                                        </div>
                                    </div></div>



                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal" id="viewNotisCancelBtn"><i class="fa fa-times"></i> 닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal end -->

    <!-- Footer Start -->
    <#include "/common/common_footer.ftl">
    <!-- Footer End -->

    <!-- JavaScript Libraries -->
    <#include "/common/common_js.ftl">
    <script src="page/notis.js"></script>
</body>

</html>