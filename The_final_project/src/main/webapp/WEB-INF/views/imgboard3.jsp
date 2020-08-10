<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="/resources/css/boardcss/main.css" /> -->
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


         .main_area {
            width: 55%;
            height: 730px;
            border-radius: 10px;
            box-shadow:3px 15px 50px 3px rgba(00,0,0,0.3);
            margin: 0 auto;
            text-align: center;
            
        }

        .name_area {
            width: 100%;
            height: 50px;
            
            text-align: left;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .name_area h3 {
          margin-left: 10px;
        }

        .name_area img {
            width: 50px;
            height: 50px;
            float: left;
            margin-left: 10px;
            margin-right: 10px;
            
        }

        .picture_area {
            width: 90%;
            height: 485px;
           
            margin: 0 auto;
        }

        .picture_area img {
            width: 100%;
            height: 470px;
        
        }

        .text_area {
            width: 90%;
            
            margin: 0 auto;
            
            
        }

        .date_area h3 {
            width: 200px;
            margin-left: 15px;
            padding-top: 15px;
           
            }

        .date_area p {
            width: 100%;
           text-align:right;
           
            margin-right:15px;
            font-size: 15px;}
        
        
        .text{
        margin-top: 20px;
        }
        .text p {
            width: 100%;
            font-size: 20px;
			overflow: hidden;
   			 text-overflow: ellipsis;
   			 display: -webkit-box;
    			-webkit-line-clamp: 3; /* 라인수 */
    			-webkit-box-orient: vertical;
    		word-wrap:break-word; 
    		line-height: 1.2em;
    		height: 3.6em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
        }
            
          
            
            .ver_2 { width: 70%;
                     margin: 0 auto;
                     text-align: center;
                     
                     }

.mainsection{
	
	width: 100%;
	height: auto;
	text-align: center;
	padding-bottom: 50px;
}


.verwrap{
margin-top: 5%;

}


.text{

text-align: left;

}

.more{
width:90%;
margin-top: 25px;
/* margin-right: 50px; */
/* float: right; */
text-align: right;
margin: 0 auto;
}

.picturewrap{
width:100%;
margin-top: 40px;

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


	<section class="mainsection">
	
	<div class="verwrap">
	  <div class="ver_2">
             <div class="main_area">
        <div class="name_area">
            <img src="/resources/img/my_page.png">
            <h3>lettoncom</h3>
        </div>
		<div class="picturewrap">
        <div class="picture_area">
            <img src="/resources/img/alexandre-valdivia-mMzaKVV-isQ-unsplash.jpg">
        </div>
        </div>
		<!--텍스트 부분  -->
        <div class="text_area">
            <div class="date_area"><p>2020.20.20</p></div>
           <div class="text"><p>What is Lorem Ipsum?
               dustry'ersions of Lorem Ipsum.</p></div>
        </div>
        <div class="more">
        <a href="#">자세히..</a>
        
        </div>
        
    </div>
      </div>
      </div>
      
      <div class="verwrap">
	  <div class="ver_2">
             <div class="main_area">
        <div class="name_area">
            <img src="/resources/img/my_page.png">
            <h3>lettoncom</h3>
        </div>
		<div class="picturewrap">
        <div class="picture_area">
            <img src="/resources/img/alexandre-valdivia-mMzaKVV-isQ-unsplash.jpg">
        </div>
        </div>
		<!--텍스트 부분  -->
        <div class="text_area">
            <div class="date_area"><p>2020.20.20</p></div>
           <div class="text"><p>What is Lorem Ipsum?
               dustry'ersions of Lorem Ipsum.</p></div>
        </div>
        <div class="more">
        <a href="#">자세히..</a>
        
        </div>
        
    </div>
      </div>
      </div>
      
      
      </section>
<!-- 	<section class="sidebar"> -->
	
<!-- 	</section> -->
<!-- 	<!--전체 섹션  --> -->
<!-- 	<section class="mainsection"> -->
	
<!-- 		<!--섹션안에 구분선을 위한 div  --> -->
<!-- 		<div class="container postwrap"> -->
		
<!-- 		<!--진짜 포스팅이 들어가는 부분  --> -->
<!-- 			<div class="posting"> -->
			
<!-- 				포스팅 헤더 부분  -->
<!-- 				<div class="headersep"> -->
<!-- 					<div class="header-left"> -->
<!-- 						<div class="titles"> -->
<!-- 							<span>제목 제목</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="header-right"> -->
<!-- 						<div class="regdate"> -->
<!-- 							<span>글쓴 날짜</span> -->
<!-- 						</div> -->
<!-- 						<div class="writerinfo"> -->
<!-- 							<div class="profileimg"> -->
<!-- 								<img> -->
<!-- 							</div> -->
<!-- 							<div class="writername"> -->
<!-- 								<span>이름이름</span> -->
<!-- 							</div>	 -->
						
<!-- 						</div> -->
					
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				포스팅 헤더 부분  END -->
				
<!-- 				포스팅 이미지 부분  -->
<!-- 				<div class="imgwraper"> -->
<!-- 					<div class="postimg"> -->
<!-- 						<img src="/resources/img/hero/hero-2.jpg"> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 				<div class="contentswraper"> -->
<!-- 					<div class="realcontents"> -->
<!-- 					내용내용 내용내용 -->
					
<!-- 					</div> -->
				
				
<!-- 				</div> -->
				
			
			
<!-- 			</div> -->
		
			
<!-- 		</div> -->
	
	
	
	
	
	
	
<!-- 	</section> -->

		



<div class="footerwrap">
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</div>
</body>
</html>