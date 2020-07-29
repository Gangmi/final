<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--css및 다른 자원  -->


<%
	String boardname = (String) request.getAttribute("b_boardname");
%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<title>자유게시판</title>

</head>
<body>
	<input id=boardname type="hidden" value=<%=boardname%>>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	
	<section class="hero-section">
	
		<div class="container">
		<h3>글쓰기</h3>
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
		</div>
		</section>


<section class="hero-section">
		<div class="container">
			<div class="main_box">
			
				<form action="/write.do" method="post"
					id="frm" enctype="multipart/form-data">
					<input type="hidden" name="boardname" value="<%=boardname%>"/>
					<input type="hidden" name="b_boardname" value="<%=boardname%>"/>
					<input type="text" name="title"/>
					<textarea name="contents" id="editor"></textarea>
					<script type="text/javascript">
					</script>
					<button type="submit" id="savebutton">dz</button>
				</form>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script src="/resources/js/board/write.js"></script>
<body />

</html>
