<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
<link rel="stylesheet" href="resources/css/main_page.css">

</head>
<body>
	<!-- ChatBot 연동 script 삽입 -->
	<script id="embeddedChatbot" data-botId="Bdv56x" src="https://www.closer.ai/js/webchat.min.js"> </script>
	
	<div id="header">
        <section class="header">
            <a href="/index.jsp"><img src="resources/img/logo-2.png" alt="LOGO"></a>

            <ul class="header_menu">
                <li><a href="aboutus.do">소개</a></li>
                <li><a href="#">농장위치</a></li>
                <li><a href="sign_up.do">회원가입</a></li>
                <li><a href="login.do">로그인</a></li>
            </ul>
        </section>
    </div>

    <div id="main">
        <div class="main_img">
            <div class="main_text">
                <p>당신의 농장을 간편하게 관리하세요.</p>
            </div>
        </div>
        
<!--         <div id="talk">
            <div class="chat">
                <button>
                    <img src="resources/img/talk-1.png">
                </button>
            </div>
        </div>  -->
    </div> 

    <div id="menu">
        <section class="header">
            <div class="free">
                <button>
                    <img src="resources/img/free.png">
                </button>
                <p><a href="general.do">자유게시판</a></p>
            </div>

            <div class="tip">
                <button>
                    <img src="resources/img/tip.png">
                </button>
                <p><a href="#">Tip게시판</a></p>
            </div>

            <div class="share">
                <button>
                    <img src="resources/img/share.png">
                </button>
                <p><a href="#">분양게시판</a></p>
            </div>

            <div class="market">
                <button>
                    <img src="resources/img/market.png">
                </button>
                <p><a href="#">장터게시판</a></p>
            </div>

            <div class="farmer">
                <button>
                    <img src="resources/img/farmer.png">
                </button>
                <p><a href="#">농사 IN 게시판</a></p>
            </div>
        </section>
        
    </div>

    <div id="footer">
        <p>@COPYRIGHT_</p>
    </div>

</body>
</html>