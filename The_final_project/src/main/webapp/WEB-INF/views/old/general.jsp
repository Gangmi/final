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
String boardname = (String) request.getAttribute("b_boardname");
%>
<title><%=boardname%></title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<jsp:include page="/WEB-INF/views/Board/side.jsp" />




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
	<%-- 	<div class="main_text">

		<%
			if (!result.isEmpty()) {
			for (BoardVO vo : result) {
		%>

		<table>
			<tr>
				<th width="130"><%=vo.getBoardno()%></th>
				<th width="659"><a href="viewboard.do?b_boardname=<%=boardname%>&boardno=<%=vo.getBoardno()%>"><%=vo.getTitle()%></a></th>
				<th><%=vo.getId()%></th>
				<th width="180"><%=vo.getRegdate()%></th>
				<th width="188"><%=vo.getBoardView()%></th>
				
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

	</div> --%>
	<!--동적 페이지 구현하는 부분  -->

	<!-- <div id="talk">
		<div class="chat">
			<button>
				<img src="resources/img/talk-1.png">
			</button>
		</div>
	</div> -->
	<div class="main_text">
	
		<
		<div class="table-wrapper">
			<table>
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Item One</td>
						<td>Ante turpis integer aliquet porttitor.</td>
						<td>29.99</td>
					</tr>
					<tr>
						<td>Item Two</td>
						<td>Vis ac commodo adipiscing arcu aliquet.</td>
						<td>19.99</td>
					</tr>
					<tr>
						<td>Item Three</td>
						<td>Morbi faucibus arcu accumsan lorem.</td>
						<td>29.99</td>
					</tr>
					<tr>
						<td>Item Four</td>
						<td>Vitae integer tempus condimentum.</td>
						<td>19.99</td>
					</tr>
					<tr>
						<td>Item Five</td>
						<td>Ante turpis integer aliquet porttitor.</td>
						<td>29.99</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"></td>
						<td>100.00</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
		<div id="footer">
			<p>@COPYRIGHT_</p>
		</div>
		
		<body />
</html>