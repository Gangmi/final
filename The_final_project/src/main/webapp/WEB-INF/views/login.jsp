<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/login/login.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	 <section class="hero-section">
        <div class="big-logo">
		<a href="index.do"> <img src="/resources/img/mainlogo.png" alt="Logo"></a>
	</div>
	
	<div class="container">
		<h1 class="font-cabin">로그인을 해주세요.</h1>
		<br>
		<p>여름지기에 로그인 하여 다양한 정보를 얻으세요.</p>
	</div>
	<form action="/loginProcess.do" method="post">
		<label> </label>
		<input type="text" name="id" placeholder="아이디">
		<br> 
		<c:if test="${not empty requestScope.loginfail }">
			<div style="color : red;">
				${requestScope.loginfail } 
			</div>
		</c:if>
		<label></label>
		<input type="password" name="password" placeholder="비밀번호">
		<br> 
		<a href="find-id.do" id=findId>비밀번호를 잊으셨나요?</a>
		<br>
        <div class="btn1">
            <a href="#"><button class="btn btn-success" type="submit">로그인</button></a>
            <a role="button" href="/sign_up.do" class="btn btn-success" type="submit">회원가입</a>
        </div>
	</form>
	<br><br><br><br><br>	
    </section>
	<jsp:include page="./footer.jsp"/>
		
	<script type="text/javascript">
		$(document).ready(function(){
			$('#findId').click(function(e){
				e.preventDefault();
				window.open("find-id.do", "findID", "height=500, width=700, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=50, top=50");
			});
		});
	</script>
</body>
</html>