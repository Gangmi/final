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
<script src="/resources/js/board/boardrepl.js"></script>
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
				<!-- 게시판이름  -->
				<a href=callboard.do?b_boardname=free_board><%=BoardVO.changeword((String) request.getAttribute("boardname"))%>></a>

				<!--조회수 표시  -->
				<div class="pull-right" id="boardname_right">
					<p>
						조회
						<%=result.getBoardView()%></p>
					<div id="replinfosec">

						<i class="fas fa-comment"></i> <span>댓글</span>    <span id="replNumber"></span> <br> <br>


						<%-- <i class="fas fa-thumbs-up"></i> <span>좋아요</span> <span><%=result.getBoardLike()%></span>&nbsp;&nbsp;
						<i class="fas fa-thumbs-down"></i> <span>싫어요</span> <span><%=result.getBoardBad()%></span> --%>
						
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

<div>
	
 	<%

	String boardname = (String) request.getParameter("b_boardname");
	String boardno = (String) request.getParameter("boardno");
	
	%>
	<div class="container" id="board">
	소중한 의견을 남겨주세요                            <button class="btn btn-success" id="answer">답변하기</button>
	</div>
	
	<%-- <div class="write-title">
		<h3>글쓰기</h3>
		<label>게시판 선택</label>
			<div class="top_menu">
				<div class="search_box">
					<select id="boardselect">
						<option value="free_board" <%if(boardname.equals("free_board")){ %>selected="selected"<%} %> >자유시게판</option>
						<option value="tip_board"<%if(boardname.equals("tip_board")){ %>selected="selected"<%} %>>팁게시판</option>
						<option value="parcel_board"<%if(boardname.equals("parcel_board")){ %>selected="selected"<%} %>>분양시게판</option>
						<option <%if(boardname.equals("free_board")){ %>selected="selected"<%} %>>장터시게판</option>
						<option value="nongsain" <%if(boardname.equals("nongsain")){ %>selected="selected"<%} %>>농사 IN 시게판</option>
					</select>
				</div>
				
			</div>
		</div> --%>
		<section class="whole-write-section">
		
		<div class="">
			<div class="main_box">
			
				<form action="/write.do" method="post"
					id="frm" enctype="multipart/form-data">
					<%-- <input type="hidden" name="boardname" value="<%=boardname%>"/> --%>
					<input type="hidden" id="form-boarname" name="b_boardname" value="<%=boardname%>"/>
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
	
	<!-- 댓글 입력창 -->
   <div class="container" id="board">
			<!--현재 게시판 표시  -->
			<div id="boardname" class="container">

				<input type="hidden" id="boardno" value="<%=result.getBoardno()%>">
				<input type="hidden" id="bname"
					value="<%=(String) request.getAttribute("boardname")%>">

				<!--조회수 표시  -->
				<div class="pull-right" id="boardname_right">

					<div id="replinfosec">
						<button class="btn btn-success answer" id="">채택하기</button>
					</div>
				</div>
			</div>
			<!--글제목부분  -->
			<div class="" id="title">

				<h2>A      <%=result.getTitle()%></h2>
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
    </form>
    <!-- 댓글 입력 끝 -->
    <!--댓글목록 시작 -->
   
	<!-- 댓글 끝 -->
	
		
	</section>
	

	
	<!-- footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/board/viewboard.js"></script>
	<script src="/resources/js/board/write.js"></script>
</body>
</html>