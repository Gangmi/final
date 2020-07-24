<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<form id="updateAccount" name="updateAccount" action="updateAccount.do"
		method="post">
		<div>
			<div>
				<input type="text" name="name" id="fullName" placeholder="*이름">
			</div>
			<sup id="name_check">&nbsp;</sup>
			<div>
				<input type="text" name="id" id="id" placeholder="*아이디">
			</div>
			<sup id="id_check">&nbsp;</sup>
			<div>
				<input type="text" name='nickname' id="nickName" placeholder="*닉네임">
			</div>
			<sup id="nick_check">&nbsp;</sup>
			<div>
				<input type="password" name="currentpassword" placeholder="현재 비밀번호">
			</div>
			<br>
			<div>
				<input type="password" name="password" id="password"
					placeholder="*변경 비밀번호(영문자/숫자 4~16자)">
			</div>
			<sup id=pass_check>&nbsp;</sup>
			<div>
				<input type="password" id='confirm' placeholder="*변경 비밀번호 확인">
			</div>
			<sup id=confirm_check>&nbsp;</sup>
			<div class="ad">
				<p>주소</p>
				<input type="text" name="postCode" id="postCode" placeholder="*우편번호"
					readonly>
				<button id="find_postcode_btn" type="button">주소찾기 ></button>
				<br> <input type="text" name="baseAddress" id="baseAddress"
					placeholder="기본주소" readonly> <input type="text"
					name="detailAddress" id="detailAddress" placeholder="상세주소">

			</div>

			<div>
				<input type="tel" name="phoneNumber" id="phoneNumber"
					placeholder="*휴대전화 ( - 포함)">
			</div>
			<sup id="phone_check">&nbsp;</sup>
			<div>
				<input type="email" name="email" id="email" placeholder="*이메일">
			</div>
			<sup id="email_check">&nbsp;</sup>
			<div>
				<input type="date" name="birthDay" placeholder="생년월일">
			</div>


		</div>
		<div>
			<button type="submit">변경하기</button>
		</div>
	</form>
	<script type="text/javascript" src="/resources/js/updateAccount.js"></script>
</body>
</html>