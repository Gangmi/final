<%@page import="com.kos.vo.MemberVO"%>
<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar" %>
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
<title></title>
<%MemberVO mem=(MemberVO)session.getAttribute("memberinfo"); %>

<script type="text/javascript">




</script>


</head>
<body>
	<input id="boardname" type="hidden" value="<%=boardname%>">
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<input type="hidden" id="confirmsession" value="<%=session.getAttribute("memberinfo")%>"></input>
	<input type="hidden" id="dropopen" value="false">
	



	<!-- Hero Section Begin -->

	<section class="hero-section">
		<div class="container">
		
			<h3><%=BoardVO.changeword(boardname)%></h3>
			
			<%
			if(request.getAttribute("searchword")!=null){
				String searchword=(String)request.getAttribute("searchword");
			%>
			<h4>"<%=searchword%>" 검색결과</h4>
			<%
			} 
			%>
			<div class="table-wrapper">
			<div class="writebtn">
			<button class="btn btn-info" id="goimgboard">사진게시판</button>
			<button class="btn btn-success" id="writeboard">글쓰기</button>
			</div>
				<table class="table table-hover table-condensed" id="boardtable">
					<thead>
						<tr>
							<th width="150">글번호</th>
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
							
							Calendar cal = Calendar.getInstance();
							System.out.println(cal);
							String year = String.valueOf(cal.get(Calendar.YEAR));
							String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
							String date = String.valueOf(cal.get(Calendar.DATE));
							if(Integer.parseInt(month)<10){
								month="0"+String.valueOf(month);
							}
							if(Integer.parseInt(month)<10){
								date="0"+String.valueOf(date);
							}
							
							String nowdate=year+"-"+month+"-"+date;
							
							
							for (BoardVO vo : result) {
							// 시간 나누기
							String[] dat=vo.getRegdate().split(" ");
							vo.setRegdate(dat[0]);
					%>
						<tr>
							<td width="130" id="bno"><%=vo.getBoardno()%></td>


							<td width="659" class="titles"><a href="viewboard.do?b_boardname=<%=boardname%>&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>"><%=vo.getTitle()%></a>
							<%if(dat[0].equals(nowdate)){	
							%>
							<img class="newicon" src="/resources/img/ico_new.png">
							<%} %>
							
							</td>

							<td class="nick" width="180">
							
							<div class="dropdown">
							<a  class="dropbtn"><%=vo.getNickname()%></a>
							  <div id="myDropdown" class="dropdown-content">
<%-- 							    <a href="#"><%=vo.getNickname()%>의 프로필</a> --%>
							    <a href="#" class="oneonone">1:1 대화요청</a>
<!-- 							    <a href="#">Link 3</a> -->
							  </div>
							</div>
							</td>
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
			<div class="container" id="pager">
			
			
			<%if((Integer)request.getAttribute("confirm")==1){ 
				List<BoardVO> result =(List<BoardVO>)request.getAttribute("boardlist");
				//현재 블록 정보를 가져옴(paging VO에서 계산된것을 Boardvo에 넣어서 가져왔음)	
				int nowblock=result.get(0).getBlock();
				//현재 화면에서 클라이언트가 보는 마지막 페이지
				int nowlastpage=nowblock*5;
				//현재 화면에서 클라이언트가 보는 첫페이지
				int nowstartpage=nowlastpage-5+1;
				
				//만약 현재 보이는 마지막 페이지가 총 페이지보다 크다면 (예를들면 현재 보이기로 예정된 페이지는 1블록이라서 5페이지 까지인데 , 3페이지까지밖에 없을 경우)
				if(nowlastpage>result.get(0).getNowpage()){
					//총페이지를 현재 보이는 최종 페이지로 결정한다.
					nowlastpage=result.get(0).getNowpage();
				}
			%>
			<!--만약 블록이 1보다 크다면  -->
			<%if(nowblock>1){ %>
			<a class="btn btn-info" href="callboard.do?b_boardname=<%=boardname%>&nowpage=<%=nowstartpage-1%><%if(request.getAttribute("searchword")!=null){ %>&searchword=<%=(String)request.getAttribute("searchword")%><%}%>" id="pages" role="button">이전으로</a>
			<%} %>	
			
			<%	
				for(int i=nowstartpage; i<=nowlastpage;i++){
					//보여줄페이지 * 현재블럭수=> 현재의 마지막페이지
					
					//현재 마지막 페이지-보여주는 페이지+1 = 현재 블럭의 시작페이지
			%>
			
			
				<a class="btn btn-info" href="callboard.do?b_boardname=<%=boardname%>&nowpage=<%=i%><%if(request.getAttribute("searchword")!=null){ %>&searchword=<%=(String)request.getAttribute("searchword")%><%}%>" id="pages" role="button"><%=i%></a>
			<%
			
			} 
			%>
			<!-- 만약 전체 마지막 페이지가 현재 마지막 페이지보다 클 때  -->
			<%if(result.get(0).getNowpage()>nowlastpage){ %>	
			<a class="btn btn-info" href="callboard.do?b_boardname=<%=boardname%>&nowpage=<%=nowlastpage+1%><%if(request.getAttribute("searchword")!=null){ %>&searchword=<%=(String)request.getAttribute("searchword")%><%}%>" id="pages" role="button">다음으로</a>
			<%} %>
			
			<a class="btn btn-info" href="callboard.do?b_boardname=<%=boardname%>&nowpage=<%=result.get(0).getNowpage()%><%if(request.getAttribute("searchword")!=null){ %>&searchword=<%=(String)request.getAttribute("searchword")%><%}%>" id="pages" role="button">끝으로</a>
			<% 	
				}
			%>
			</div>
		</div>
		<div class="search_area">
		
			<form action="callboard.do">
				<input type="hidden" name="b_boardname" value="<%=boardname%>">
				
				<input type="text" name="searchword" class="" placeholder="검색어를 입력 해 주세요"></input>		
				<button type="submit" class="btn btn-success">검색</button>
			</form>
			
		</div>
			
	</section>
	
	<!-- footer  -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!--자바 스크립트 추가 부분  -->
	<script type="text/javascript" src="/resources/js/board/general.js"></script>
	
</body>
</html>