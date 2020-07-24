<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="signUp" name="signUp" action="signup_act.do" method="post">
		<div class="login">
			<div class="name">
				<input class="login_box" type="text" name="name" id="fullName"
					placeholder="*이름">
			</div>
			<sup id="name_check">&nbsp;</sup>
			<div class="id">
				<input class="login_box" type="text" name="id" id="id"
					placeholder="*아이디">
			</div>
			<sup id="id_check">&nbsp;</sup>
			<div class="nick">
				<input class="login_box" type="text" name='nickname' id="nickName"
					placeholder="*닉네임">
			</div>
			<sup id="nick_check">&nbsp;</sup>
			<div class="pw">
				<input class="login_box" type="password" name="password"
					id="password" placeholder="*비밀번호(영문자/숫자 4~16자)">
			</div>
			<sup id=pass_check>&nbsp;</sup>
			<div class="pw_2">
				<input class="login_box" type="password" id='confirm'
					placeholder="*비밀번호 확인">
			</div>
			<sup id=confirm_check>&nbsp;</sup>
			<div class="ad">
				<p>주소</p>
				<input class="adress" type="text" name="postCode" id="postCode"
					placeholder="*우편번호" readonly>
				<button id="find_postcode_btn" type="button">주소찾기 ></button>
				<br> <input class="ad_1" type="text" name="baseAddress"
					id="baseAddress" placeholder="기본주소" readonly> <input
					class="ad_1" type="text" name="detailAddress" id="detailAddress"
					placeholder="상세주소">

			</div>

			<div class="phone">
				<input class="login_box" type="tel" name="phoneNumber"
					id="phoneNumber" placeholder="*휴대전화 ( - 포함)">
			</div>
			<sup id="phone_check">&nbsp;</sup>
			<div class="email">
				<input class="login_box" type="email" name="email" id="email"
					placeholder="*이메일">
			</div>
			<sup id="email_check">&nbsp;</sup>
			<div class="birth">
				<input class="login_box" type="date" name="birthDay"
					placeholder="생년월일">
			</div>


		</div>
		<div class="btn">
			<button type="submit">가입하기</button>

		</div>
	</form>
</body>
</html>