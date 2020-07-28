<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.kos.vo.PlantVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="/resources/css/plant.css" type="text/css">
<%
	List<PlantVO> plant = (List<PlantVO>)request.getAttribute("list");
%>
</head> 
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<h2>식물사전</h2>

	<input type="text" id="myInput" onkeyup="myFunction()" placeholder=""
		title="Type in a name">

	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'gymnosperms')">겉씨식물</button>
		<button class="tablinks" onclick="openCity(event, 'Angiospermae')">속씨식물</button>
		<button class="tablinks" onclick="openCity(event, 'Pteridophyta')">양치식물</button>
		<button class="tablinks" onclick="openCity(event, 'Bryophyte')">선태식물</button>
		<button class="tablinks" onclick="openCity(event, 'algae')">조류</button>
		<button class="tablinks" onclick="openCity(event, 'gunru')">균류</button>
		<button class="tablinks" onclick="openCity(event, 'Plant guitar')">기타식물</button>
	</div>

	<div id="gymnosperms" class="tabcontent">
		<h3>gymnosperms</h3>
		<p>겉씨식물(나자식물)은 꽃이 피지 않고, 밑씨에서 발달한 종자가 나출되는 식물군으로, 종자가 심피에 의해 둘러싸여
			있는 속씨식물(피자식물)과 상대되는 분류군이다. 과거 속씨식물의 진화 전 단계로만 여겨졌던 겉씨식물은 유전자 염기서열을
			계통분석한 결과 속씨식물의 자매군임이 밝혀졌다. 겉씨식물의 영어 명칭 gymnosperms의 어원은
			‘gymnos(naked) + sperma(seed)'로서 "종자가 감싸는 구조로 덮여서 보호되지 않고 노출되어 있다"는
			뜻으로 배주가 심피로 둘러싸이지 않았기 때문에 붙여진 이름이다.</p>
	</div>

	<div id="Angiospermae" class="tabcontent">
		<h3>Angiospermae</h3>
		<p>속씨식물은 꽃이라는 생식구조를 갖고, 꽃이 피어 열매를 맺고 그 속에 씨앗이 들어 있는 식물군으로 피자식물 또는
			현화식물 이라고도 하며, 겉씨식물(나자식물)의 자매군이다. 속씨식물은 밑씨가 심피에 둘러싸여 있어 수정된 후 씨앗으로 발달할
			때 외부로 나출되지 않고 열매 안에서 보호되는 구조를 갖는 특징을 갖는다.</p>
	</div>

	<div id="Pteridophyta" class="tabcontent">
		<h3>Pteridophyta</h3>
		<p>관다발식물(tracheophyta) 중에서 꽃이 피지 않고 포자로 번식하는 종류에 대한 총칭.</p>
	</div>

	<div id="Bryophyte" class="tabcontent">
		<h3>Bryophyte</h3>
		<p>선류(蘚類)·태류(苔類)를 포함하여 약 2만 3000종으로 이루어진 최초로 육상생활에 적응한 식물군으로 흔히
			이끼식물이라고 한다. 분류학상으로는 양치식물 가깝지만, 특별한 통도조직은 발달해 있지 않고 엽록체가 있어 독립영양생활을
			한다. 형태학상 줄기·잎의 구별이 있거나, 편평한 엽상체로서 조직의 분화는 적고 헛뿌리가 있다. 무성세대와 유성세대를 거친다
		</p>
	</div>

	<div id="algae" class="tabcontent">
		<h3>algae</h3>
		<p>포자식물의 한 종류로 바다속에서 사는 식물(미역 등이 있다)</p>
	</div>

	<div id="gunru" class="tabcontent">
		<h3>gunru</h3>
		<p>포자 식무르이 한 종류로 곰팡이 같은 것</p>
	</div>
	<div>
		<table id="myTable">
			<tr class="header">
				<th style="width: 30%;">번호</th>
				<th style="width: 30%;">카테고리</th>
				<th style="width: 30%;">식물명</th>
				<th style="width: 30%;">식물정보</th>
			</tr> 
			
			<%
				for(PlantVO vo : plant){
				
			%>
				<tr> 
					<td><%=vo.getPlantId()%></td>
					<td><%=vo.getPlantCate()%></td> 
					<td><%=vo.getPlantTitles()%></td>  
					<td><%=vo.getPlantInfo()%></td>
				</tr>  
			<%     
				} 
			%>  
			
			<tr>
				<td>Berglunds snabbkop</td> 
				<td>Sweden</td> 
				<td>d</td> 
				<td>d</td>
			</tr>
			<tr>
				<td>Island Trading</td>
				<td>UK</td>
				<td>d</td>
				<td>d</td>
			</tr>
			<tr>
				<td>Koniglich Essen</td>
				<td>Germany</td>
				<td>d</td>
				<td>d</td>
			</tr>
			<tr>
				<td>Laughing Bacchus Winecellars</td>
				<td>Canada</td>
				<td>d</td>
				<td>d</td>
			</tr>
			<tr>
				<td>Magazzini Alimentari Riuniti</td>
				<td>Italy</td>
				<td>d</td>
				<td>d</td>
			</tr>
			<tr>
				<td>North/South</td>
				<td>UK</td>
				<td>d</td>
				<td>d</td>
			</tr>
			<tr>
				<td>Paris specialites</td>
				<td>France</td>
				<td>d</td>
				<td>d</td>
			</tr>
		</table>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
		<!-- js -->
		<script src="/resources/js/plant.js"></script>
</body>
</html>