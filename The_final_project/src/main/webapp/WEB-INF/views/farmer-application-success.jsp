<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/nongbu/farmer-application-success.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="./header.jsp"></jsp:include>
     <div class="main">
    	<div class="contents">
	    	<h2> ${sessionScope.memberinfo.id }님   ${sessionScope.application.no }번호로 신청이 완료 되었습니다.</h2>
	    	<div class="button">
	    	<a  href="/mypage.do"><button class="btn btn-success">My페이지로 가기</button></a>
	    	</div>
    	</div>
    </div>
   
    <jsp:include page="./footer.jsp"></jsp:include>
  
</body>
</html>