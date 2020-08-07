<%@page import="java.util.List"%>
<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>


<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/flaticon.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="/resources/css/index.css" type="text/css">

<%


%>


</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<!-- 전체 게시판 정보 띄우는 곳  --> 
	<section id="allboards">
		<div class="container upboards"> 
		
		
			<div class="freeboard">
				<h2>자유게시판</h2>
			
				<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
						<%
						if((Integer)request.getAttribute("free_boardcon")!=0){
							
							List<BoardVO> result =(List<BoardVO>)request.getAttribute("free_board");
							for (BoardVO vo : result) {
							// 시간 나누기
							String[] dat=vo.getRegdate().split(" ");
							String dat2=dat[0].substring(5,10);
							vo.setRegdate(dat2);
					%>
						<tr>
							<td  id="bno"><%=vo.getBoardno()%></td>


							<td class="titles"><a href="viewboard.do?b_boardname=free_board&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>"><%=vo.getTitle()%></a>
							
							
							</td>

							<td ><%=vo.getNickname()%></td>
							<td ><%=vo.getRegdate()%></td>
							
						</tr>
					<%
							}	
						}	
					%>
					
					
						</tbody>
				</table>
				<div id="more">
				<a href="/callboard.do?b_boardname=free_board">더보기+</a>
				</div>
		
			</div>
		
			<div class="tipboard">
				<h2>팁게시판</h2>
				
				<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
						<%
						if((Integer)request.getAttribute("tip_boardcon")!=0){
							
							List<BoardVO> result =(List<BoardVO>)request.getAttribute("tip_board");
							
							
							for (BoardVO vo : result) {
							// 시간 나누기
							String[] dat=vo.getRegdate().split(" ");
							String dat2=dat[0].substring(5,10);
							vo.setRegdate(dat2);
					%>
						<tr>
							<td  id="bno"><%=vo.getBoardno()%></td>


							<td class="titles"><a href="viewboard.do?b_boardname=tip_board&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>"><%=vo.getTitle()%></a></td>

							<td ><%=vo.getNickname()%></td>
							<td ><%=vo.getRegdate()%></td>
							
						</tr>
					<%
							}	
						}	
					%>
					
						</tbody>
						
					</table>
					<div id="more">
						<a href="/callboard.do?b_boardname=tip_board">더보기+</a>
					</div>
				
			
			</div>
		
	</div>
	
	<div class="container downboards">
	<hr id="divide"/>
			<div class="freeboard">
			<h2>농사in 게시판</h2>
			<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
						if((Integer)request.getAttribute("nongsaincon")!=0){
							
							List<BoardVO> result =(List<BoardVO>)request.getAttribute("nongsain");
							
							
							for (BoardVO vo : result) {
							// 시간 나누기
							String[] dat=vo.getRegdate().split(" ");
							String dat2=dat[0].substring(5,10);
							vo.setRegdate(dat2);
					%>
						<tr>
							<td  id="bno"><%=vo.getBoardno()%></td>


							<td class="titles"><a href="viewboard.do?b_boardname=nongsain&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>"><%=vo.getTitle()%></a></td>

							<td ><%=vo.getNickname()%></td>
							<td ><%=vo.getRegdate()%></td>
							
						</tr>
					<%
							}	
						}	
					%>
					
					</tbody>
			</table>
			<div id="more">
						<a href="/callboard.do?b_boardname=nongsain">더보기+</a>
					</div>
					
					
			
	
		</div>
		
		
		<div class="tipboard">
		
			<h2>분양게시판</h2>
			<table class="table table-hover table-condensed">
					<thead>
						<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
						if((Integer)request.getAttribute("parcel_boardcon")!=0){
							
							List<BoardVO> result =(List<BoardVO>)request.getAttribute("parcel_board");
							
							
							for (BoardVO vo : result) {
							// 시간 나누기
							String[] dat=vo.getRegdate().split(" ");
							String dat2=dat[0].substring(5,10);
							vo.setRegdate(dat2);
					%>
						<tr>
							<td  id="bno"><%=vo.getBoardno()%></td>


							<td class="titles"><a href="viewboard.do?b_boardname=parcel_board&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>"><%=vo.getTitle()%></a></td>

							<td ><%=vo.getNickname()%></td>
							<td ><%=vo.getRegdate()%></td>
							
						</tr>
					<%
							}	
						}	
					%> 
					
					</tbody>
					
				</table>
				<div id="more">
						<a href="/callboard.do?b_boardname=parcel_board">더보기+</a>
					</div>
			
		
		</div>
	</div>
	
	
	
	
	</section>
	 
	<!-- About Us Section End -->
	<div class="foot">
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85ca856139e74206389aacd96ce85ab6&libraries=services,clusterer,drawing"></script>
</body>
</html>