<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
	<form id="updateAccount" name="updateAccount" action="updateAccount_act.do"
		method="post">
		<div>
			<div>
				<input type="text" name="name" id="fullName" 
					value="${sessionScope.memberinfo.name }" 
					placeholder="*이름">
			</div>
			<sup id="name_check">&nbsp;</sup>
			<div>
				<input type="text" name="id" id="id" 
					value="${sessionScope.memberinfo.id }" 
					placeholder="*아이디" readonly="readonly">
			</div>
			<sup id="id_check">&nbsp;</sup>
			<div>
				<input type="text" name='nickname' id="nickName" 
					value="${sessionScope.memberinfo.nickname }" 
					placeholder="*닉네임">
			</div>
			<sup id="nick_check">&nbsp;</sup>
			<div>
				<input type="password" name="password" placeholder="현재 비밀번호">
			</div>
			<br>
			<div>
				<input type="password" name="updatepassword" id="password"
					placeholder="*변경 비밀번호(영문자/숫자 4~16자)">
			</div>
			<sup id=pass_check>&nbsp;</sup>
			<div>
				<input type="password" id='confirm' placeholder="*변경 비밀번호 확인">
			</div>
			<sup id=confirm_check>&nbsp;</sup>
			<div class="ad">
				<p>주소</p>
				<input type="text" name="postCode" id="postCode" 
					value="${sessionScope.memberinfo.postCode }" 
					placeholder="*우편번호" readonly>
				<button id="find_postcode_btn" type="button">주소찾기 ></button>
				<br> 
				<input type="text" name="baseAddress" id="baseAddress"
					value="${sessionScope.memberinfo.baseAddress}"
					placeholder="기본주소" readonly> 
				<input type="text" name="detailAddress" id="detailAddress" 
					value="${sessionScope.memberinfo.detailAddress}" 
					aceholder="상세주소">

			</div>

			<div>
				<input type="tel" name="phoneNumber" id="phoneNumber"
					value="${sessionScope.memberinfo.phoneNumber }" placeholder="*휴대전화 ( - 포함)">
			</div>
			<sup id="phone_check">&nbsp;</sup>
			<div>
				<input type="email" name="email" id="email"
					value="${sessionScope.memberinfo.email }"
					 placeholder="*이메일">
			</div>
			<sup id="email_check">&nbsp;</sup>
			<div>
				<input type="date" name="birthDay" 
					value="${sessionScope.memberinfo.birthDay }"
					placeholder="생년월일">
			</div>


		</div>
		<div>
			<button type="submit">변경하기</button>
		</div>
	</form>
	
	<jsp:include page="./footer.jsp"/>
	<script src="/resources/js/updateAccount.js"></script>
	
</body>
</html>