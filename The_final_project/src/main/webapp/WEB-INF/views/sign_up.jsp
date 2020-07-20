<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/sign_up.css">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<section class="header">
			<a href="index"><img src="resources/img/logo-2.png" alt="Logo"></a>
		</section>
	</div>

	<div class="main_text">
		<h2>회원정보를 입력해주세요.</h2>
		<br>

		<p>정보를 입력하시면 바로 이용하실 수 있습니다.</p>
	</div>

	<div class="login">
		<div class="name">
			<input class="login_box" type="text" placeholder="이름">
		</div>

		<div class="id">
			<input class="login_box" type="text" placeholder="아이디">
		</div>

		<div class="nick">
			<input class="login_box" type="text" placeholder="닉네임">
		</div>

		<div class="pw">
			<input class="login_box" type="password"
				placeholder="비밀번호(영문자/숫자 4~16자)">
		</div>

		<div class="pw_2">
			<input class="login_box" type="password" placeholder="비밀번호 확인">
		</div>

		<div class="ad">
			<p>주소</p>
			<input class="adress" type="text" placeholder="">
			<button type="button">주소찾기 ></button>
			<br> 
			<input class="ad_1" type="text" placeholder="기본주소">
		 	<input class="ad_1" type="text" placeholder="상세주소"> 
			
		</div>

		<div class="phone">
			<input class="login_box" type="tel" placeholder="휴대전화">
		</div>

		<div class="email">
			<input class="login_box" type="email" placeholder="이메일">
		</div>

		<div class="birth">
			<input class="login_box" type="date" placeholder="생년월일">
		</div>


	</div>

	<div class="btn">
		<a href="#"><button type="submit">가입하기</button></a>

	</div>

</body>
</html>