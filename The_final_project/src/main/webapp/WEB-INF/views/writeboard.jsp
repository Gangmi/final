<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--css및 다른 자원  -->
<link rel="stylesheet" href="resources/css/write_board.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="resources/js/write.js"></script>
<%
	String boardname = (String) request.getAttribute("b_boardname");
%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<title><%=boardname%></title>
<script type="text/javascript" src="resources/js/write.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="Board/side.jsp" />
	<div class="top_menu">
		<div class="search_box">
			<select>
				<option>자유시게판</option>
				<option>팁게시판</option>
				<option>분양시게판</option>
				<option>장터시게판</option>
				<option>농사 IN 시게판</option>
			</select>
		</div>
	</div>
	<div class="main_box">
		<div class="title">
			제목 쓰기 <input type="text" name="title" />
		</div>
		<form action="write.do?b_boardname=free_board" method="post" id="frm">
			<textarea name="contents" id="editor" rows="10" cols="100"></textarea>
			<script type="text/javascript">
				
			</script>
			<input type="button" id="savebutton" value="서버전송" />
		</form>
	</div>


	<div id="footer">
		<p>@COPYRIGHT_</p>
	</div>
<body />
</html>
