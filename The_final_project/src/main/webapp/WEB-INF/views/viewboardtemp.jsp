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

<%
	String boardname = (String) request.getParameter("b_boardname");
	String boardno = (String) request.getParameter("boardno");
	List<BoardVO> repl = (List<BoardVO>) request.getParameter("repl");
%>
<title>project</title>




</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
 	<div>
 	댓글 입력해라 래끼야 <p/>
 	<form action="writerepl.do?b_boardname=<%=boardname%>&boardno=<%=boardno%>" method="post">
      <p><textarea name="contents" cols="50" rows="5"></textarea></p>
      <p><input type="submit" value="Submit"></p>
    </form>
 	</div>
	<div>
		<%for(BoardVO vo: repl){ %>
			<!-- 댓글 리스트 가져오기 -->
			<%=vo.get %>
		<%} %>
	</div>
	<!-- footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
</body>
</html>