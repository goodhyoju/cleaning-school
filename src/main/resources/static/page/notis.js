var dt;

$(document).ready(function() {

    function format ( d ) {
        console.log(d);
        return '<span class=""><i class="fa fa-check text-primary me-3"></i>작성일: '+moment(d[6]).format('YYYY-MM-DD hh:mm')+'</span><br><br>'+
            '<span class=""><i class="fa fa-check text-primary me-3"></i>제목: '+d[4]+'</span><br>'+
            '<span class=""><i class="fa fa-check text-primary me-3"></i>내용: '+d[5]+'</span>';
    }
    dt = $('#notiTable').DataTable({
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
            {"aaData": "idx",width: "1px","visible": true, className: "alRight hd"},
            {"aaData": "type",width: "70px", className: "alCenter" },
            {"aaData": "title" , className: "alLeft"},
            {"aaData": "comment","visible": false},
            {"aaData": "time",width: "80px", className: "alCenter"},
            {"aaData": "writer",width: "50px", className: "alCenter"  },
            {"aaData": "rcount",width: "50px", className: "alRight" ,render: $.fn.dataTable.render.number( ',' ) }
        ],
        "sAjaxSource" : APIIP+"school/loadNotisList",
        "sServerMethod": "POST",
        "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
            var getTime = aData['time'];
            $("td:eq(3)", nRow).html(moment(getTime).format('YYYY-MM-DD'));
        }
    });


    var detailRows = [];

    $('#notiTable tbody').on( 'click', 'td:gt(1)', function () {
        var tr = $(this).closest('tr');
        var row = dt.row( tr );

        if($(this).attr('class').indexOf('hd') > 0){
            return false;
        }

        try {
            $.ajax({
                url: APIIP+"school/updateNotisCount?idx="+row.data()[0],
                type: "POST",
                success: function(data){
                    dt.ajax.reload();
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

    // On each draw, loop over the `detailRows` array and show any child rows
    dt.on( 'draw', function () {
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
} );