<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width = device-width, initial-scale = 1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>나의 스마트 팜 </title>
    
    <link rel="stylesheet" href="/resources/css/Smart-Farm/style.css">
   	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<!-- <div id="talk">
		<div class="chat">
			<button>
				<img src="/resources/img/talk-1.png">
			</button>
		</div>
	</div> -->

	<div id="main">
	<br>
		<h2>나의 스마트 팜</h2>
		<div class="upper">
		<div class="cctv_box">
<!-- 			<div class="cctv"><img src="/resources/img/xxxxxxxx.jpg"></div> -->
			<div class="cctv"><img src="${deviceIp}"></div>
			
		</div>
	   <div class="btn">
	   		<div class="infowrap">
		   		<p class="farm-info">농장주소</p>
				<p>경기도 여주시 금사면 금품2로 485 루돌프 농장</p>
				<br>
				<p class="farm-info">전화번호</p>
				<p>031-884-6554</p>
				<br>
				<p class="farm-info">농장 개설일  </p>
				<p>2020-08-01</p>
			</div>
				<div class="buttonwrap">
					<div class="btn1">
						<button type="button" id="givewater"><img src="/resources/img/15159159.png">
							물주기
						</button>
					</div>
		
					<div class="btn2">
						<button type="button" id="givelight"><img src="/resources/img/1515151131313.png">
							라이트 켜기/끄기
						</button>
					</div>
				</div>	
			</div>     
	</div>
	<div class="tempinfo">
	
	</div>
		<div class="guagewrap">
			<div class="gauge-container">
				<div class="gauge" id="temperature"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="gauge" id="humidity"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="gauge" id="soil_humidity"></div>
			</div> 
		</div>            
	</div>

	<jsp:include page="../footer.jsp"/>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js'></script>
	<script src='https://cdn3.devexpress.com/jslib/17.1.6/js/dx.all.js'></script>
	<script  src="/resources/js/script.js"></script>
</body>
</html>