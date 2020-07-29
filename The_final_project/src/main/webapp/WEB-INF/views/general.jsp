<%@page import="com.kos.vo.MemberVO"%>
<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--게시판 페이지 기본 css  -->
<link rel="stylesheet" href="/resources/css/boardcss/general.css">


<%
	//게시판 값 받아오는 곳
String boardname = (String) request.getAttribute("b_boardname");
%>
<title>자유게시판</title>
<%MemberVO mem=(MemberVO)session.getAttribute("memberinfo"); %>

</head>
<body>
	<input id="boardname" type="hidden" value="<%=boardname%>">
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<input type="hidden" id="confirmsession" value="<%=session.getAttribute("memberinfo")%>"></input>





	<!-- Hero Section Begin -->
	

	<section class="hero-section">
		<div class="container">
		
			<h3>자유게시판</h3>
			<br />
			<div class="table-wrapper">
			<div class="writebtn">
			<button class="btn btn-success" id="writeboard">글쓰기</button>
			</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th width="130">글번호</th>
							<th width="659">제목</th>
							<th width="180">작성자</th>
							<th width="180">작성일</th>
							<th width="188">조회수</th>
						</tr>
					</thead>
					
					<tbody>
					<%
						if ((Integer)request.getAttribute("confirm")==1) {
							
							List<BoardVO> result =(List<BoardVO>) request.getAttribute("boardlist");
							
							
							for (BoardVO vo : result) {
							// 시간 나누기
							String[] dat=vo.getRegdate().split(" ");
							vo.setRegdate(dat[0]);
					%>
						<tr>
							<td width="130"><%=vo.getBoardno()%></td>

							<td width="659"><a href="viewboardtemp.do?b_boardname=<%=boardname%>&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>"><%=vo.getTitle()%></a></td>

							<td width="180"><%=vo.getNickname()%></td>
							<td width="180"><%=vo.getRegdate()%></td>
							<td width="188"><%=vo.getBoardView()%></td>
						</tr>
					<%
							}	
					%>
					<%
						}else{
					%>
					<%
						}
					%>
					
					
					</tbody>
					
				</table>
			</div>
			<!--페이징 부분  -->
			<div class="center-block" id="paing">
			
			<%if((Integer)request.getAttribute("confirm")==1){ 
				List<BoardVO> result =(List<BoardVO>)request.getAttribute("boardlist");
				int pagelimit=0;
				if(result.get(0).getNowpage()>10){
					pagelimit=10;
				}else{
					pagelimit=result.get(0).getNowpage();
				}
				for(int i=1; i<=pagelimit;i++){
			%>
			
				<a class="btn btn-info" href="callboard.do?b_boardname=<%=boardname%>&nowpage=<%=i%>" id="pages" role="button"><%=i%></a>
			<%
				} 
			%>	
			<a class="btn btn-info" href="callboard.do?b_boardname=<%=boardname%>&nowpage=<%=result.get(0).getNowpage()%>" id="pages" role="button">끝으로</a>
			<% 	
				}
			%>
			</div>
		</div>
	</section>
	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!--자바 스크립트 추가 부분  -->
	<script type="text/javascript" src="/resources/js/board/general.js"></script>

</body>
</html>