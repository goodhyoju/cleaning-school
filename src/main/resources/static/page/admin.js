var getConsultant,reservationDt,notisDt,qnaDt,reviewDt,calendar;
$(document).ready(function() {
    getConsultant = $("#consultant").val();
    if(isEmpty(getConsultant)){
        getConsultant = '운영자';
    }
    $("#adminTab li:eq(0) a").tab("show");

    reservationDt = $('#reservationTable').DataTable({
        "ordering": false,
        "info":     false,
        "lengthChange": false,
        "pageLength": 10,
        "search": {
            return: true
        },
        "language" : lang_kor,
        "processing": true,
        "bServerSide": true,
        "columns": [
            {"aaData": "idx",width: "10px", className: "alRight"},
            {"aaData": "name", className: "alCenter" },
            {"aaData": "phone", className: "alCenter"  },
            {"aaData": "email", className: "alLeft" },
            {"aaData": "info", className: "alLeft"  },
            {"aaData": "time", className: "alCenter"},
            {"aaData": "status", className: "alCenter" },
            {"aaData": "control", className: "alCenter" }
        ],
        "sAjaxSource" : APIIP+"school/loadConsultationList",
        "sServerMethod": "POST",
        "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
            var getIdx = aData[0];
            var getTime = aData[5];
            var getStatus = aData[6];
            var statusHtml;
            var stautsClass;
            var controlHtml = [];

            if(getStatus==0){
                statusHtml = '<i class="fa fa-exclamation-circle"></i>대기';
            }else if(getStatus==1){
                statusHtml = '<i class="fa fa-user-times"></i>부재';
                stautsClass = 'text-warning'
            }else{
                statusHtml = '<i class="fa fa-check-circle"></i>완료';
                stautsClass = 'text-info'
            }

            controlHtml.push('<div class="btn-group-sm">');
            controlHtml.push('<button class="btn btn-dark"      onclick="reservationStatusClick(\''+getIdx+'\',0)"><i class="fa fa-exclamation-circle"></i>대기</button>');
            controlHtml.push('<button class="btn btn-warning"   onclick="reservationStatusClick(\''+getIdx+'\',1)"><i class="fa fa-user-times"></i>부재</button>');
            controlHtml.push('<button class="btn btn-info"      onclick="reservationStatusClick(\''+getIdx+'\',2)"><i class="fa fa-check-circle"></i>완료</button>');
            controlHtml.push('</div>');

            $("td:eq(5)", nRow).html(moment(getTime).format('YYYY-MM-DD HH:mm'));
            $("td:eq(6)", nRow).html(statusHtml);
            $("td:eq(7)", nRow).html(controlHtml.join(''));
            $(nRow).addClass(stautsClass);
        }
    });

    // notis method start
    notisDt = $('#notiTable').DataTable({
        "ordering": false,
        "info":     false,
        "lengthChange": false,
        "pageLength":10,
        "search": {
            return: true
        },
        "async": false,
        "language" : lang_kor,
        "processing": true,
        "bServerSide": true,
        "columns": [
            {"aaData": "idx",width: "10px","visible": true, className: "alRight hd"},
            {"aaData": "type",width: "70px", className: "alCenter" },
            {"aaData": "title" , className: "alLeft"},
            {"aaData": "comment","visible": false},
            {"aaData": "time",width: "80px", className: "alCenter"},
            {"aaData": "writer",width: "50px", className: "alCenter"  },
            {"aaData": "rcount",width: "50px", className: "alRight" ,render: $.fn.dataTable.render.number( ',' ) },
            {"aaData": "controll",width: "15px","visible": true, className: "alCenter hd"}
        ],
        "sAjaxSource" : APIIP+"school/loadNotisList",
        "sServerMethod": "POST",
        "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
            var getTime = aData['time'];
            var getIdx = aData[0];
            var getTitle = aData[2];

            $("td:eq(3)", nRow).html(moment(getTime).format('YYYY-MM-DD'));
            $("td:eq(6)", nRow).html('<button class="btn btn-sm btn-danger" title="글 삭제"  onclick="deleteNoits('+getIdx+',\''+getTitle+'\')"><i class="fa fa-times"></i>삭제</button>');

        }
    });

    $("#addNotisBtn").click(function (){
        $('#addNotisModal').modal('show');
    });
    var detailRows = [];

    $('#notiTable tbody').on( 'click', 'td:gt(1)', function () {
        var tr = $(this).closest('tr');
        var row = notisDt.row( tr );


        if($(this).attr('class').indexOf('hd') > 0){
            return false;
        }

        //   detailRowsFunc(this);
        try {
            $.ajax({
                url: APIIP+"school/updateNotisCount?idx="+row.data()[0],
                type: "POST",
                success: function(data){
                    notisDt.ajax.reload();
                },
                error: function (request, status, error){
                    console.log(error);
                }

            });
        } catch (error) {
            console.error(error);
        }
        $("#viewNotisTitle").html('['+row.data()[1]+'] '+ row.data()[2]);
        $("#viewNotisWriter").html(moment(row.data()[4]).format('YYYY-MM-DD')+' '+ row.data()[5]);
        $("#viewNotisComment").html(row.data()[3]);
        $("#viewNotisModal").modal('show');
    } );

    notisDt.on( 'draw', function () {
        $.each( detailRows, function ( i, id ) {
            $('#'+id+' td.details-control').trigger( 'click' );
        } );
    } );
    $("#viewNotisCancelBtn,#viewNotisCloseBtn").click(function (){
        $('#viewNotisModal').modal('hide');
    });

    $("#addNotisCloseBtn,#addNotisCancelBtn").click(function (){
        $('#addNotisModal').modal('hide');
    });

    $("#addNotisSaveBtn").click(function (){
        if (confirm('입력하신 내용을 저장하시겠습니까?')) {
            var json = {
                site: "oneshot",
                type: $("#notisType").val(),
                title: $("#notisTitle").val(),
                comment: $("#notisComment").val().replace(/\r\n|\n/gi , "<br>"),
                writer: $("#notisWriter").val()
            };
            try {
                $.ajax({
                    url: APIIP+"school/saveNotis",
                    type: "POST",
                    data: JSON.stringify(json),
                    dataType: 'json',
                    contentType: "application/json; UTF-8;",
                    success: function(data){
                        notisDt.ajax.reload();
                    },
                    error: function (request, status, error){
                        alert("저장에 실패하였습니다.["+error+"]");
                    }
                });
                $('#addNotisModal').modal('hide');
            } catch (error) {
                console.error(error);
            }
        }
    });
    // notis method end
    // qna method start
    qnaDt = $('#qnaTable').DataTable({
        "ordering": false,
        "info":     false,
        "lengthChange": false,
        "pageLength": 10,
        "search": {
            return: true
        },
        "async": false,
        "language" : lang_kor,
        "processing": true,
        "bServerSide": true,
        "columns": [
            {"aaData": "idx",width: "20px", className: "alRight hd"},
            {"aaData": "type",width: "70px", className: "alCenter" },
            {"aaData": "status",width: "80px", className: "alCenter"  },
            {"aaData": "title" , className: "alLeft"},
            {"aaData": "writer",width: "50px", className: "alCenter"  },
            {"aaData": "time",width: "130px", className: "alCenter"},
            {"aaData": "comment","visible": false},
            {"aaData": "answer","visible": false },
            {"aaData": "controll",width: "30px", className: "alCenter hd"}
        ],
        "sAjaxSource" : APIIP+"school/loadQnaList",
        "sServerMethod": "POST",
        "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
            var getIdx      = aData[0];
            var getStatus   = aData[2];
            var getTitle    = aData[3];
            var getTime     = aData[5];

            var getComment  = aData[6];
            var getAnswer   = aData[7];

            var setClass = 'text-dark';
            if(getStatus=='0'){
                getStatus = '미답변';
                setClass = 'text-danger';
            }else{
                getStatus = '답변완료';
            }

            $("td:eq(5)", nRow).html(moment(getTime).format('YYYY-MM-DD HH:mm'));
            $("td:eq(2)", nRow).html(getStatus);
            $("td:eq(6)", nRow).html('<div class="btn-group-sm"><button class="btn btn-success" title="답변 입력" onclick="answerQna('+getIdx+',\''+getTitle+'\',\''+getComment+'\',\''+getAnswer+'\')"><i class="fas fa-reply"></i></button>'+
                '<button class="btn btn-danger" title="글 삭제" onclick="deleteQna('+getIdx+',\''+getTitle+'\')"><i class="fa fa-times"></i></button></div>');

            $(nRow).addClass(setClass);
        }
    });

    $("#addQnaBtn").click(function (){
        $("#qnaWriter").val(randName());
        $('#addQnaModal').modal('show');
    });

    var detailRows = [];

    $('#qnaTable tbody').on( 'click', 'td:gt(1)', function () {
        //  detailRowsFunc(this);
        var tr = $(this).closest('tr');
        var row = qnaDt.row( tr );

        if($(this).attr('class').indexOf('hd') > 0){
            return false;
        }
        $("#viewQnaTitle").html('['+row.data()[1]+'] '+ row.data()[3]);
        $("#viewQnaWriter").html(moment(row.data()[5]).format('YYYY-MM-DD')+' '+ row.data()[4]);
        $("#viewQnaComment").html("<i class='fa fa-arrow-right'></i>질문: "+row.data()[6]);

        if(row.data()[2]=='1'){
            $("#viewQnaAnswer").html("<i class='fa fa-arrow-left'></i>답변: "+row.data()[7]);
        }else{
            $("#viewQnaAnswer").html('');
        }

        $('#viewQnaModal').modal('show');
    } );


    $("#viewQnaCloseBtn,#viewQnaCancelBtn").click(function (){
        $('#viewQnaModal').modal('hide');
    });
    $("#answerQnaCloseBtn,#answerQnaCancelBtn").click(function (){
        $('#answerQnaModal').modal('hide');
    });
    $("#addQnaCloseBtn,#addQnaCancelBtn").click(function (){
        $('#addQnaModal').modal('hide');
    });

    $("#answerQnaSaveBtn").click(function (){
        if (confirm('입력하신 내용을 답글을 남기시겠습니까?')) {
            var json = {
                idx:  $("#answerQnaIdx").val(),
                answer: $("#answerQnaReply").val()
            };
            try {
                $.ajax({
                    url: APIIP+"school/updateQna",
                    type: "POST",
                    data: JSON.stringify(json),
                    dataType: 'json',
                    contentType: "application/json; UTF-8;",
                    success: function(data){
                        qnaDt.ajax.reload();
                    },
                    error: function (request, status, error){
                        alert("저장에 실패하였습니다.["+error+"]");
                    }
                });
                $('#answerQnaModal').modal('hide');
            } catch (error) {
                console.error(error);
            }
        }
    });

    $("#addQnaSaveBtn").click(function (){
        if (confirm('입력하신 내용을 저장하시겠습니까?')) {
            var json = {
                type: $("#qnaType").val(),
                title: $("#qnaTitle").val(),
                comment: $("#qnaComment").val(),
                writer: $("#qnaWriter").val()
            };
            try {
                $.ajax({
                    url: APIIP+"school/saveQna",
                    type: "POST",
                    data: JSON.stringify(json),
                    dataType: 'json',
                    contentType: "application/json; UTF-8;",
                    success: function(data){
                        qnaDt.ajax.reload();
                    },
                    error: function (request, status, error){
                        alert("저장에 실패하였습니다.["+error+"]");
                    }
                });
                $('#addQnaModal').modal('hide');
            } catch (error) {
                console.error(error);
            }
        }
    });
    // qna method start


    // free method start
    var initialLocaleCode = 'ko';
    var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
        },
        locale: initialLocaleCode,
        buttonIcons: true,
        weekNumbers: true,
        navLinks: true,
        editable: false,
        dayMaxEvents: true,
        selectable: false,
       /* select: function(arg) {

            var getStart = moment(arg.start).format('YYYY-MM-DD');
            var getEnd = moment(arg.end).format('YYYY-MM-DD');

            if (confirm('시작일: '+getStart+'\n종료일: '+getEnd+'\n 이날에 손없는 날로 저장하시겠습니까?')) {
                var json = {
                    start: getStart,
                    end: getEnd,
                    title: '손 없는 날'
                };
                try {
                    $.ajax({
                        url: APIIP+"school/saveFree",
                        type: "POST",
                        data: JSON.stringify(json),
                        dataType: 'json',
                        contentType: "application/json; UTF-8;",
                        success: function(data){
                            calendar.refetchEvents();
                        },
                        error: function (request, status, error){
                            alert("저장에 실패하였습니다.["+error+"]");
                        }
                    });
                } catch (error) {
                    console.error(error);
                }
            }

        },*/
        events: {
            url: APIIP+'school/loadSchedule'
        },
        eventColor: '#d0072e',
        eventClick: function(arg) {
            var getStart = moment(arg.start).format('YYYY-MM-DD');
            var getEnd = moment(arg.end).format('YYYY-MM-DD');
            var getId = arg.event.id;

            if (confirm('시작일: '+getStart+'\n종료일: '+getEnd+'\n 이날을 삭제하시겠습니까?')) {
                var json = {
                    idx: getId
                };

                try {
                    $.ajax({
                        url: APIIP+"school/deleteSchedule",
                        type: "POST",
                        data: JSON.stringify(json),
                        dataType: 'json',
                        contentType: "application/json; UTF-8;",
                        success: function(data){
                            calendar.refetchEvents();
                        },
                        error: function (request, status, error){
                            alert("삭제에 실패하였습니다.["+error+"]");
                        }
                    });
                } catch (error) {
                    console.error(error);
                }

            }
        }
    });
    calendar.render();
    // free method end

    $("#addScheduleBtn").click(function (){
        $('#addScheduleModal').modal('show');
    });
    $("#addScheduleCloseBtn,#addScheduleCancelBtn").click(function (){
        $('#addScheduleModal').modal('hide');
    });
    var getColor = '#8e44ad';
    $("#picker1").colorPick({
        'initialColor' : '#8e44ad',
        'palette': ["#1abc9c", "#16a085", "#2ecc71", "#27ae60", "#3498db", "#2980b9", "#9b59b6", "#8e44ad", "#34495e", "#2c3e50", "#f1c40f", "#f39c12", "#e67e22", "#d35400", "#e74c3c", "#c0392b", "#ecf0f1"],
        'onColorSelected': function() {
            console.log("The user has selected the color: " + this.color);
            this.element.css({'backgroundColor': this.color, 'color': this.color});
            getColor = this.color;
        }
    });
    $('#startSchedule').datetimepicker({
        format:'Y-m-d',
        timepicker:false
    });

    $("#addScheduleSaveBtn").click(function (){
        var getStart = $("#startSchedule").val();
        var getEnd = $("#startSchedule").val();
        var getTitle = $("#titleSchedule").val();

        if (confirm('날짜: '+getStart+'\n내용: '+getTitle+'\n색상: '+getColor+'\n\n이일정을 저장하시겠습니까?')) {
            var json = {
                start: getStart,
                end: getEnd,
                title: getTitle,
                color: getColor
            };
            try {
                $.ajax({
                    url: APIIP+"school/saveSchedule",
                    type: "POST",
                    data: JSON.stringify(json),
                    dataType: 'json',
                    contentType: "application/json; UTF-8;",
                    success: function(data){
                        calendar.refetchEvents();
                        $('#addScheduleModal').modal('hide');
                    },
                    error: function (request, status, error){
                        alert("저장에 실패하였습니다.["+error+"]");
                    }
                });
            } catch (error) {
                console.error(error);
            }
        }
    });

    // datatable reload timer(1min)
    var timeout = 60000;
    var reservationReload,notiReload,qnaReload,scheduleReload;
    $('a[data-bs-toggle="tab"]').on("shown.bs.tab", function(e){

        var getHref = $(this).attr('href');

        if(getHref.indexOf('reservationTab') > -1){
            try {
                clearInterval(reservationReload);
                clearInterval(notiReload);
                clearInterval(qnaReload);
                clearInterval(scheduleReload);
            }catch (error){
                console.log(error);
            }
            try {
                reservationReload = setInterval(function() {reservationDt.ajax.reload();}, timeout);
            }catch (error){
                console.log(error);
            }
        }else if(getHref.indexOf('notiTab') > -1){
            try {
                //  clearInterval(eazyReload);
                clearInterval(reservationReload);
                clearInterval(notiReload);
                clearInterval(qnaReload);
                clearInterval(scheduleReload);
            }catch (error){
                console.log(error);
            }
            try {
                notiReload = setInterval(function() {notisDt.ajax.reload();}, timeout);
            }catch (error){
                console.log(error);
            }
        }else if(getHref.indexOf('scheduleTab') > -1){
            try {
                clearInterval(reservationReload);
                clearInterval(notiReload);
                clearInterval(qnaReload);
                clearInterval(scheduleReload);
            }catch (error){
                console.log(error);
            }
            try {
                setTimeout(function() {calendar.render();}, 500);

                scheduleReload = setInterval(function() {calendar.refetchEvents();}, timeout);
            }catch (error){
                console.log(error);
            }
        }
    });

    $(".fc-button").addClass('btn-sm');
});


