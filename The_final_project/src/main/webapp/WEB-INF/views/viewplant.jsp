<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.kos.vo.PlantVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>  
<head> 
<meta charset="UTF-8">
<title>viewplant</title>  
<!-- css -->
<link rel="stylesheet" href="/resources/css/plant.css" type="text/css">
 
<%
	PlantVO plantinfo = (PlantVO)request.getAttribute("plantinfo");
%> 
</head>         
<body>      
	<!-- header -->   
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
	<section class="hero-section-info">
		<div class="container"> 
			<h2>식물 상세 정보</h2>    
			<table id="myTable"> 
				<tr class="header"> 
					<th style="width: 30%;">식물정보</th>
				</tr> 
				<tr>       
					<td class="infosize"><%=plantinfo.getPlantinfo() %></td> 
				</tr>   
			</table> 
		</div>  
	</section>
 
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!-- js -->
	<script src="/resources/js/plant.js"></script>
</body>
</html>