<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>




</head>
<body>
<%
	//게시판 값 받아오는 곳
BoardVO result = (BoardVO) request.getAttribute("board");
%>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
 	<div >
 	 Q. <%=result.getTitle() %>  포인트<%=result.getSelectPoint() %>
 	</div>
 	<div>
 	<%=result.getContents() %>
 	</div> 	
	<div>
 	<button type="button">
   		답변하기
	</button>
 	</div>
	<!-- footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
</body>
</html>