function reservationStatusClick(idx,status){
    if(status==0){
        title = '상담신청을 대기로 변경 하시겠습니까?'
    }else if(status==1){
        title = '상담신청을 부재로 변경 하시겠습니까?'
    } else{
        title = '상담신청을 완료로 변경 하시겠습니까?'
    }
    if (confirm(title)) {
        var json = {
            idx: idx,
            status: status
        };
        try {
            $.ajax({
                url: APIIP+"school/updateConsultation",
                type: "POST",
                data: JSON.stringify(json),
                dataType: 'json',
                contentType: "application/json; UTF-8;",
                success: function(data){
                    reservationDt.ajax.reload();
                },
                error: function (request, status, error){
                    alert("저장에 실패하였습니다.["+error+"]");
                }
            });
        } catch (error) {
            console.error(error);
        }
    }
}

function deleteNoits(idx,title){
    if (confirm('['+ title+ "]를 삭제 하시겠습니까?")) {

        try {
            $.ajax({
                url: APIIP+"school/deleteNotis?idx="+idx,
                type: "POST",
                success: function(data){
                    notisDt.ajax.reload();
                },
                error: function (request, status, error){
                    alert("삭제를 실패하였습니다.["+error+"]");
                }
            });
        } catch (error) {
            console.error(error);
        }
    }
}

function deleteQna(idx, title){
    if (confirm('['+ title+ "]를 삭제 하시겠습니까?")) {

        try {
            $.ajax({
                url: APIIP+"oneshot/deleteQna?idx="+idx,
                type: "POST",
                success: function(data){
                    qnaDt.ajax.reload();
                },
                error: function (request, status, error){
                    alert("삭제를 실패하였습니다.["+error+"]");
                }

            });
        } catch (error) {
            console.error(error);
        }
    }
}

function answerQna(idx,title,comment,answer){
    $("#answerQnaTitle").val(title);
    $("#answerQnaComment").val(comment);

    if(answer!=null && answer !='null'){
        $("#answerQnaReply").val(answer);
    }else{
        $("#answerQnaReply").val('');
    }
    $("#answerQnaIdx").val(idx);
    $('#answerQnaModal').modal('show');
}