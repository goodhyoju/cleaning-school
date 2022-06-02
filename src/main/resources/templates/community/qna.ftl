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
    <div class="container-fluid bg-primary py-5 mb-5 page-header6">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">Q&A</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="text-center">
                <h6 class="section-title bg-white text-center text-primary px-3"><button class="btn btn-primary" id="addQnaBtn"><i class="fa fa-plus"></i> Q&A 입력</button></h6>

            </div>

            <div class="row g-2">
                <div class="col-md-12">
                    <!-- table start -->
                    <table id="qnaTable" class="ui celled table hover display nowrap" style="width:100%">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>종류</th>
                            <th>상태</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>내용</th>
                            <th>답변</th>
                            <th>운영</th>
                        </tr>
                        </thead>
                    </table>
                    <!-- table end -->
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->
    <!-- Modal start -->
    <div class="modal fade" id="addQnaModal" tabindex="-1" role="dialog" aria-labelledby="addQnaModalLabel" aria-hidden="true" >
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addQnaModalLabel">공지사항 입력</h5>
                    <a id="addQnaCloseBtn"><span class="text-dark fw-bold">x</span> </a>
                </div>
                <div class="modal-body" style="z-index: 1">
                    <div class="col-md-12">
                        <div class="row g-2">
                            <div class="col-md-12">
                                <label for="qnaType"><i class="fa fa-check"></i>구분</label>
                                <select class="form-select border-1 py-3" id="qnaType">
                                    <option value="일반문의" selected>일반문의</option>
                                    <option value="교육문의">교육문의</option>
                                    <option value="과정문의">과정문의</option>
                                    <option value="창업문의">창업문의</option>
                                </select>
                            </div>

                            <div class="col-md-12">
                                <label for="qnaTitle"><i class="fas fa-edit"></i>제목</label>
                                <input type="text" id="qnaTitle" class="form-control border-1 py-3">
                            </div>
                            <div class="col-md-12">
                                <label for="qnaComment"><i class="fas fa-edit"></i>내용</label>
                                <textarea type="text" id="qnaComment" class="form-control border-1 py-3" cols="3"> </textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="qnaWriter"><i class="fa fa-check"></i>작성자<small style="font-size: 10px;">(기본으로 랜덤이름이 생성됩니다. 작성자 이름을 입력해주세요.)</small></label>
                                <input type="text" class="form-control border-1 py-3" id="qnaWriter" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-success" id="addQnaSaveBtn"><i class="fa fa-check"></i> 저장</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal" id="addQnaCancelBtn"><i class="fa fa-times"></i> 취소</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal end -->

    <!-- Modal start -->
    <div class="modal fade" id="answerQnaModal" tabindex="-1" role="dialog" aria-labelledby="answerQnaModalLabel" aria-hidden="true" >
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="answerQnaModalLabel">답변 입력</h5>
                    <a id="answerQnaCloseBtn"><span class="text-dark fw-bold">x</span> </a>
                </div>
                <div class="modal-body" style="z-index: 1">
                    <div class="col-md-12">
                        <div class="row g-2">
                            <div class="col-md-12">
                                <label for="answerQnaTitle"><i class="fas fa-edit"></i>제목</label>
                                <input type="text" id="answerQnaTitle" class="form-control border-1 py-3" readonly>
                            </div>
                            <div class="col-md-12">
                                <label for="answerQnaComment"><i class="fas fa-edit"></i>내용</label>
                                <textarea type="text" id="answerQnaComment" class="form-control border-1 py-3" cols="3" readonly> </textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="answerQnaReply"><i class="fa fa-check"></i>답변작성</label>
                                <input type="text" class="form-control border-1 py-3" id="answerQnaReply" />
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="answerQnaIdx" value="" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-success" id="answerQnaSaveBtn"><i class="fa fa-check"></i> 저장</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal" id="answerQnaCancelBtn"><i class="fa fa-times"></i> 취소</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal end -->
    <!-- Modal start -->
    <div class="modal fade" id="viewQnaModal" tabindex="-1" role="dialog" aria-labelledby="viewQnaModalLabel" aria-hidden="true" >
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewQnaModalLabel">공지사항</h5>
                    <a id="viewQnaCloseBtn"><span class="text-dark fw-bold">x</span> </a>
                </div>
                <div class="modal-body" style="z-index: 1">
                    <div class="col-md-12">
                        <div class="row g-2">
                            <div class="col-md-12">


                                <div class="owl-item" style="width: 100%;"><div class="testimonial-item bg-light rounded p-3">
                                        <div class="bg-white border rounded p-4">

                                            <div class="d-flex align-items-center">
                                                <img class="img-fluid flex-shrink-0 rounded" src="img/icon-question.png" style="width: 45px; height: 45px;">
                                                <div class="ps-3">
                                                    <h6 class="fw-bold mb-1" id="viewQnaTitle"></h6>
                                                    <small id="viewQnaWriter"></small>
                                                </div>
                                            </div>
                                            <p id="viewQnaComment" class="mt-1 mb-2"></p>
                                            <p id="viewQnaAnswer" class="mt-1 mb-0 text-primary fw-bold"></p>
                                        </div>
                                    </div></div>



                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal" id="viewQnaCancelBtn"><i class="fa fa-times"></i> 닫기</button>
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
    <script src="page/qna.js"></script>
</body>

</html>