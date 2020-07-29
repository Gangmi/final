<%@page import="com.kos.vo.MemberVO"%>
<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page import="com.kos.vo.BoardVO"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/boardcss/viewboard.css">
<%
	MemberVO user = null;
String userid = "";
if (session.getAttribute("memberinfo") != null) {
	user = (MemberVO) session.getAttribute("memberinfo");
	userid = user.getId();
}
%>
<meta charset="UTF-8">
<title>project</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<%
		BoardVO result = null;
	if ((BoardVO) request.getAttribute("board") != null) {
		result = (BoardVO) request.getAttribute("board");
	}
	%>

	<input type="hidden" id="confirmsession" value="<%=userid%>">
	<section class="hero-section">

		<div class="container" id="board">
			<!--현재 게시판 표시  -->
			<div id="boardname" class="container">

				<input type="hidden" id="boardno" value="<%=result.getBoardno()%>">
				<input type="hidden" id="bname" value="<%=(String) request.getAttribute("boardname")%>">
				<!-- 게시판이름  --> 
				<a href=callboard.do?b_boardname=free_board><%=BoardVO.changeword((String) request.getAttribute("boardname"))%>></a>
				
				<!--조회수 표시  -->
				<div class="pull-right" id="boardname_right">
					<p>조회 <%=result.getViewing_count()%></p>
				</div>
			</div>
			<!--글제목부분  -->
			<div class="container" id="title">
				<div class="pull-right" id="replinfosec">

					<i class="fas fa-comment"></i> <span>댓글</span> <br> <br>


					<i class="fas fa-thumbs-up"></i> <span>좋아요</span> <span><%=result.getBoardLike()%></span>&nbsp;&nbsp;
					<i class="fas fa-thumbs-down"></i> <span>싫어요</span> <span><%=result.getBoardBad()%></span>

				</div>
				<h2><%=result.getTitle()%></h2>
				<input type="hidden" id="writer" value="<%=result.getId()%>">
				<p class="nick"><%=result.getNickname()%></p>
				<p class="regdate"><%=result.getRegdate()%></p>

			</div>


			<!--글내용  -->
			<div class=container id=contents>
				<%=result.getContents()%>
				<div class="container" id="likebad">
					<i class="fas fa-thumbs-up"></i> 
					<i class="fas fa-thumbs-down"></i>
				</div>
			</div>
			<!--하단 버튼 부분  -->
			

		</div>
		
		<div class="container" id="button_container">
			<button class="btn btn-success" id="writeboard">글쓰기</button>
			<button class="btn btn-primary" id="modifyboard">수정</button>
			<button class="btn btn-warning" id="deleteboard">삭제</button>
			<button class="btn btn" id="writerepl">댓글쓰기</button>
			<div class="pull-right">
				<a href="" class="btn btn-success" role="button">목록으로</a>
			</div>
		</div>
	</section>
	<!-- footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/board/viewboard.js"></script>
</body>
</html>