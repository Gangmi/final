<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width = device-width, initial-scale = 1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> Keat </title>
    
    <link rel="stylesheet" href="/resources/css/Smart-Farm/style.css">
    <style>
        
    </style>
</head>
<body>
	<div id="header">
		<p><a href="#">슈퍼 그랑-조 </a>님 반갑습니다.</p>
		<section class="header">
			<a href="1_Main.html.html"><img src="/resources/img/logo-2.png" alt="LOGO"></a>

			<ul class="header_menu">
				<li><a href="4Aoutus.html.html">소개</a></li>
				<li><a href="5place.html.html">농장위치</a></li>
				<li><a href="2Join.html.html">로그아웃</a></li>
				<li><a href="3Login.html.html">마이페이지</a></li>
			</ul>
		</section>
	</div>

	<div id="talk">
		<div class="chat">
			<button>
				<img src="/resources/img/talk-1.png">
			</button>
		</div>
	</div>

	<div id="main">
		<p>나의 스파트 팜</p>
	
		<div class="cctv_box">
			<div class="cctv"><img src="/resources/img/xxxxxxxx.jpg"></div>
			<p>경기도 여주시 금사면 금품2로 485 루돌프 농장</p>
			<p>031-884-6554</p>
			<div class="btn">
				<div class="btn1">
					<button type="submit"><img src="/resources/img/15159159.png">
						<p>물주기</p>
					</button>
				</div>
	
				<div class="btn2">
					<button type="submit"><img src="/resources/img/1515151131313.png">
						<p>수확하기</p>
					</button>
				</div>
			</div>
		</div>
	        
	
	
		<div class="gauge-container">
			<div class="gauge" id="temperature"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="gauge" id="humidity"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="gauge" id="soil_humidity"></div>
		</div>
	            
	</div>

	<div id="footer">
		<p>@COPYRIGHT_</p>
	</div>
    
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js'></script>
	<script src='https://cdn3.devexpress.com/jslib/17.1.6/js/dx.all.js'></script>
	<script  src="/resources/js/script.js"></script>
</body>
</html>