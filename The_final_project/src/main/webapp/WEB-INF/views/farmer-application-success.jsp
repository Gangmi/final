<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="./header.jsp"></jsp:include>
    <div>
    	${sessionScope.memberinfo.id } 님  ${sessionScope.application.no }번호로 신청이 완료 되었습니다.
    	<a href="/mypage.do"><button>My페이지로 가기</button></a>
    </div>
   
    <jsp:include page="./footer.jsp"></jsp:include>
  
</body>
</html>