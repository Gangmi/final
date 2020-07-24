<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<body>
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
			<sec:authorize access="isAnonymous()">
				<a href="login.do">로그인</a> &nbsp;&nbsp;
								<a href="sign_up.do">회원가입</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="logout.do">로그아웃</a>&nbsp;&nbsp;
								<a href="updateInfo.do">회원정보수정</a>
			</sec:authorize>
			&nbsp;&nbsp;<i class="icon_search"></i>
		</div>
		<div class="header-configure-area">
			<div class="language-option">
				<img src="img/flag.jpg" alt=""> <span>EN <i
					class="fa fa-angle-down"></i></span>
				<div class="flag-dropdown">
					<ul>
						<li><a href="#">Zi</a></li>
						<li><a href="#">Fr</a></li>
					</ul>
				</div>
			</div>
			<a href="#" class="bk-btn">Booking Now</a>
		</div>
		<nav class="mainmenu mobile-menu">
			<ul>
				<li class="active"><a href="./index.html">Home</a></li>
				<li><a href="./rooms.html">Rooms</a></li>
				<li><a href="./about-us.html">About Us</a></li>
				<li><a href="./pages.html">Pages</a>
					<ul class="dropdown">
						<li><a href="./room-details.html">Room Details</a></li>
						<li><a href="#">Deluxe Room</a></li>
						<li><a href="#">Family Room</a></li>
						<li><a href="#">Premium Room</a></li>
					</ul></li>
				<li><a href="./blog.html">News</a></li>
				<li><a href="./contact.html">Contact</a></li>
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
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="logo">
						<a href="./index.html"> <!--로고 들어가는섹션--> <img
							src="img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-10">
					<div class="nav-menu">
						<nav class="mainmenu">
							<ul>
								<!--네비게이션 메뉴-->
								<li class="active"><a href="./index.html">Home</a></li>
								<li><a href="./rooms.html">스마트팜</a></li>
								<li><a href="./about-us.html">About Us</a></li>
								<li><a href="./pages.html">게시판</a>
									<ul class="dropdown">
										<li><a href="./room-details.html">자유게시판</a></li>
										<li><a href="./blog-details.html">팁게시판</a></li>
										<li><a href="#">장터 게시판</a></li>
										<li><a href="#">분양 게시판</a></li>
									</ul></li>
								<li><a href="./blog.html">식물사전</a></li>
								<li><a href="./contact.html">제휴농장위치</a></li>
							</ul>
						</nav>
						<div class="nav-right search-switch">
							<sec:authorize access="isAnonymous()">
								<a href="login.do">로그인</a> &nbsp;&nbsp;
								<a href="sign_up.do">회원가입</a>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<a href="logout.do">로그아웃</a>&nbsp;&nbsp;
								<a href="updateAccount.do">회원정보수정</a>
							</sec:authorize>
							<i class="icon_search"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>