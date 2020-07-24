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
	
</body>
</html>