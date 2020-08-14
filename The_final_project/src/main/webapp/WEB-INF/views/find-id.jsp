<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>아이디 찾기</title>
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/flaticon.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
	
	<link rel="stylesheet" href="/resources/css/login/find-id.css">
    
</head>
<body>
    <div class="find-container">
       <div class="title"><h2>아이디 찾기</h2></div>
       <div class="find-form">
        <form action="find_id_act.do" class=".form-inline" id="findId" method="post" target="result">
            <table class="">
                <colgroup>
                <col width=130px/>
                <col/>
                <col width=200px/>
	            </colgroup>
                <tr>
                    <td><label for="name">이름</label></td>
                    <td><input type="text" class="form-control" name="name"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td><label for="email">이메일</label></td>
                    <td><input type="email" class="form-control" name="email"/></td>
                    <td class="Certification"><button id="certification" class="btn btn-info" type="button" >인증번호 받기</button>
                    <span id="timer"><span id="min">03</span>:<span id="sec">00</span></span></td>
                </tr>
                <tr>
                    <td><label for="">인증번호</label></td>
                    <td><input type="text" class="form-control" name="certification"/></td>
                    <td id="info"></td>
                </tr>
                <tr>
                   <td colspan="2">
                       <button type="button" class="btn btn-info" id="btnFind" disabled>아이디 찾기</button>
                       <a href="find-pw.do">비밀번호 찾기</a>
                   </td>
                   <td><button type="button" class="btn btn-outline-primary" id="windowClose"> 닫기</button></td>
                </tr>
            </table>
        </form>
        </div>
    </div>
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#windowClose").click(function(){
				window.close();
            });
        $("#btnFind").click(function (e){
        	 var re2=/\w{6}/g;
             if($('input[name="certification"]').val().match(re2)==null){
                 alert("인증번호를 확인하세요.");
                return false;
             }
             
        	window.open("", "result", "height=300, width=600, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=50, top=50");
            $('#findId').submit();
        });
        $("#certification").click(function(){
        	var re=/[가-힣]{2,5}/g;
       	 	var re1=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
       	 
        	if($('input[name="name"]').val().match(re)==null){
                alert("이름을 작성하세요.");
               return false;
            }
            if($('input[name="email"]').val().match(re1)==null){
                alert("email 작성하세요.");
               return false;
            }
            var querry = $('#findId').serialize();
            $('#certification').attr('disabled',true);
            var min = Number($('#min').html());
            var sec = Number($('#sec').html());
            
            var intervalId;
            if(intervalId != undefined)
                clearInterval(intervalId)
            $('#timer').css({"visibility":"visible"});
            var intervalId=setInterval(function(){
            
                sec= sec -1;
                if(sec == -1)
                {
                    sec = 59;
                    $('#sec').html(pad(sec,2));
                    if(min != 0){
                        min = min-1;
                        $('#min').html(pad(min,2));
                    }
                }
                $('#sec').html(pad(sec,2));
                if(min == 0 && sec == 0){
                    $.ajax({
                        url: "timeout-session.do",
                        type: "POST",
                        success: function(data){
                        },
                        error:function(){
                            $('#timer').css({"visibility":"hidden"});
                            $('#certification').attr('disabled',true);
                            $('#timer').html('서버에러');
                        }
                    });
                    $('#timer').css({"visibility":"hidden"});
                    $('#certification').attr('disabled',false);
                    $('#min').html('03');
                    $('#sec').html('00');
                    clearInterval(intervalId);
                }
           
            },1000);
            $.ajax({
                        url: "certification-session.do",
                        type: "POST",
                        data: querry,
                        success: function(data){
                           if(data =='검색결과없음')
                           {
                        	   $('#certification').attr('disabled',false);
                        	   clearInterval(intervalId);
                        	   $('#timer').css({"visibility":"hidden"});
                               $('#min').html('03');
                               $('#sec').html('00');
                               alert("검색결과가 없습니다.");
                               $('#info').html("");
                               return;
                           }
                           $('input[name="name"]').attr('readonly',true);
                    	   $('input[name="email"]').attr('readonly',true);
                            $('#info').html("이메일을 확인하세요.");
                        },
                        error:function(){
                            $('#timer').css({"visibility":"hidden"});
                            $('#certification').attr('disabled',true);
                            $('#min').html('03');
                            $('#sec').html('00');
                            $('#timer').html('서버에러');
                            clearInterval(intervalId);
                        }
                    });    
            $('#btnFind').attr("disabled",false);
        });
    
        
        function pad(n, width) {
          n = n + '';
          return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
        }
    });
    </script>
</body>
</html>