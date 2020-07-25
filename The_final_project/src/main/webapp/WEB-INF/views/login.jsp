<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/oldcss/login.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	<div class="big-logo">
		<a href="index.do"> <img src="" alt="Logo"></a>
	</div>
	
	<div>
		<h1 class="font-cabin">로그인을 해주세요.</h1>
		<br>
		<p>LOGO에 로그인 하여 다양한 정보를 얻으세요.</p>
	</div>
	<form action="loginProcess.do" method="post">
		<label>아이디</label>
		<input type="text" name="id" placeholder="아이디">
		<br> 
		<c:if test="${not empty requestScope.loginfail }">
			<div style="color : red;">
				${requestScope.loginfail } 
			</div>
		</c:if>
		<label>비밀번호</label> 
		<input type="password" name="password" placeholder="비밀번호">
		<br> 
		<a href="#">비밀번호를 잊으셨나요?</a>
		<br> 
		<a href="#"><button class="btn btn-success" type="submit">로그인</button></a>
	</form>
	<br><br><br><br><br>	
	<jsp:include page="./footer.jsp"/>
</body>
</html>