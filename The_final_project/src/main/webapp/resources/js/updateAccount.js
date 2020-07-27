$(document).ready(function () {
    var fullNameCheck=false;
    var nickCheck=false;
    var nickCheck2=false;
    var passCheck=false;
    var passConfirmCheck=false;
    var phoneCheck=false;
    var emailCheck=false;
    //이름 자릿수, 한글 체크
    $('#fullName').keyup(function(){
        //한글 2~5자리 수 
        var re=/[가-힣]{2,5}/g;
        if($('#fullName').val().match(re)==null){
            $("#name_check").html("한글 2~10자리이여야 합니다.");
            $("#name_check").css({"color":"red"});
            fullNameCheck=false;
        }
        if($('#fullName').val().match(re)!=null){
            $("#name_check").html("<br>");
            fullNameCheck=true;
        }
    });
    
    //input tag submit 막기
    $("input[type=text]").keypress(function(e) { 

        if (e.keyCode == 13){ //13 = enter key
            e.preventDefault(); //submit 막기

        }    
    });
    $("input[type=password]").keypress(function(e) { 

        if (e.keyCode == 13){
            e.preventDefault();

        }    
    });
    
    //
    $('#nickName').keyup(function(){
        var re= /^[가-힣a-zA-Z]{2,10}/;
        if($('#nickName').val().match(re)!=null){
            $('#nick_check').css({"color":"blue"});
            nickCheck2=true;
        }else{
            $('#nick_check').html("2~10자리 문자 또는 숫자");
            $('#nick_check').css({"color":"red"});
            nickCheck2=false;
        }
    });
    
    //닉네임 중복체크
    $('#nickName').blur(function(){
        $.ajax({
            url: "CheckID.do",
            type: "POST",
            data:  "nickname="+$("#nickName").val(),
            success: function(data){
                if(data=="사용중인 닉네임입니다."){       
                    $("#nick_check").html(data);
                    $('#nick_check').css({"color":"red"});
                    nickCheck=false;
                }
                else if(data=="사용가능한 닉네임입니다."){
                    $("#nick_check").html(data);
                    $("#nick_check").css({"color":"blue"});
                    nickCheck=true;
                }
            },
            error: function (request, status, error){ 
                
                $("#nick_check").html("서버에러");
                $("#nick_check").css({"color":"red"});
                nickCheck=false;
            } 
        });
    });
    
    $('#password').keyup(function(){
        var re=/\w{4,16}/g;
        if($('#password').val().match(re)==null){
            $('#pass_check').html("4~16자리 영문/숫자");
            $('#pass_check').css({"color":"red"});
            passCheck=false;
        }
        else if($('#password').val().match(re)!=null){
            $('#pass_check').html("사용가능한 비밀번호 입니다.");
            $('#pass_check').css({"color":"blue"});
            passCheck=true;
        }
        
        if($('#confirm').val()!="")
            {
                if($('#password').val() == $('#confirm').val()){
                    $('#confirm_check').html("확인되었습니다.");
                    $('#confirm_check').css({"color":"blue"});
                    passConfirmCheck=true;
                }else if($('#password').val() != $('#confirm').val()){
                    $('#confirm_check').html("비밀번호가 다릅니다.");
                    $('#confirm_check').css({"color":"red"});
                    passConfirmCheck=false;
                }
            }
    });
    
    $('#confirm').keyup(function(){
        if($('#password').val()==""){
            $('#confirm_check').html("확인할 비밀번호가 없습니다.");
            $('#confirm_check').css({"color":"red"});
        }else{
            if($('#password').val() == $('#confirm').val()){
                $('#confirm_check').html("확인되었습니다.");
                $('#confirm_check').css({"color":"blue"});
                passConfirmCheck=true;
            }else if($('#password').val() != $('#confirm').val()){
                console.log($('#password').val());
                console.log($('#confirm').val())
                $('#confirm_check').html("비밀번호가 다릅니다.");
                $('#confirm_check').css({"color":"red"});
                passConfirmCheck=false;
            }
        }
    });
    
    $('#phoneNumber').keyup(function(){
        var re=/^\d{3}-\d{3,4}-\d{4}$/;
        if($('#phoneNumber').val().match(re)!=null){
            $('#phone_check').html("<br>");
            phoneCheck=true;
        }else{
            $('#phone_check').html("전화번호 (하이폰(-) 포함)");
            $('#phone_check').css({"color":"red"});
            phoneCheck=false;
        }
    });
    
    $("#email").keyup(function(){
        var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if($("#email").val().match(re)!=null){
            $("#email_check").html("<br>");
            emailCheck=true;
        }else{
            $("#email_check").html("잘못된 이메일 형식입니다.");
            $('#email_check').css({"color":"red"});
            emailCheck=false;
        }
    });
    
    $('#find_postcode_btn').click(function(){
        execDaumPostcode();
    })
    
    $('#signUp').submit(function(event){
        if (fullNameCheck==false || $("#fullName").val()==""){
            alert("이름을 확인하세요.");
            return false;
        }else if (nickCheck==false || nickCheck2==false || $("#nickName").val()==""){
            alert("별명을 확인하세요.");
            return false;
        }else if (passCheck==false || $("#password").val()==""){
            
        }else if (passConfirmCheck==false && $("#confirm").val() ==""){
            
        }else if ($("#postCode").val() ==""){
            alert("우편번호를 작성하세요.");
            return false;
        }else if($("#detailAddress").val()==""){
            alert("상세주소를 작성하세요.");
            return false;
        }else if($("#phoneNumber").val()==""){
            alert("휴대전화 번호를 작성하세요.");
            return false;
        }else if($("#email").val()==""){
            alert("이메일을 확인하세요.");
            return false;
        }else if ($("#phoneNumber").val()==""|| phoneCheck==false)
            {
                alert("전화번호를 확인하세요.")
                return false;
            }
            
    })
    
    
    
    //다음 우편번호 api 이용
    
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#postCode').val(data.zonecode);
                $('#baseAddress').val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("#detailAddress").focus();
            }
        }).open();
    }
})