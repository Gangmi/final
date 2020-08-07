<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/boardcss/main.css" />
<style type="text/css">
#loader {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
     z-index: 2000;
}

#loader>div {
    width: 100%;
    height: 12.5%;
    background: #446633;
    transition: transform 500ms;
   
}

#loader>div:nth-child(1) {
    transition-delay: 100ms;
}

#loader>div:nth-child(2) {
    transition-delay: 200ms;
}

#loader>div:nth-child(3) {
    transition-delay: 300ms;
}

#loader>div:nth-child(4) {
    transition-delay: 400ms;
}

#loader>div:nth-child(5) {
    transition-delay: 500ms;
}

#loader>div:nth-child(6) {
    transition-delay: 600ms;
}

#loader>div:nth-child(7) {
    transition-delay: 700ms;
}

#loader>div:nth-child(8) {
    transition-delay: 800ms;
}

body:not(.hidden).reveal #loader>div {
    transform: translateX(-100%);
}

</style>
<script type="text/javascript">
setTimeout(() => {
    document.body.classList.add("reveal")
}, 1000),
document.addEventListener("click", () => {
    document.getElementById('loader').classList.toggle("reveal")
});




</script>


<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<div id="loader">
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
</div>
	
	<section class="sidebar">
	
	</section>
	<!--전체 섹션  -->
	<section class="mainsection">
	
		<!--섹션안에 구분선을 위한 div  -->
		<div class="container postwrap">
		
		<!--진짜 포스팅이 들어가는 부분  -->
			<div class="posting">
			
				<!--포스팅 헤더 부분  -->
				<div class="headersep">
					<div class="header-left">
						<div class="titles">
							<span>제목 제목</span>
						</div>
					</div>
					<div class="header-right">
						<div class="regdate">
							<span>글쓴 날짜</span>
						</div>
						<div class="writerinfo">
							<div class="profileimg">
								<img>
							</div>
							<div class="writername">
								<span>이름이름</span>
							</div>	
						
						</div>
					
					</div>
				</div>
				
				
				<div class="postimg">
				
				</div>
			
			
			
			</div>
		
			
		</div>
	
	
	
	
	
	
	
	</section>

		



<div class="footerwrap">
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</div>
</body>
</html>