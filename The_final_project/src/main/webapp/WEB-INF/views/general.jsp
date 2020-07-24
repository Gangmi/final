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
	//게시판 값 받아오는 곳
List<BoardVO> result = (List<BoardVO>) request.getAttribute("boardlist");
String boardname = (String) request.getAttribute("b_boardname");
%>
<title>자유게시판</title>

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/flaticon.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


	<!-- Hero Section Begin -->

	<section class="hero-section">
		<div class="container">

			<h3>자유게시판</h3>
			<br />
			<div class="table-wrapper">
				<table class="table table-striped">
					<thead>
						<tr>
							<th width="130">글번호</th>
							<th width="659">제목</th>
							<th>작성자</th>
							<th width="180">작성일</th>
							<th width="188">조회수</th>
						</tr>
					</thead>
					<%
						if (!result.isEmpty()) {
						for (BoardVO vo : result) {
						// 시간 나누기
						String[] dat=vo.getRegdate().split(" ");
						vo.setRegdate(dat[0]);
					%>
					<tbody>
						<tr>
							<td width="130"><%=vo.getBoardno()%></td>
							<td width="659"><a href="viewboard.do?b_boardname=<%=boardname%>&boardno=<%=vo.getBoardno()%>"><%=vo.getTitle()%></a></td>
							<td width="180"><%=vo.getId()%></td>
							<td width="180"><%=vo.getRegdate()%></td>
							<td width="188"><%=vo.getBoardView()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
					<%
						}
					%>
				</table>
			</div>
			<div class="paging">
				<%
					for (int i = 1; i <= result.get(0).getNowpage(); i++) {
				%>
				<a href=general.do?b_boardname=free_board&b_nowpage= <%=i%>><%="[" + i + "]"%></a>
				<%
					}
				%>
			</div>
		</div>
	</section>


	<!-- Hero Section End -->

	<!-- 어바웃어스 -->

	<!-- About Us Section End -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!-- 자바스크립트 -->
	
</body>
</html>