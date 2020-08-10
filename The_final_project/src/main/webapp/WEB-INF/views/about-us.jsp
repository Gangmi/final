<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ap-title{
text-align: center;
}
.ap-title{
	margin-top: 10px;
}

.ourvalue{
text-align: center;
}
.ourvaluewrap{
width: 100%;
margin: 0 auto;
margin-top: 50px;

}
.ourvaluewrap li {
text-align: center;

}

.devsection{
width:100%;

}
.developer{
width:100%;
margin: 0 auto;


}
.developer h3{


text-align: center;

}
.photo img{
width: 100%;


}

.km{
width: 10%;

}

</style>
</head>
<body>
<jsp:include page="./header.jsp"></jsp:include>
 <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>사이트 소개</h2>
                        <br>
                        <br>
                        
<!--                         <div class="bt-option"> -->
<!--                             <a href="redirect:index.jsp">Home</a> -->
<!--                             <span>About Us</span> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
             <div class="about-page-services">
                <div class="row">
                    <div class="col-md-4">
                        <div class="ap-service-item set-bg" data-setbg="/resources/img/index/사진6.png">
                            <div class="api-text">
<!--                                 <h3>Restaurants Services</h3> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="ap-service-item set-bg" data-setbg="/resources/img/index/사진3.png">
                            <div class="api-text">
<!--                                 <h3>Travel & Camping</h3> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="ap-service-item set-bg" data-setbg="/resources/img/index/사진7.png">
                            <div class="api-text">
<!--                                 <h3>Event & Party</h3> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- About Us Page Section Begin -->
    <section class="aboutus-page-section spad">
        <div class="container">
            <div class="about-page-text">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ap-title">
                            <h3>"여름지기"는 농부의 순우리말입니다.</h3>
                            
                            <br>
                            <p>노하우가 중요한 농업에서 지식의 공유만큼 좋은 거름은 없다고 생각했습니다.</p>
                            <p>하지만, 우리나라 농업 관련 커뮤니티들을 대부분 활성화 되어있지 않으며, 사용자의 이목을 끌 기능을 갖추지 못하고 있습니다.</p>
                            <p>저희는 다양한 기능을 가진 강력한 커뮤니티 사이트가 필요하다고 생각했고 이 사이트를 개발하게 되었습니다. </p>
                            
                        </div>
                    </div>
                    <div class="ourvaluewrap">
                        <ul class="ap-services">
                            <li class="ourvalue"><h3>우리의 가치</h3> </li>
                            <br>
                            <li><i class="icon_check"></i> 스마트팜시스템을 이용한 원격 식물재배</li>
                            <li><i class="icon_check"></i> 식물 사전 및 챗봇을 통한 정확한 정보 검색</li>
                           <li><i class="icon_check"></i> 농사IN 시스템을 이용한 사용자 맞춤 Q&A</li>
                            <li><i class="icon_check"></i> 두가지 모드의 게시판 제공으로 가독성 증가</li>
                        </ul>
                    </div>
                </div>
            </div>
        
        </div>
    </section>
     
    <!-- About Us Page Section End -->
<!--     <section class="devsection"> -->
    	
<!-- 	    <div class="developer"> -->
<!-- 	    <h3>개발자</h3> -->
<!-- 			<div class="km"> -->
<!-- 				<div class="photo"> -->
<!-- 					<img src="/resources/img/about/km.jpg"> -->
<!-- 				</div> -->
			
			
<!-- 			</div> -->
<!-- 			<div class="mj"> -->
			
			
<!-- 			</div> -->
<!-- 			<div class="kt"> -->
			
			
<!-- 			</div> -->
<!-- 			<div class="jj"> -->
			
			
<!-- 			</div> -->
<!-- 		</div>	 -->
<!-- 	</section>	 -->
    <!-- Video Section Begin -->
   
    <!-- Video Section End -->

    <!-- Gallery Section Begin -->
    
 
<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>