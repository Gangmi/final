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
<

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

				<!--원래 있던 예약 폼-->
				<!--
                <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                    <div class="booking-form">
                        <h3>Booking Your Hotel</h3>
                        <form action="#">
                            <div class="check-date">
                                <label for="date-in">Check In:</label>
                                <input type="text" class="date-input" id="date-in">
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="check-date">
                                <label for="date-out">Check Out:</label>
                                <input type="text" class="date-input" id="date-out">
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="select-option">
                                <label for="guest">Guests:</label>
                                <select id="guest">
                                    <option value="">2 Adults</option>
                                    <option value="">3 Adults</option>
                                </select>
                            </div>
                            <div class="select-option">
                                <label for="room">Room:</label>
                                <select id="room">
                                    <option value="">1 Room</option>
                                    <option value="">2 Room</option>
                                </select>
                            </div>
                            <button type="submit">Check Availability</button>
                        </form>
                    </div>
                </div>
                -->

			</div>
		</div>
		<!--케러셀 슬라이드 이미지 부분-->
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="/resources/img/hero/hero-1.jpg"></div>
			<div class="hs-item set-bg" data-setbg="/resources/img/hero/hero-2.jpg"></div>
			<div class="hs-item set-bg" data-setbg="/resources/css/images/hero/hero-3.jpg"></div>
		</div>
	</section>


	<!-- Hero Section End -->

	<!-- 어바웃어스 -->

	<section class="aboutus-section spad">
		<div class="container">
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
								<img src="img/about/about-1.jpg" alt="">
							</div>
							<div class="col-sm-6">
								<img src="img/about/about-2.jpg" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Us Section End -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!-- 자바스크립트 -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>