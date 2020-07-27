<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	회원님의 아이디는 ${find_email} 입니다.
</div>
<button id="goto_findPW">비밀번호 찾기</button>
<button id="goto_login">닫기</button>

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
</body>

</html>