<%@page import="javax.swing.text.Document"%>
<%@page import="com.kos.vo.MemberVO"%>
<%@page import="java.util.List"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/board/nongsain.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="/resources/css/boardcss/viewboard.css">
<link rel="stylesheet" href="/resources/css/boardcss/repl.css">
<link rel="stylesheet" href="/resources/css/boardcss/writeboard.css">

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
				<input type="hidden" id="bname"
					value="<%=(String) request.getAttribute("boardname")%>">
				<input type="hidden" id="nick" value="<%=result.getNickname()%>">
				<!-- 게시판이름  -->
				<a href=callboard.do?b_boardname=free_board><%=BoardVO.changeword((String) request.getAttribute("boardname"))%>></a>

				<!--조회수 표시  -->
				<div class="pull-right" id="boardname_right">
					<p>
						조회
						<%=result.getBoardView()%></p>
					<div id="replinfosec">

						<i class="fas fa-comment"></i> <span>댓글</span>    <span id="replNumber"></span> <br> <br>
						
					</div>
				</div>
			</div>
			<!--글제목부분  -->
			<div class="" id="title">				
				<h2>Q     <%=result.getTitle()%></h2>
				<input type="hidden" id="writer" value="<%=result.getId()%>">
				<p class="nick"><%=result.getNickname()%></p>
				<p class="regdate"><%=result.getRegdate()%></p>

			</div>


			<!--글내용  -->
			<div class=container id=contents>
				<%=result.getContents()%>
				
				<div  id="likebad">

					<br>
					<br>
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
				<a href="callboard.do?b_boardname=<%=(String) request.getAttribute("boardname")%>" class="btn btn-success" role="button">목록으로</a>
			</div>
		</div>
	
 	<%

	String boardname = (String) request.getParameter("b_boardname");
	String boardno = (String) request.getParameter("boardno");
	
	%>
	<div class="container" id="board">
	<%if(userid!=null){ %>소중한 의견을 남겨주세요                            <button class="btn btn-success" id="answer">답변하기</button><%}else{%>
	로그인 후 답변 가능합니다.
	<%}	%>
	
	</div>
 	<div class="main_box"> 
		<section class="whole-write-section">
		<input id="boardname" type="hidden" value=<%=boardname%>>
		<div class="">
			<div >
			
				<form action="/writeAnswer.do" method="post"
					id="frm" enctype="multipart/form-data">
					<input type="hidden" id="form-boarname" name="b_boardname" value="in_repl"/>
					<input type="hidden" name="boardno" value="<%=boardno%>">  
					<input type="hidden" name="replno" id="replno" value="0">  
					<textarea name="contents" id="editor"></textarea>
					<script type="text/javascript"> 
					</script>
					<button class="btn btn-success" type="submit" id="store">저장</button>
					<a href="#" class="btn btn-primary" id="cancelwriteAnswer" role="button">취소</a>
					
				</form>
			</div>
		</div>
	</section>
 	</div>
 	<%
 	BoardVO cheteckAnswer = null;
	if (request.getAttribute("AnswerCheteck") != null) {
		cheteckAnswer = (BoardVO)request.getAttribute("AnswerCheteck");
	
	
	%> 
 	 <!-- 채택된 답글시작 -->
 	 <div id="<%=cheteckAnswer.getReplno()%>">
      <div class="container" id="board">
			<!--현재 게시판 표시  -->
			<div id="boardname" class="container">

				<input type="hidden" id="boardno" value="<%=cheteckAnswer.getBoardno()%>">
				<input type="hidden" id="bname"
					value="<%=(String) request.getAttribute("boardname")%>">

				<!--조회수 표시  -->
				<div class="pull-right" id="boardname_right">
					<div id="replinfosec">
						<button class="btn btn-success cancleCheteck" id="cancleCheteck<%=cheteckAnswer.getReplno()%>">채택 취소하기</button>
					</div>
					<div id="replinfosec">
						<button class="btn btn-success " id="">채택된 답변!!!</button>
					</div>
					
				</div>
			</div>
			<!--글제목부분  -->
			<div class="" id="title">

				<h2>A      </h2>
				<input type="hidden" id="writer" value="<%=cheteckAnswer.getId()%>">
				<p class="nick"><%=cheteckAnswer.getNickname()%></p>
				<p class="regdate"><%=cheteckAnswer.getRegdate()%></p>

			</div>
			<!--글내용  -->
			<div class=container id=contents>
				<div id="contents<%=cheteckAnswer.getReplno()%>"><%=cheteckAnswer.getContents()%></div>
				<div  id="likebad">

						<br>
						<br>
				</div>				
			</div>
			<!--하단 버튼 부분  -->
	
		</div>
	</div>
	<%} %>
	<!-- 채택된 답글 끝 -->
 	<%
 	List<BoardVO> answer = null;
	if (request.getAttribute("Answer") != null) {
		answer = (List<BoardVO>)request.getAttribute("Answer");
	}
	for(BoardVO vo:answer){
	%> 
	<!-- 답글 -->
	<div id="<%=vo.getReplno()%>">
      <div class="container" id="board">
			<!--현재 게시판 표시  -->
			<div id="boardname" class="container">

				<input type="hidden" id="boardno" value="<%=result.getBoardno()%>">
				<input type="hidden" id="bname"
					value="<%=(String) request.getAttribute("boardname")%>">

				<!--조회수 표시  -->
				<div class="pull-right" id="boardname_right">
				<%if (request.getAttribute("AnswerCheteck") == null){%>
					<%if( result.getId().equals(userid)){  %>
					<div id="replinfosec">
						<button class="btn btn-success answer" id="che<%=vo.getReplno()%>">채택하기</button>
					</div>
					<%} %>
				<%} %>
				</div>
			</div>
			<!--글제목부분  -->
			<div class="" id="title">

				<h2>A      </h2>
				<input type="hidden" id="writer" value="<%=vo.getId()%>">
				<p class="nick"><%=vo.getNickname()%></p>
				<p class="regdate"><%=vo.getRegdate()%></p>

			</div>
			<!--글내용  -->
			<div class=container id=contents>
				<div id="contents<%=vo.getReplno()%>"><%=vo.getContents()%></div>
				<div  id="likebad">

						<br>
						<br>
				</div>				
			</div>
			<!--하단 버튼 부분  -->
	
		</div>
		<%if(vo.getId().equals(userid)){ %>
		<div class="container" id="button_container">
			<button class="btn btn-primary modifyAnswer" id="modify<%=vo.getReplno()%>">수정</button>
			<button class="btn btn-warning delAnswer" id="del<%=vo.getReplno()%>">삭제</button>
		</div>
		<% }%>
	</div>
		<%} %>
		
   
	
		
	</section>
	

	
	<!-- footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/board/viewboard.js"></script>
	<script src="/resources/js/board/write.js"></script>
</body>
</html>