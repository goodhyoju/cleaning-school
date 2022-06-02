<!DOCTYPE html>
<html lang="euc-kr">

<#include "/common/common_css.ftl">


<body>
<div class="container-xxl bg-white p-0">
    <div class="container-xxl py-1" style="">
        <div class="container">
            <div class="text-center mx-auto mb-4 wow fadeInUp" data-wow-delay="0.1s" style="">
                <h2 class="mb-3">청소학원 어드민</h2>
                <p><em class="text-danger" style="margin-right: 10px;"><i class="fa fa-star" ></i> 확인 하신 상담원은 상태를 변경해주세요.</em>
                    <em class="text-info" style=""><i class="fa fa-history"></i> 이페이지의 데이터는 1분주기로 자동 갱신됩니다.</em>
                </p>
            </div>
            <div class="row g-2">
                <ul class="nav nav-tabs mb-2" id="adminTab">
                    <li class="nav-item">
                        <a href="#reservationTab" class="nav-link active" data-bs-toggle="tab"><i class="fa fa-list"></i> 상담신청</a>
                    </li>
                    <li class="nav-item">
                        <a href="#notiTab" class="nav-link" data-bs-toggle="tab"><i class="fa fa-bullhorn" aria-hidden="true"></i> 공지사항</a>
                    </li>
                    <li class="nav-item">
                        <a href="#qnaTab" class="nav-link" data-bs-toggle="tab"><i class="fa fa-question-circle" aria-hidden="true"></i> Q&A</a>
                    </li>
                    <li class="nav-item">
                        <a href="#scheduleTab" class="nav-link" data-bs-toggle="tab"><i class="fa fa-sign-language" aria-hidden="true"></i> 개강일정</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="reservationTab">
                        <div class="col-md-12">
                            <h4 class="mb-3 text-white" style="background: linear-gradient(45deg, #007c87, transparent)"><i class="fa fa-check"></i>상담 신청 리스트</h4>
                            <!-- quick table start -->
                            <table id="reservationTable" class="ui celled table hover display nowrap" style="width:100%">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>이름</th>
                                    <th>핸드폰</th>
                                    <th>E-mail</th>
                                    <th>상담요청내용</th>
                                    <th>작성일</th>
                                    <th>상태</th>
                                    <th>확인</th>
                                </tr>
                                </thead>
                            </table>
                            <!-- quick table end -->
                        </div>
                    </div>
                    <!-- 공지사항 -->
                    <div class="tab-pane fade" id="notiTab">
                        <div class="col-md-12">
                            <h4 class="mb-3 text-white" style="background: linear-gradient(45deg, #007c87, transparent)">
                                <i class="fa fa-check"></i>공지사항
                                <small style="float: right;"><button class="btn btn-sm btn-danger" id="addNotisBtn"><i class="fa fa-plus"></i> 공지사항 입력</button></small>
                            </h4>
                            <table id="notiTable" class="ui celled table hover display nowrap" style="width:100%">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>구분</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>작성일</th>
                                    <th>작성자</th>
                                    <th>조회수</th>
                                    <th>운영</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="qnaTab">
                        <div class="col-md-12">
                            <h4 class="mb-3 text-white" style="background: linear-gradient(45deg, #007c87, transparent)"><i class="fa fa-check"></i>Q&A</h4>
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
                        </div>
                    </div>
                    <div class="tab-pane fade" id="scheduleTab">
                        <h4 class="mb-3 text-white" style="background: linear-gradient(45deg, #007c87, transparent)">
                            <i class="fa fa-check"></i>개강일정
                            <small style="float: right;"><button class="btn btn-sm btn-danger" id="addScheduleBtn"><i class="fa fa-plus"></i> 개강일정 입력</button></small>
                        </h4>
                        <div class="col-md-12">
                            <div id='calendar'></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->
</div>
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

<!-- Modal start -->
<div class="modal fade" id="addScheduleModal" tabindex="-1" role="dialog" aria-labelledby="addScheduleModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addScheduleModalLabel">개강일정 입력</h5>
                <a id="addScheduleCloseBtn"><span class="text-dark fw-bold">x</span> </a>
            </div>
            <div class="modal-body" style="z-index: 1">
                <div class="col-md-12">
                    <div class="row g-2">
                        <div class="col-md-12">
                            <label for="startSchedule"><i class="fa fa-check"></i>날짜</label>
                            <input type="text" id="startSchedule" class="form-control border-1" readonly>
                        </div>
                        <div class="col-md-12">
                            <label for="titleSchedule"><i class="fas fa-edit"></i>일정내용</label>
                            <input type="text" id="titleSchedule" class="form-control border-1">
                        </div>
                        <div class="col-md-12">
                            <label for="colorSchedule"><i class="fa fa-check"></i>일정색상</label>
                            <div class="picker" id="picker1"></div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-success" id="addScheduleSaveBtn"><i class="fa fa-check"></i> 저장</button>
                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal" id="addScheduleCancelBtn"><i class="fa fa-times"></i> 취소</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal end -->

<input type="hidden" id="consultant" value="${consultant}" />

<#include "/common/common_js.ftl">

<script src="page/admin.js"></script>
</body>

</html>