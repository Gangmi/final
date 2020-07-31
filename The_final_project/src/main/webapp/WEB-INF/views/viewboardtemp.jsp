<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kos.vo.BoardVO"%>
<%@page import="com.kos.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="/resources/js/board/boardrepl.js"></script>
<meta charset="UTF-8">

<%

	String boardname = (String) request.getParameter("b_boardname");
	String boardno = (String) request.getParameter("boardno");
	
	%>
<title>project</title>




</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
 	<div>
 	<p>댓글 <p/>
 	<form id="commentInsertForm" name="commentInsertForm" ><%-- action="writerepl.do?b_boardname=<%=boardname%>&boardno=<%=boardno%>" method="post"> --%>
 		<input type="hidden" name="b_boardname" value="<%=boardname%>">
 		<input type="hidden" name="boardno" value="<%=boardno%>">
      <p><textarea id="comment" name="contents" cols="50" rows="5"></textarea></p>
      <p><input type="button"  id="commentInsertBtn" name="commentInsertBtn" value="댓글 입력"></p>
      <!-- <p><input type="submit" value="Submit"></p> -->
    </form>
 	</div>
	<div id="repl">

	</div>
	<!-- footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>