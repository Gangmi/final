<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


        
        section{
        	height: 500px;
        	
        
        }
        * {
            margin: 0;
            padding: 0;
        }



        .main_btn img {
            display: block;
            border: none;
            width:80%;
            height: 80%;
           margin: 0 auto;
        }

	/* 각버튼 float설정  */
        .free {
            float: left;
        }
        .tip {
            float: left;
        }
        .share {
            float: left;
        }
        .market {
            float: left;
        }
        
        
        
        /*항목 전체 div  */
        .main_btn{
        margin-top: 100px;
       
        }

       .main_btn div{
       
       text-align: center;
       margin-left: 135px;
       }
       
       .main_btn div p{
       font-size: 25px;
       
       }
        
        
        .main_btn button{
        
        width: 300px;
        height: 300px;
        border-radius: 150px;
        background-color: white;
        
       	
        }
        .main_btn a{
        color: black;
        
        }
        .main_btn a:hover{
        color: black;
        text-decoration: underline;
        }

        
       /*마이페이지 써있는 공간  */ 
      .my-page{
      	margin-top: 50px;
     	text-align: center;
     	margin-right: 10px;
      
      }
      @media only screen and (max-width: 800px){
      .my-page{
      	margin-top: 50px;
     	margin-left: 20px;
      
      }	
      }
     
        
        
    </style>
</head>
<body>
	<jsp:include page="./header.jsp"/>
<%-- 	<jsp:include page="./side.jsp"/> --%>
	   
        <div class="my-page">
        	<h3>마이페이지</h3>
        </div>
        <section class="main_btn">
       
        
            <div class="free">
                <button>
                    <img src="/resources/old/img/free_grey.png" alt="free">
                </button>
                <p><a href="/updateAccount.do">회원 정보 수정</a></p>
            </div>

            <div class="tip">
                <button>
                    <img src="/resources/old/img/tip_grey.png" alt="tip">
                </button>
                <p><a href="/farmer-application.do">농부신청 관리</a></p>
            </div>

            <div class="share">
                <button>
                    <img src="/resources/old/img/share_grey.png" alt="share">
                </button>
                <p><a href="#">스마트팜 신청 관리</a></p>
            </div>

            <div class="market">
                <button>
                    <img src="/resources/old/img/market_grey.png" alt="market">
                </button>
                <p><a href="#">내가쓴 글 보기</a></p>
            </div>

          
           
        </section>
    
<jsp:include page="./footer.jsp"/>
</body>
</html>