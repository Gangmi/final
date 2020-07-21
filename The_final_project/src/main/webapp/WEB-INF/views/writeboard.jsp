<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/general.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="resources/js/general.js"></script>
<%
	List<BoardVO> result =(List<BoardVO>)request.getAttribute("boardlist");
%>
</head>
<body>
	<div id="header">
		<section class="header">
			<a href="/the_final_project/index.jsp"><img
				src="resources/img/logo-2.png" alt="LOGO"></a>

			<ul class="header_menu">
				<li><a href="aboutus.do">소개</a></li>
				<li><a href="5place.html.html">농장위치</a></li>
				<li><a href="2Join.html.html">로그아웃</a></li>
				<li><a href="3Login.html.html">마이페이지</a></li>
			</ul>
		</section>
	</div>

	<div id="side">
		<div class="sub">
			<ul class="sub_menu">
				<li><a href="6free_menu.html.html">스마트팜</a></li>
				<li><a href="6free_menu.html.html">자유게시판</a></li>
				<li><a href="6free_menu.html.html">팁게시판</a></li>
				<li><a href="6free_menu.html.html">분양게시판</a></li>
				<li><a href="6free_menu.html.html">장터게시판</a></li>
				<li><a href="6free_menu.html.html">농사 IN 게시판</a></li>
			</ul>
		</div>
	</div>


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

		<div class="text_btn">
			<button id="write_board">글쓰기</button>
		</div>

	</div>

	<div class="main_text">
	<%if(!result.isEmpty()){
		for(BoardVO vo:result){%>
	
		<table>
			<tr>
				<th width="130"><%=vo.getB_num()%></th>
				<th width="659"><%=vo.getB_title()%></th>
				<th><%=vo.getM_id()%></th>
				<th width="180"><%=vo.getB_date()%></th>
				<th width="188"><%=vo.getB_view()%></th>
			</tr>
		</table>
		<%} %>
	<% } %>
		

	</div>
	<div>
	<% for(int i=1; i<=result.get(0).getNowpage(); i++){ %>
	<a href=general.do?b_nowpage=<%=i%>><%="["+i+"]"%></a>
	<% }%>
	</div>
	<div id="talk">
		<div class="chat">
			<button>
				<img src="resources/img/talk-1.png">
			</button>
		</div>
	</div>
	
	<div id="footer">
		<p>@COPYRIGHT_</p>
	</div>
<body />
</html>