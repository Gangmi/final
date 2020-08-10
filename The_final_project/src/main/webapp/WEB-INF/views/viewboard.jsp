<%@page import="javax.swing.text.Document"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/board/boardrepl.js"></script>
<link rel="stylesheet" href="/resources/css/boardcss/viewboard.css">
<link rel="stylesheet" href="/resources/css/boardcss/repl.css">

<%
	MemberVO user = null;
String userid = "";
if (session.getAttribute("memberinfo") != null) {
	user = (MemberVO) session.getAttribute("memberinfo");
	userid = user.getId();
	
}
String profile=(String)session.getAttribute("profileimg");
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
					value="<%=(String)request.getAttribute("boardname")%>">
				<!-- 게시판이름  -->
				<a href=callboard.do?b_boardname=free_board><%=BoardVO.changeword((String) request.getAttribute("boardname"))%>></a>

				<!--조회수 표시  -->
				<div class="pull-right" id="boardname_right">
					<p>
						조회
						<%=result.getBoardView()%></p>
					<div id="replinfosec">

						<i class="fas fa-comment"></i> <span>댓글</span>    <span id="replNumber"></span> <br> <br>


						<i class="fas fa-thumbs-up"></i> <span>좋아요</span> <span id="countlike"><%=result.getBoardLike()%></span>&nbsp;&nbsp;
						<i class="fas fa-thumbs-down"></i> <span>싫어요</span> <span id="countbad"><%=result.getBoardBad()%></span>

					</div>
				</div>
			</div>
			<!--글제목부분  -->
			<div class="" id="title">
				<div class="titlewrap">
				<h2><%=result.getTitle()%></h2>
				</div>
				<input type="hidden" id="writer" value="<%=result.getId()%>">
				<div class="nickwrap">
					
					<p class="nick"><img src="/resources/profileimg/<%if(result.getImagename()!=""){%><%=result.getImagename()%><%}else{%>my_page.png<%}%>"/><%=result.getNickname()%></p>
					<p class="regdate"><%=result.getRegdate()%></p>
				</div>

			</div>


			<!--글내용  -->
			<div class=container id=contents>
				<%=result.getContents()%>
				
				
				<div  id="likebad">

			<!-- 좋아요 싫어요 버튼  -->
			<i class="fas fa-thumbs-up fa-2x"></i> 
			<i class="fas fa-thumbs-down fa-2x"></i>
			
			<br>
			<span>좋아요</span>
					

			<span class="bad">싫어요</span>	




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
	<!-- 댓글 입력창 -->
   <form id="commentInsertForm" name="commentInsertForm" >
    <div class="row d-flex justify-content-center mt-100 mb-100">
      	<!-- 게시판이름과 게시판글번호 를 폼으로 넘김 -->
 		<input type="hidden" name="b_boardname" value="<%=boardname%>">
 		<input type="hidden" name="boardno" value="<%=boardno%>">     
        <div class="col-lg-6">
        	<div class="card">
            <div class="d-flex flex-column comment-section">
                <div class="bg-white">
                    <div class="d-flex flex-row fs-12">                      
                        <div style="display: inline;"class="like p-2"><i class="fas fa-comment"></i><span class="ml-1">댓글</span></div>                      
                    </div>
                </div>
                <div class="p-2">
                    <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40"><textarea id="comment" name="contents"  class="form-control ml-1 shadow-none textarea"></textarea></div>
                    <div class="mt-2 text-right"><button id="commentInsertBtn" name="commentInsertBtn" class="btn btn-primary btn-sm shadow-none" type="button">댓글쓰기</button></div>
                </div>
            </div>
            </div>
        </div>
     
    </div>
    </form>
    <!-- 댓글 입력 끝 -->
    <!--댓글목록 시작 -->
    <div  class="row d-flex justify-content-center mt-100 mb-100">
	  <div  class='col-lg-6' >
		<div id="repl" class='card' >
		<!-- 여기에 댓글 추가됨 -->
		</div>
      </div>
	</div>
	<!-- 댓글 끝 -->
	<div class="replpaging" id="replpaging">
			
	</div> 
		
	</section>
	
	
	


	
	<!-- footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/board/viewboard.js"></script>
</body>
</html>