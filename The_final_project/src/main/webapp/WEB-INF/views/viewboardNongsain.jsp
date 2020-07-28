<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/board/nongsain.js"></script>

<title>viewboardNongsain</title>

</head>
<body>
<%
	//게시판 값 받아오는 곳
BoardVO result = (BoardVO) request.getAttribute("board");
%>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
 	<div >
 	 Q. <%=result.getTitle() %>  포인트<%=result.getSelectPoint() %>
 	</div>
 	<div>
 	<%=result.getContents() %>
 	</div> 	
	<div>
 	<button id ="openBtn" type="button" >
   		답변하기
	</button>
 	</div>
 	<div id="dapgul">
 	글 입력 해라 래끼야</p>
 	<button id="hideBtn">닫기</button>
 	</div>
 	<div>
 	<for maction="write.do?b_boardname">
      <p><textarea cols="50" rows="5"></textarea></p>
      <p><input type="submit" value="Submit"></p>
    </form>
 	</div>
	<!-- footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
</body>
</html>