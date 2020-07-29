<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/login/signup.css">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	 <section class="hero-section_join">
        <div>
            <h2>회원정보를 입력해주세요.</h2>
            <br>

            <p>정보를 입력하시면 바로 이용하실 수 있습니다.</p>
        </div>
        <form id="signUp" name="signUp" action="signup_act.do" method="post">
            <div>
                <div class="form-group">
                    <input type="text" class="form-control" name="name" id="fullName" placeholder="*이름">
                     <sup id="name_check">&nbsp;</sup>
                </div>
              
                <div class="form-group">
                    <input type="text" class="form-control" name="id" id="id" placeholder="*아이디">
                	<sup id="id_check">&nbsp;</sup>
                </div>
                
                <div class="form-group">
                    <input type="text" class="form-control" name='nickname' id="nickName" placeholder="*닉네임">
                	<sup id="nick_check">&nbsp;</sup>
                </div>
                
                <div class="form-group">
                    <input type="password" class="form-control" name="password" id="password" placeholder="*비밀번호(영문자/숫자 4~16자)">
                	<sup id=pass_check>&nbsp;</sup>
                </div>
                
                <div class="form-group">
                    <input type="password" class="form-control" id='confirm' placeholder="*비밀번호 확인">
                	<sup id=confirm_check>&nbsp;</sup>
                </div>
                
                <div class="form-group">
                    <p>주소</p>
                    <input type="text" class="form-control" name="postCode" id="postCode" placeholder="*우편번호" readonly>
                   
                    <button id="find_postcode_btn" type="button">주소찾기></button>
                    <br>
                    <input type="text" class="form-control" name="baseAddress" id="baseAddress" placeholder="기본주소" readonly>
                    <input type="text" class="form-control" name="detailAddress" id="detailAddress" placeholder="상세주소">

                </div>

                <div class="form-group">
                    <input type="tel" class="form-control" name="phoneNumber" id="phoneNumber" placeholder="*휴대전화 ( - 포함)">
                    <sup id="phone_check">&nbsp;</sup>
                </div>
                
                <div class="form-group">
                    <input type="email" class="form-control" name="email" id="email" placeholder="*이메일">
                	<sup id="email_check">&nbsp;</sup>
                </div>
                
                <div class="form-group">
                    <input type="date" class="form-control" name="birthDay" placeholder="생년월일">
                </div>

                <div class="form-group">
                    <a href="#"><button class="btn btn-success" type="submit">회원가입</button></a>
                </div>

            </div>
        </form>
    </section>
	<jsp:include page="./footer.jsp" />
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js'></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src='/resources/js/sign_up.js'></script>
</body>
</html>