<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>


<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/flaticon.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
 
	<!-- Hero Section Begin -->

	<section class="hero-section">
		<div class="container">
			<div class="row">

				<div class="col-lg-6">
					<div class="hero-text">
						<h1>여기에 우리이름</h1>
						<p>내용</p>
						<!--
                        <a href="#" class="primary-btn">Discover Now</a>
                        -->
					</div>
				</div>

				

			</div>
		</div>
		<!--케러셀 슬라이드 이미지 부분-->
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="/resources/img/hero/hero-1.jpg"></div>
			<div class="hs-item set-bg" data-setbg="/resources/img/hero/hero-2.jpg"></div>
			<div class="hs-item set-bg" data-setbg="/resources/img/hero/hero-3.jpg"></div>
		</div>
	</section>


	<!-- Hero Section End -->

	<!-- 어바웃어스 -->

	<section class="aboutus-section spad">
		<div class="container">
			<div class="col-lg3 weather">
                <br><br>
                <h2> 현재 날씨 </h2>
                <div class="weather-icon">
                    <img id='weather-icon' src="http://openweathermap.org/img/wn/01d@2x.png" alt="">
                </div>
                <div><span id='location'>광명시</span><br>	<span id="temperature"></span></div>
                    <button id = "searchMyWeather">우리동네 날씨</button><br/>
            </div>
			<div class="row">
				<div class="col-lg-6">
					<div class="about-text">
						<div class="section-title">
							<span>여기에 우리 페이지 간단소개</span>
							<h2>슬로건</h2>
						</div>
						<p class="f-para">내용</p>
						<p class="s-para">내용2</p>
						<!--
                        <a href="#" class="primary-btn about-btn">Read More</a>
                        -->
					</div>
				</div>
				<!--어바웃어스 옆에 사진-->
				<div class="col-lg-6">
					<div class="about-pic">
						<div class="row">
							<div class="col-sm-6">
								<img src="/resources/img/about/about-1.jpg" alt="">
							</div>
							<div class="col-sm-6">
								<img src="/resources/img/about/about-2.jpg" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- About Us Section End -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85ca856139e74206389aacd96ce85ab6&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url: "https://api.openweathermap.org/data/2.5/weather?lat=37.47308&lon=126.87883&appid=62b19ec9dfd3b8c39e0254dfb88e07c9",
			type: "GET",
			dataType:"json",
			success: function onData (data) {
				var rep=$('#weather-icon').attr('src').replace('01d@2x',data.weather[0].icon+'@2x');
				$('#weather-icon').attr('src',rep);
				var temperature =parseFloat(data.main.temp)-273.15;
				temperature=Math.round(temperature * 100) / 100
				$('#temperature').html(temperature+'°C');
				//여기 메인 날씨 데이터 변해야함
		    },
		   	error: function error(){
			   	$('.weather').css({"display":"none"});
			   	}
		});
	 		$('.mainmenu ul li').find('a[href="/index.do"]').parent().addClass('active');

	 		$("#searchMyWeather").on("click",function(){
	 			geoFindMe();
	 	 		});
			function geoFindMe() {
			    function success(position) {
			        const latitude  = position.coords.latitude;
			        const longitude = position.coords.longitude;

			        $.ajax({
			    		url: "https://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+"&appid=62b19ec9dfd3b8c39e0254dfb88e07c9",
			    		type: "GET",
			    		dataType:"json",
			    		success: function onData (data) {
			    			var rep=$('#weather-icon').attr('src').replace('01d@2x',data.weather[0].icon+'@2x');
			    			$('#weather-icon').attr('src',rep);
			    			var temperature =parseFloat(data.main.temp)-273.15;
			    			temperature=Math.round(temperature * 100) / 100
			    			$('#temperature').html(temperature+'°C');
			    			$('#location').html(data.name);
							//행정동 지명 구하기 카카오API
							var geocoder = new kakao.maps.services.Geocoder();
							geocoder.coord2RegionCode(longitude, latitude,function(result, status){
								if (status === kakao.maps.services.Status.OK) {
									for(var i = 0; i < result.length; i++) {
							            // 행정동의 region_type 값은 'H' 이므로
							            if (result[i].region_type === 'H') {
							            	$('#location').html(result[i].region_1depth_name+result[i].region_2depth_name);
							                break;
							            }
							        }
								}
							}); 
							
			    			//-----------------------------------------
			    	    }
			    	});
			    }

			    function error() {
			        alert(status.textContent = '위치를 찾을 수 없습니다.');
			    }

			    if(!navigator.geolocation) {
			        alert(status.textContent = 'Geolocation is not supported by your browser');
			      } else {
			        navigator.geolocation.getCurrentPosition(success,error);
			      }

			}
	});
	
	</script>
</body>
</html>