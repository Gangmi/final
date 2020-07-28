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
	String boardname = (String) request.getAttribute("boardname");
	BoardVO vo=(BoardVO)request.getAttribute("board");
	
		
		 

%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<title>글 수정하기</title>

</head>
<body>
	<input id="boardname" type="hidden" value=<%=boardname%>>
	
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	
	<section class="hero-section">
	
		<div class="container">
		<h3>글수정</h3>
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
			
				<form action="/updateboard.do" method="post"
					id="frm" enctype="multipart/form-data">
					<input id="boardno" name="boardno" type="hidden" value="<%=vo.getBoardno()%>">
					<input type="hidden" name="b_boardname" value="<%=boardname%>"/>
					<input type="text" name="title" value="<%=vo.getTitle() %>"/>
					<textarea name="contents" id="editor"><%=vo.getContents() %></textarea>
					<script type="text/javascript">
					</script>
					<button class="btn btn-success"type="submit" id="savebutton">수정완료</button>
				</form>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script src="/resources/js/board/modifyboard.js"></script>
<body />

</html>
