<%@page import="com.kos.vo.MemberVO"%>
<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--게시판 페이지 기본 css  -->
<link rel="stylesheet" href="/resources/css/boardcss/general.css">

<style>
.thumb img {
	width: 45px;
	height: 45px;
	border-radius: 45px;
	float : left;
}
.name{
	float : left;
}
</style>

<%
	//게시판 값 받아오는 곳
	String boardname = (String) request.getAttribute("b_boardname");
%>
<title></title>
<%
	MemberVO mem = (MemberVO) session.getAttribute("memberinfo");
%>
<%
	String profile = (String) session.getAttribute("profileimg");
%>

<script type="text/javascript">
	
</script>


</head>
<body>
	<input id="boardname" type="hidden" value="<%=boardname%>">
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<input type="hidden" id="confirmsession"
		value="<%=session.getAttribute("memberid")%>"></input>
	<input type="hidden" id="dropopen" value="false">

	<section class="aboutus-section spad">
		<div class="container">
			<div class="weather">
				<br> <br>
				<h2 id="todaydate"></h2>
				<h2>내가 쓴 글</h2>
			</div>
			<hr />
			<div class="thumb">
				<img src="/resources/profileimg/<%if (profile != "") {%><%=profile%><%} else {%>my_page.png<%}%>" />
				<div class="name">
					<h2><%=mem.getName()%>(<%=mem.getId()%>)</h2>
				</div>
			</div>
		</div>
	</section> 

	<!-- Hero Section Begin -->

	<section class="hero-section">
		<div class="container">
			<div class="table-wrapper">
				<table class="table table-hover table-condensed" id="boardtable">
					<thead>
						<tr>
							<th width="150">글번호</th>
							<th width="659">제목</th>
							<th width="180">작성자</th>
							<th width="180">작성일</th>
							<th width="188">조회수</th>
							<th width="188">좋아요</th>
							<th width="188">싫어요</th>
						</tr>
					</thead>

					<tbody>
						<%
							if ((Integer) request.getAttribute("free_boardcon") == 1) {

							List<BoardVO> result = (List<BoardVO>) request.getAttribute("free_board");

							Calendar cal = Calendar.getInstance();
							System.out.println(cal);
							String year = String.valueOf(cal.get(Calendar.YEAR));
							String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
							String date = String.valueOf(cal.get(Calendar.DATE));
							if (Integer.parseInt(month) < 10) {
								month = "0" + String.valueOf(month);
							}
							if (Integer.parseInt(month) < 10) {
								date = "0" + String.valueOf(date);
							}

							String nowdate = year + "-" + month + "-" + date;

							for (BoardVO vo : result) {
								// 시간 나누기
								String[] dat = vo.getRegdate().split(" ");
								vo.setRegdate(dat[0]);
						%>

						<tr>
							<td width="130" id="bno"><%=vo.getBoardno()%></td>


							<td width="659" class="titles"><a
								href="viewboard.do?b_boardname=free_board&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>">[자유게시판]<%=vo.getTitle()%></a>
								<%
									if (dat[0].equals(nowdate)) {
								%> <img class="newicon" src="/resources/img/ico_new.png">
								<%
									}
								%></td>

							<td width="180">
								<div class="dropdown">

									<a class="dropbtn"><%=vo.getNickname()%></a>
									<div id="myDropdown" class="dropdown-content">
										<a href="#"><%=vo.getNickname()%></a> <a href="#"
											class="oneonone"><%=vo.getId()%></a> <a href="#">Link 3</a>
									</div>
								</div>
							</td>
							<td width="180"><%=vo.getRegdate()%></td>
							<td width="188"><%=vo.getBoardView()%></td>
							<td width="188"><%=vo.getBoardLike()%></td>
							<td width="188"><%=vo.getBoardBad()%></td>
						</tr>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							}
						%>

						<%
							if ((Integer) request.getAttribute("tip_boardcon") == 1) {

							List<BoardVO> result = (List<BoardVO>) request.getAttribute("tip_board");

							Calendar cal = Calendar.getInstance();
							System.out.println(cal);
							String year = String.valueOf(cal.get(Calendar.YEAR));
							String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
							String date = String.valueOf(cal.get(Calendar.DATE));
							if (Integer.parseInt(month) < 10) {
								month = "0" + String.valueOf(month);
							}
							if (Integer.parseInt(month) < 10) {
								date = "0" + String.valueOf(date);
							}

							String nowdate = year + "-" + month + "-" + date;

							for (BoardVO vo : result) {
								// 시간 나누기
								String[] dat = vo.getRegdate().split(" ");
								vo.setRegdate(dat[0]);
						%>
						<tr>
							<td width="130" id="bno"><%=vo.getBoardno()%></td>


							<td width="659" class="titles"><a
								href="viewboard.do?b_boardname=tip_board&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>">[팁게시판]<%=vo.getTitle()%></a>
								<%
									if (dat[0].equals(nowdate)) {
								%> <img class="newicon" src="/resources/img/ico_new.png">
								<%
									}
								%></td>

							<td width="180">
								<div class="dropdown">

									<a class="dropbtn"><%=vo.getNickname()%></a>
									<div id="myDropdown" class="dropdown-content">
										<a href="#"><%=vo.getNickname()%></a> <a href="#"
											class="oneonone"><%=vo.getId()%></a> <a href="#">Link 3</a>
									</div>
								</div>
							</td>
							<td width="180"><%=vo.getRegdate()%></td>
							<td width="188"><%=vo.getBoardView()%></td>
							<td width="188"><%=vo.getBoardLike()%></td>
							<td width="188"><%=vo.getBoardBad()%></td>
						</tr>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							}
						%>

						<%
							if ((Integer) request.getAttribute("nongsaincon") == 1) {

							List<BoardVO> result = (List<BoardVO>) request.getAttribute("nongsain");

							Calendar cal = Calendar.getInstance();
							System.out.println(cal);
							String year = String.valueOf(cal.get(Calendar.YEAR));
							String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
							String date = String.valueOf(cal.get(Calendar.DATE));
							if (Integer.parseInt(month) < 10) {
								month = "0" + String.valueOf(month);
							}
							if (Integer.parseInt(month) < 10) {
								date = "0" + String.valueOf(date);
							}

							String nowdate = year + "-" + month + "-" + date;

							for (BoardVO vo : result) {
								// 시간 나누기
								String[] dat = vo.getRegdate().split(" ");
								vo.setRegdate(dat[0]);
						%>
						<tr>
							<td width="130" id="bno"><%=vo.getBoardno()%></td>


							<td width="659" class="titles"><a
								href="viewboard.do?b_boardname=nongsain&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>">[농사in게시판]<%=vo.getTitle()%></a>
								<%
									if (dat[0].equals(nowdate)) {
								%> <img class="newicon" src="/resources/img/ico_new.png">
								<%
									}
								%></td>

							<td width="180">
								<div class="dropdown">

									<a class="dropbtn"><%=vo.getNickname()%></a>
									<div id="myDropdown" class="dropdown-content">
										<a href="#"><%=vo.getNickname()%></a> <a href="#"
											class="oneonone"><%=vo.getId()%></a> <a href="#">Link 3</a>
									</div>
								</div>
							</td>
							<td width="180"><%=vo.getRegdate()%></td>
							<td width="188"><%=vo.getBoardView()%></td>
							<td width="188"><%=vo.getBoardLike()%></td>
							<td width="188"><%=vo.getBoardBad()%></td>
						</tr>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							}
						%>

						<%
							if ((Integer) request.getAttribute("parcel_boardcon") == 1) {

							List<BoardVO> result = (List<BoardVO>) request.getAttribute("parcel_board");

							Calendar cal = Calendar.getInstance();
							System.out.println(cal);
							String year = String.valueOf(cal.get(Calendar.YEAR));
							String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
							String date = String.valueOf(cal.get(Calendar.DATE));
							if (Integer.parseInt(month) < 10) {
								month = "0" + String.valueOf(month);
							}
							if (Integer.parseInt(month) < 10) {
								date = "0" + String.valueOf(date);
							}

							String nowdate = year + "-" + month + "-" + date;

							for (BoardVO vo : result) {
								// 시간 나누기
								String[] dat = vo.getRegdate().split(" ");
								vo.setRegdate(dat[0]);
						%>
						<tr>
							<td width="130" id="bno"><%=vo.getBoardno()%></td>


							<td width="659" class="titles"><a
								href="viewboard.do?b_boardname=parcel_board&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>">[분양게시판]<%=vo.getTitle()%></a>
								<%
									if (dat[0].equals(nowdate)) {
								%> <img class="newicon" src="/resources/img/ico_new.png">
								<%
									}
								%></td>

							<td width="180">
								<div class="dropdown">

									<a class="dropbtn"><%=vo.getNickname()%></a>
									<div id="myDropdown" class="dropdown-content">
										<a href="#"><%=vo.getNickname()%></a> <a href="#"
											class="oneonone"><%=vo.getId()%></a> <a href="#">Link 3</a>
									</div>
								</div>
							</td>
							<td width="180"><%=vo.getRegdate()%></td>
							<td width="188"><%=vo.getBoardView()%></td>
							<td width="188"><%=vo.getBoardLike()%></td>
							<td width="188"><%=vo.getBoardBad()%></td>
						</tr>
						<%
							}
						%>
						<%
							} else {
						%>
						<%
							}
						%>
					</tbody>

				</table>
			</div>
		</div>
	</section>

	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!--자바 스크립트 추가 부분  -->
	<script type="text/javascript" src="/resources/js/board/general.js"></script>

</body>
</html>