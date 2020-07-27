<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page import="com.kos.vo.BoardVO" %>	
	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/boardcss/viewboard.css">

<meta charset="UTF-8">
<title>project</title>




</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<%BoardVO result=(BoardVO)request.getAttribute("board"); %>
	<section class="hero-section">
	
	<div class="container" id="board">
		<div id="boardname" class="container"><a href=#><%=result.getB_boardname() %></a></div>
		<div class="container" id="title">
			<h2><%=result.getTitle() %></h2>
		</div>
		
		<div class=container id=contents>
 			<%=result.getContents()%>
		</div>
	</div>
	</section>
	<!-- footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
</body>
</html>