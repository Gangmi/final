<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
<style type="text/css">

.logo img{
width: 238px !important;


}

</style>



</head>
<body>
	<!-- 챗봇 연동 -->
	<script id="embeddedChatbot" data-botId="Bdv56x" src="https://www.closer.ai/js/webchat.min.js"> </script>
	
	<div id="preloder">
        <div class="loader"></div>
    </div>
	
	<div class="offcanvas-menu-overlay"></div>
	<div class="canvas-open">
		<i class="icon_menu"></i>
	</div>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<i class="icon_close"></i>
		</div>
		
		<div class="search-icon  search-switch">
			<i class="icon_search"></i>
		</div>
		<div>
			<sec:authorize access="isAnonymous()">
				<a href="/login.do">로그인</a> &nbsp;&nbsp;
								<a href="/sign_up.do">회원가입</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<span><a href="/my-page.do">${sessionScope.memberinfo.name }</a> 님</span>&nbsp;&nbsp;
				<a href="/logout.do">로그아웃</a>&nbsp;&nbsp;

				<a href=/my-page.do>마이페이지</a>

			
			</sec:authorize>
		</div>
		<div class="header-configure-area">
			<a href="#" class="bk-btn">마이 페이지</a>
		</div>
		<nav class="mainmenu mobile-menu">
			<ul>
			
				<li class="active"><a href="/index.do">Home</a></li>
				<li><a href="/about-us.do">소개</a></li>
				
				<li><a href="/callboard.do?b_boardname=free_board">게시판</a>
					<ul class="dropdown">
						<li><a href="/callboard.do?b_boardname=free_board">자유게시판</a></li>
						<li><a href="/callboard.do?b_boardname=tip_board">tip 게시판</a></li>
						<li><a href="/callboard.do?b_boardname=parcel_board">분양게시판</a></li>
						<li><a href="/callboard.do?b_boardname=nongsain">농사in게시판</a></li>
						
					</ul></li>
					
				<li><a href="/plant.do?nowpage=1">식물사전</a></li>
				<li><a href="/farm-map.do">제휴농장</a></li>
				<sec:authorize access="hasAuthority('ROLE_ADMIN')">
 				<li><a href="/admin.do">관리자</a></li>
 				</sec:authorize>
			</ul>
		</nav> 
		<div id="mobile-menu-wrap"></div>
		<div class="top-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa fa-tripadvisor"></i></a> <a href="#"><i
				class="fa fa-instagram"></i></a>
		</div>
		<ul class="top-widget">
			<li><i class="fa fa-phone"></i> (12) 345 67890</li>
			<li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
		</ul>
	</div>
	<div class="menu-item">
		<div class="naviwrap">
			<div class="row">
				<div class="col-lg-3">
					<div class="logo">
						<a href="/index.do"> <!--로고 들어가는섹션--> <img
							src="/resources/img/logo3.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="nav-menu">
						<nav class="mainmenu">
							<ul>
								<!--네비게이션 메뉴-->
								<li> <!-- class="active" --><a href="/index.do">Home</a></li>
								<sec:authorize access="hasAuthority('ROLE_SMART_FARMER')">
								<li><a href="/smartfarmer/monitoringView.do">스마트팜</a></li>
								</sec:authorize>
								<li><a href="/about-us.do">사이트 소개</a></li>
								<li><a href="/gardenList.do">식물 추천</a></li>
								<li><a href="/callboard.do?b_boardname=free_board">게시판</a>
									<ul class="dropdown">
										<li><a href="/callboard.do?b_boardname=free_board">자유게시판</a></li>
										<li><a href="/callboard.do?b_boardname=tip_board">팁게시판</a></li>
										<li><a href="/callboard.do?b_boardname=parcel_board">분양 게시판</a></li>
										<li><a href="/callboard.do?b_boardname=nongsain">농사in게시판</a></li>
									</ul></li>

								<li><a href="/plant.do?nowpage=1">식물사전</a></li>
								<li><a href="/farm-map.do">제휴농장</a></li>
 								<sec:authorize access="hasAuthority('ROLE_ADMIN')">
 								<li><a href="/admin.do">관리자</a></li>
 								</sec:authorize>
							</ul>
						</nav>
						<div class="nav-right">
							<sec:authorize access="isAnonymous()">
								<a href="/login.do">로그인</a> &nbsp;&nbsp;
												<a href="/sign_up.do">회원가입</a>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<span>${sessionScope.memberinfo.name } 님</span>&nbsp;&nbsp;
								<a href="/logout.do">로그아웃</a>&nbsp;&nbsp;
								<a href=/my-page.do>마이페이지</a>
							</sec:authorize>
<!-- 							<div class="nav-right search-switch"> -->
<!-- 							<i class="icon_search"></i> -->
<!-- 						</div> -->
							
						</div>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr class="divide"/>

</body>
</html>