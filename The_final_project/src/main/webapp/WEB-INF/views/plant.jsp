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
		<!-- <div class="container"> -->
			<h2>식물사전</h2>

			<input type="text" id="myInput" placeholder="검색어를 입력하세요">
			<button class="btn btn-success" id="search" type="submit">검색</button>

			<div class="tab">
				<button class="tablinks" onclick="openCity(event, 'gymnosperms')">겉씨식물</button>
				<button class="tablinks" onclick="openCity(event, 'Angiospermae')">속씨식물</button>
				<button class="tablinks" onclick="openCity(event, 'Pteridophyta')">양치식물</button>
				<button class="tablinks" onclick="openCity(event, 'Bryophyte')">선태식물</button>
				<button class="tablinks" onclick="openCity(event, 'algae')">조류</button>
				<button class="tablinks" onclick="openCity(event, 'gunru')">균류</button>
				<button class="tablinks" onclick="openCity(event, 'Plantguitar')">식물기타</button>
			</div>

			<%
				for(PlantVO vo : plant){
			%>
			<div id="gymnosperms" class="tabcontent">
				<tr>
					<td><a href="plant.do?plantcate=겉씨식물">겉씨식물</a></td>
				</tr>
			</div> 

			<div id="Angiospermae" class="tabcontent">
				<tr>
					<td><a href="plant.do?plantcate=속씨식물">속씨식물</a></td>
				</tr>
			</div>

			<div id="Pteridophyta" class="tabcontent">
				<tr>
					<td><a href="plant.do?plantcate=양치식물">양치식물</a></td>
				</tr>
			</div>

			<div id="Bryophyte" class="tabcontent">
				<tr>
					<td><a href="plant.do?plantcate=선태식물">선태식물</a></td>
				</tr>
			</div>

			<div id="algae" class="tabcontent">
				<tr>
					<td><a href="plant.do?plantcate=조류">조류</a></td>
				</tr>  
			</div>

			<div id="gunru" class="tabcontent">
				<tr>
					<td><a href="plant.do?plantcate=군류">군류</a></td>
				</tr>  
			</div> 
			
			<div id="Plantguitar" class="tabcontent">
				<tr>
					<td><a href="plant.do?plantcate=식물기타">식물기타</a></td>
				</tr>  
			</div>  
 
			<%
				}
			%>
			<div>
				<table id="myTable">
					<tr class="header">
						<th style="width: 30%;">번호</th>
						<th style="width: 30%;">카테고리</th>
						<th style="width: 30%;">이미지</th>
						<th style="width: 30%;">식물명</th>
					</tr>

					<%
						for (PlantVO vo : plant) {
					%>

					<tr>
						<td><%=vo.getPlantid()%></td>
						<td><%=vo.getPlantcate()%></td>
						<td><img
							src="/resources/img/plant/<%=vo.getPlantcate()%>/<%=vo.getPlanttitles()%>.jpg">
						</td>
						<td><a value="<%=vo.getPlanttitles()%>"
							href="viewplant.do?plantid=<%=vo.getPlantid()%>"><%=vo.getPlanttitles()%></td>
					</tr>

					<%
						}
					%>
				</table>
				<!--페이징 부분  -->
				<div class="paging"> 
					<%
						if ((Integer) request.getAttribute("confirm") == 1) { 
						List<PlantVO> result = (List<PlantVO>) request.getAttribute("plantlist");
						int pagelimit = 0;
						if (result.get(0).getNowpage() > 10) {
							pagelimit = 10;  
						} else {
							pagelimit = result.get(0).getNowpage();
						}
						for (int i = 1; i <= pagelimit; i++) { 
					%>
					<a class="btn btn-info" href="plant.do?nowpage=<%=i%><%if(request.getAttribute("plantcate")!=null){ %>&plantcate=<%=(String)request.getAttribute("plantcate")%><%}%>" id="pages" role="button"><%=i%></a>
					<%   
						}    
					%>  
					<a class="btn btn-info" href="plant.do?nowpage=<%=plant.get(0).getNowpage()%>" id="pages" role="button">끝으로</a>
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