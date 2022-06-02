var dt;

$(document).ready(function() {

    function format ( d ) {
        var html = '<span class=""><i class="fa fa-check text-primary me-3"></i>제목: '+d[4]+'</span><br>'+
            '<span class=""><i class="fa fa-check text-primary me-3"></i>내용: '+d[5]+'</span>';
        if(d[7] !=null && d[7].length > 1){
            html+='<br><br><span class="fw-bold"><i class="fa fa-arrow-right text-danger me-3"></i>답변: '+d[7]+'</span>';
        }
        return html;
    }
    dt = $('#qnaTable').DataTable({
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

        responsive: {
            details: {
                renderer: function ( api, rowIdx, columns ) {
                    var data = $.map( columns, function ( col, i ) {
                        return col.hidden ?
                            '<tr data-dt-row="'+col.rowIndex+'" data-dt-column="'+col.columnIndex+'">'+
                            '<td>'+col.title+':'+'</td> '+
                            '<td>'+col.data+'</td>'+
                            '</tr>' :
                            '';
                    } ).join('');

                    return data ?
                        $('<table/>').append( data ) :
                        false;
                }
            }
        },
        "columns": [
            {"aaData": "idx",width: "20px","visible": false},
            {"aaData": "type",width: "70px", className: "alCenter hd" },
            {"aaData": "status",width: "80px", className: "alCenter"  },
            {"aaData": "title" , className: "alLeft"},
            {"aaData": "writer",width: "50px", className: "alCenter"  },
            {"aaData": "time",width: "130px", className: "alCenter"},
            {"aaData": "comment","visible": false},
            {"aaData": "answer","visible": false },
            {"aaData": "controll","visible": false }
        ],
        "sAjaxSource" : APIIP+"school/loadQnaList",
        "sServerMethod": "POST",
        "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
            var getTime = aData[5];
            var getStatus = aData[2];

            if(getStatus=='0'){
                getStatus = '<label class="bg-danger rounded text-white p-1">미답변</label>'
            }else{
                getStatus = '<label class="bg-success rounded text-white p-1">답변완료</label>'
            }
            $("td:eq(4)", nRow).html(moment(getTime).format('YYYY-MM-DD HH:mm'));
            $("td:eq(1)", nRow).html(getStatus);
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
        var row = dt.row( tr );

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

    // On each draw, loop over the `detailRows` array and show any child rows
    dt.on( 'draw', function () {
        $.each( detailRows, function ( i, id ) {
            $('#'+id+' td.details-control').trigger( 'click' );
        } );
    } );

    $("#viewQnaCloseBtn,#viewQnaCancelBtn").click(function (){
        $('#viewQnaModal').modal('hide');
    });

    $("#addQnaCloseBtn,#addQnaCancelBtn").click(function (){
        $('#addQnaModal').modal('hide');
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
                        dt.ajax.reload();
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

} );