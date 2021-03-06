<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>  
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
            width: 80%;
            
           float:left;
            text-align: left;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .name_area h4 {
          margin-left: 10px;
          margin-top:8px;
          font-family: "Cabin", sans-serif;
        }

        .name_area img {
            width: 45px;
            height: 45px;
            border-radius:45px;
            float: left;
            margin-left: 35px;
            margin-right: 10px;
            
        }

        .picture_area {
            width: 90%;
            height: 485px;
           
            margin: 0 auto;
        }

        .picture_area img {
            width: 100% !important;
            height: 470px !important;
        
        }

        .text_area {
            width: 90%;
            display:inline-block;
            margin: 0 auto;
            height: 120px;
            overflow:hidden;
     		 text-overflow:ellipsis;
            
            
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
        margin-top: 45px;
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
    		 /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
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


}

.title_area{
width: 50%;
text-align: left;
font-weight: bold;
font-size: 20px;
float: left;
}

.title_area p{
font-size: 25px;
color: black;
font-weight: bold;

}



.date_area{
width: 50%;
float: left;
}

.count{
width:15%;
float: left;
display: block;

}

.count p{
margin-top: 55px !important;
text-align: right;

}
.headwrap{
height:85px;

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
<%List<BoardVO> result=(List<BoardVO>)request.getAttribute("imgpost"); %>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<input type="hidden" id="countpost"value="<%=result.size()%>">
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
	<br>
	<br>
	<h2><%=BoardVO.changeword((String)request.getAttribute("boardname"))%></h2>
	<%
	int i=0;
	for (BoardVO vo : result){ 
		
	
	%>
	
	<div class="verwrap" id="<%=i%>">
	  <div class="ver_2">
             <div class="main_area">
        <div class="headwrap">     
        	<div class="name_area">
        		<img src="/resources/profileimg/<%if(vo.getImagename()!=""){%><%=vo.getImagename()%><%}else{%>my_page.png<%}%>"/>
            	<h4><%=vo.getNickname() %></h4>
        	</div>
        	<div class="count">
        		<p>조회수 <%=vo.getBoardView()%></p>
        	</div>
       	</div> 	
		<div class="picturewrap">
        <div class="picture_area">
        	<%// 이미지 태그를 추출하기 위한 정규식.
        	Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
        	 
        	// 추출할 내용.
        	String content =vo.getContents();
        	 
        	// 내용 중에서 이미지 태그를 찾아라!
        	Matcher match = pattern.matcher(content);
        	 
        	String imgTag = null;
        	 
			
			while(match.find()){ // 이미지 태그를 찾았다면,,
   				 imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
   				 vo.setContents(vo.getContents().replace(imgTag, ""));
			}
        	  
        	    
        	 
        	
        	
        	%>
          <%=imgTag%>
        </div>
        </div>
		<!--텍스트 부분  -->
        <div class="text_area">
        	<div class="title_area"><p><%=vo.getTitle() %></p></div>
            <div class="date_area"><p><%=vo.getRegdate() %></p></div>
           <div class="text"><%=vo.getContents() %></div>
        </div>
        <div class="more">
        <a href="viewboard.do?b_boardname=<%=(String)request.getAttribute("boardname")%>&boardno=<%=vo.getBoardno()%>&nickname=<%=vo.getNickname()%>">자세히..</a>
        
        </div>
        
    </div>
      </div>
      </div>
      
      
      <%
      		i++;
		} 
		
		%>
     
      
      </section>


<div class="footerwrap">
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</div>

<script src="/resources/js/board/imgboard.js"></script>
</body>
</html>