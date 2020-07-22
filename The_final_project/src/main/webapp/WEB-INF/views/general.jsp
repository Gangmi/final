<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/css/general.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="resources/js/general.js"></script>
<%
	List<BoardVO> result = (List<BoardVO>) request.getAttribute("boardlist");
	String boardname=(String)request.getAttribute("b_boardname");
%>
<title><%=boardname %></title>
</head>
<body>
<jsp:include page="Board/header.jsp" />
<jsp:include page="Board/side.jsp" />

	


	<div class="top_menu">
		<div class="search_box">
			<input class="search" type="text" placeholder="Search">
			<button type="submit">
				<img src="resources/img/search.png">
			</button>
		</div>
	</div>

	<div class="main_box">
		<div class="main_menu">
			<p>자유게시판</p>
			<p>제목</p>
			<p>닉네임</p>
			<p>작성일</p>
			<p>조회</p>
		</div>
		<!--글쓰기시에 스크립트로 redirection 됨  -->
		<form method="get" action="writeboard.do">
		<div class="text_btn">
			<input type="hidden" name="b_boardname" value=<%=boardname%>>
			<button id="write_board" type="submit">글쓰기</button>
		</div>
		</form>

	</div>


	<!--게시판 글 표시되는 부분  -->
	<div class="main_text">

		<%
			if (!result.isEmpty()) {
			for (BoardVO vo : result) {
		%>

		<table>
			<tr>
				<th width="130"><%=vo.getB_num()%></th>
				<th width="659"><a href="viewboard.do?b_boardname=<%=boardname%>&b_num=<%=vo.getB_num()%>"><%=vo.getB_title()%></a></th>
				<th><%=vo.getM_id()%></th>
				<th width="180"><%=vo.getB_date()%></th>
				<th width="188"><%=vo.getB_view()%></th>
			</tr>
		</table>
		<%
			}
		%>
		<%
			}
		%>
	<div class="paging">
		<%
			for (int i = 1; i <= result.get(0).getNowpage(); i++) {
		%>
		<a href=general.do?b_boardname=free_board&b_nowpage=<%=i%>><%="[" + i + "]"%></a>
		<%
			}
		%>
	</div>

	</div>
	<!--동적 페이지 구현하는 부분  -->
	
	<!-- <div id="talk">
		<div class="chat">
			<button>
				<img src="resources/img/talk-1.png">
			</button>
		</div>
	</div> -->

	<div id="footer">
		<p>@COPYRIGHT_</p>
	</div>
<body />
</html>