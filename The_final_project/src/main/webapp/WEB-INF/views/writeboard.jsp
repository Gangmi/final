<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--css및 다른 자원  -->

<link rel="stylesheet" href="/resources/css/boardcss/writeboard.css">
<%
	String boardname = (String) request.getAttribute("b_boardname");
%>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<title>자유게시판</title>

</head>
<body>
	<input id=boardname type="hidden" value=<%=boardname%>>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<div class="write-title">
		<h3>글쓰기</h3>
		<label>게시판 선택</label>
			<div class="top_menu">
				<div class="search_box">
					<select id="boardselect">
						<option value="free_board" <%if(boardname.equals("free_board")){ %>selected="selected"<%} %> >자유시게판</option>
						<option value="tip_board"<%if(boardname.equals("tip_board")){ %>selected="selected"<%} %>>팁게시판</option>
						<option value="parcel_board"<%if(boardname.equals("parcel_board")){ %>selected="selected"<%} %>>분양시게판</option>
						<%-- <option <%if(boardname.equals("free_board")){ %>selected="selected"<%} %>>장터시게판</option> --%>
						<option value="nongsain" <%if(boardname.equals("nongsain")){ %>selected="selected"<%} %>>농사 IN 시게판</option>
					</select>
				</div>
				
			</div>
		</div>
	
	
		
		

<section class="whole-write-section">
		
		<div class="">
			<div class="main_box">
			
				<form action="/write.do" method="post"
					id="frm" enctype="multipart/form-data">
					<%-- <input type="hidden" name="boardname" value="<%=boardname%>"/> --%>
					<input type="hidden" id="form-boarname" name="b_boardname"/>
					<label for="title">제목</label>
					<input type="text" name="title" id="title"/>
					<textarea name="contents" id="editor"></textarea>
					<script type="text/javascript"> 
					</script>
					<button class="btn btn-success" type="submit" id="savebutton">확인</button>
					<a href="callboard.do?b_boardname=<%=boardname%>" class="btn btn-primary" id="cancelwrite" role="button">취소</a>
					
				</form>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script src="/resources/js/board/write.js"></script>
<body />

</html>
