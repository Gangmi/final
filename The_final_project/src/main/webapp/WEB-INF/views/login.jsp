<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/login.css">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<section class="header">
			<a href="/The_final_project/index.jsp"><img src="resources/img/logo-2.png" alt="Logo"></a>
		</section>
	</div>

	<div class="main_text">
		<h2>로그인을 해주세요.</h2>
		<br>

		<p>LOGO에 로그인 하여 다양한 정보를 얻으세요.</p>
	</div>
	<form action="loginProcess" method="post">
		<div class="login">
			<div class="id">
				<label>아이디</label><br> <input class="id_box" type="text" name="id"
					placeholder="아이디">
			</div>
			<c:if test="${not empty requestScope.loginfail }"><div style="color : red;">${requestScope.loginfail } </div></c:if>
			<div class="pw">
				<label>비밀번호</label><br> <input class="pw_box" type="password" name="password"
					placeholder="비밀번호">
			</div>
	
			<div class="pw_1">
				<a href="#">비밀번호를 잊으셨나요?</a>
			</div>
	
		</div>
	
		<div class="btn">
			<a href="#"><button type="submit">로그인</button></a>
	
		</div>
	</form>
</body>
</html>