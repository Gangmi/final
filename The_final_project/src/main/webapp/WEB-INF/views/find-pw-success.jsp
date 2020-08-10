<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	
<link rel="stylesheet" href="/resources/css/login/find-pw.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="find-container">
	<div class="find_email">
		<h5>회원님의 비밀번호는 ${find_pw} 로 초기화 되었습니다.</h5>
	</div>
	<button class="btn btn-info" id="goto_findPW">비밀번호 찾기</button>
	<button class="btn btn-outline-primary" id="goto_login">닫기</button>
	
		<script src="/resources/js/jquery-3.3.1.min.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="/resources/js/jquery.magnific-popup.min.js"></script>
		<script src="/resources/js/jquery.nice-select.min.js"></script>
		<script src="/resources/js/jquery-ui.min.js"></script>
		<script src="/resources/js/jquery.slicknav.js"></script>
		<script src="/resources/js/owl.carousel.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$('#goto_login').click(function(e){
					opener.close();
					window.close();
				});	
				$('#goto_findPW').click(function(e){
					opener.location.href='find-pw.do';
					window.close();
				});
			});
		</script>
</div>
</body>

</html>