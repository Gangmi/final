<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.kos.vo.PlantVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plant</title>
<!-- css -->
<link rel="stylesheet" href="/resources/css/plant.css" type="text/css">
<!-- CSS , JS -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
	List<PlantVO> plant = (List<PlantVO>) request.getAttribute("plantlist");
%>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<section class="hero-section">
		<div class="plantdiv">
 
			<h2>여름지기 식물사전</h2> 
		<div class="inputandbtn">
			<input type="text" id="myInput" placeholder="검색어를 입력하세요">
			<button class="btn btn-success" id="search" type="submit">검색</button>
		</div>
		<div class="tabdiv"> 
			<div class="tab"> 
				<a href="plant.do?plantcate=겉씨식물" class="btn" onclick="openCity(event, 'gymnosperms')" role="button">겉씨식물</a>
				<a href="plant.do?plantcate=속씨식물" class="btn" onclick="openCity(event, 'Angiospermae')" role="button" >속씨식물</a>
				<a href="plant.do?plantcate=양치식물" class="btn" onclick="openCity(event, 'Pteridophyta')" role="button">양치식물</a>
				<a href="plant.do?plantcate=선태식물" class="btn" onclick="openCity(event, 'Bryophyte')" role="button">선태식물</a>
				<a href="plant.do?plantcate=조류" class="btn" onclick="openCity(event, 'algae')" role="button">조류</a>
				<a href="plant.do?plantcate=군류" class="btn" onclick="openCity(event, 'gunru')" role="button">군류</a>
				<a href="plant.do?plantcate=식물기타" class="btn" onclick="openCity(event, 'Plantguitar')" role="button">식물기타</a>
			</div>
		</div> 
			<%   
				for (PlantVO vo : plant) {
			%> 
			<div class="side_1">
				<div class="main_left">
					<div class="img">
						<img src="/resources/img/plant/<%=vo.getPlantcate()%>/<%=vo.getPlanttitles()%>.jpg">
					</div> 
				</div>	
				<div class="box_left">
					<a href="viewplant.do?plantid=<%=vo.getPlantid()%>"><%=vo.getPlanttitles()%></a>
					<p class="plantcate"><%=vo.getPlantcate()%></p>
				</div> 
			</div>  
			<%
					}
				%>
			<!--페이징 부분  -->
			<div class="page" id="pager">
				<%
						if ((Integer) request.getAttribute("confirm") == 1) {
						List<PlantVO> result = (List<PlantVO>) request.getAttribute("plantlist");
						//현재 블록 정보를 가져옴(paging VO에서 계산된것을 Boardvo에 넣어서 가져왔음)	
						int nowblock = result.get(0).getBlock();
						//현재 화면에서 클라이언트가 보는 마지막 페이지 
						int nowlastpage = nowblock * 5;
						//현재 화면에서 클라이언트가 보는 첫페이지
						int nowstartpage = nowlastpage - 5 + 1;

						//만약 현재 보이는 마지막 페이지가 총 페이지보다 크다면 (예를들면 현재 보이기로 예정된 페이지는 1블록이라서 5페이지 까지인데 , 3페이지까지밖에 없을 경우)
						if (nowlastpage > result.get(0).getNowpage()) {
							//총페이지를 현재 보이는 최종 페이지로 결정한다.
							nowlastpage = result.get(0).getNowpage();
						}
					%>
				<!--만약 블록이 1보다 크다면  -->
				<%
						if (nowblock > 1) {
					%>
				<a class="btn btn-info"
					href="plant.do?nowpage=<%=nowstartpage - 1%><%if (request.getAttribute("searchword") != null) {%>&searchword=<%=(String) request.getAttribute("searchword")%><%}%><%if (request.getAttribute("plantcate") != null) {%>&plantcate=<%=(String) request.getAttribute("plantcate")%><%}%>"
					id="pages" role="button"> < </a>
				<%
						}
					%> 

				<%
						for (int i = nowstartpage; i <= nowlastpage; i++) {
						//보여줄페이지 * 현재블럭수=> 현재의 마지막페이지

						//현재 마지막 페이지-보여주는 페이지+1 = 현재 블럭의 시작페이지
					%>


				<a class="btn btn-info"
					href="plant.do?nowpage=<%=i%><%if (request.getAttribute("searchword") != null) {%>&searchword=<%=(String) request.getAttribute("searchword")%><%}%><%if (request.getAttribute("plantcate") != null) {%>&plantcate=<%=(String) request.getAttribute("plantcate")%><%}%>"
					id="pages" role="button"><%=i%></a>
				<%
						}
					%>
				<!-- 만약 전체 마지막 페이지가 현재 마지막 페이지보다 클 때  -->
				<%
						if (result.get(0).getNowpage() > nowlastpage) {
					%>
				<a class="btn btn-info"
					href="plant.do?nowpage=<%=nowlastpage + 1%><%if (request.getAttribute("searchword") != null) {%>&searchword=<%=(String) request.getAttribute("searchword")%><%}%><%if (request.getAttribute("plantcate") != null) {%>&plantcate=<%=(String) request.getAttribute("plantcate")%><%}%>"
					id="pages" role="button">></a>
				<%
						}
					%>

				<a class="btn btn-info"
					href="plant.do?nowpage=<%=result.get(0).getNowpage()%><%if (request.getAttribute("searchword") != null) {%>&searchword=<%=(String) request.getAttribute("searchword")%><%}%><%if (request.getAttribute("plantcate") != null) {%>&plantcate=<%=(String) request.getAttribute("plantcate")%><%}%>"
					id="pages" role="button">>></a>
				<%
						}
					%>
			</div>
		</div>
	</section>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!-- js -->
	<script src="/resources/js/plant.js"></script>
</body>
</html>