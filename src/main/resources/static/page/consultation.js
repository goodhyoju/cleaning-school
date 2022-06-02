$(document).ready(function() {
    $("#phone").on("input", function () {
        var temp = destroyMask($(this).val());
        $(this).val(createMask(temp));
    });

    $("#consultationBtn").click(function(){
        var getName = $("#name").val();
        var getPhone = $("#phone").val();
        var getEmail = $("#email").val();
        var getReqInfo = $("#reqInfo").val();

        if(isEmpty(getName) ||
            isEmpty(getPhone) ||
            isEmpty(getEmail))
        {
            alert('이름,핸드폰,E-mail 를 모두 입력하세요.');
            return false;
        }
        if (confirm('입력하신 내용으로 상담신청 하시겠습니까?')) {
            var json = {
                name: getName,
                phone: getPhone,
                email: getEmail,
                info: getReqInfo,
                status: 0
            };

            try {
                $.ajax({
                    url: APIIP+"school/saveConsultation",
                    type: "POST",
                    data: JSON.stringify(json),
                    dataType: 'json',
                    contentType: "application/json; UTF-8;",
                    success: function(data){
                        alert("상담 신청이 완료되었습니다.\n제공해주신 연락처로 연락드리겠습니다.");
                    },
                    error: function (request, status, error){
                        alert("상담 신청을 실패하였습니다.["+error+"]");
                    }
                });
            } catch (error) {
                console.error(error);
            }
        }

    });

});