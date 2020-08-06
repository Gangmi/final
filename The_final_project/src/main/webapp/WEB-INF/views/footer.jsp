<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 .request_msg{
            border-radius: 50px;
            height: 100%;
        }
        p{
            margin-top: 100px;
        }
    div.request_msg{
   margin: auto;
   height: 300px;
   width: 500px;
   position: fixed;
   text-align: center;
   right: 40px;
   top: 50%;
   background: #E6ECF6;
   z-index: 1000;
   opacity:0.8;
   box-shadow: 2px 2px 2px ;
   
}
  div.request_msg:hover{
   margin: auto;
   height: 300px;
   width: 500px;
   position: fixed;
   text-align: center;
   right: 40px;
   top: 50%;
   background: #E6ECF6;
   z-index: 1000;
   opacity:1;
   box-shadow: 2px 2px 2px ;
   
}
        .chat-btn{
            margin-top: 80px;
            width: 30%;
            height: 50px;
            
        }
</style>
</head>
<body>
	<footer class="footer-section">
		<div class="container">
			<div class="footer-text">
				<div class="row">
					<div class="col-lg-4">
						<div class="ft-about">
							<div class="logo">
								<a href="#"> <img src="/resources/img/mainlogo.png" alt="">
								</a>
							</div>
							
						</div>
					</div>
					<div class="col-lg-3 offset-lg-1">
						<div class="ft-contact">
							<h6>Contact Us</h6>
							<ul>
								<li>(12) 345 67890</li>
								<li>yeorumjigi@gmail.com</li>
								<li>서울시 금천구 가산동 426-5</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 offset-lg-1">
						<div class="ft-newslatter">
							<h6>New latest</h6>
							<p>구독을 통해 최신 업데이트 사항을 받아보실 수 있습니다.</p>
							<form action="#" class="fn-form">
								<input type="text" placeholder="Email">
								<button type="submit">
									<i class="fa fa-send"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="copyright-option">
			<div class="container">
				<div class="row">
					<div class="col-lg-7">
						<ul>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Terms of use</a></li>
							<li><a href="#">Privacy</a></li>
							<li><a href="#">Environmental Policy</a></li>
						</ul>
					</div>
					<div class="col-lg-5">
						<div class="co-text">
							<p>
								Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div> -->
		<div class="search-model">
			<div class="h-100 d-flex align-items-center justify-content-center">
				<div class="search-close-switch">
					<i class="icon_close"></i>
				</div>
				<form class="search-model-form">
					<input type="text" id="search-input" placeholder="Search here.....">
				</form>
			</div>
		</div>

	</footer>
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>
	<sec:authorize access="isAuthenticated()">
	<script type="text/javascript">
		var count = 0;
		var URL = "ws://192.168.0.50:8080/chat/"
		var webSocket = new WebSocket(URL+"${memberinfo.id}");
		console.log(webSocket);
		webSocket.onopen = function(e) {
            console.log(e);
          
        }
		webSocket.onclose = function(e) {
	    	if (e.type == "close") {
	        	console.log(e.type);
	        }
	    }

		webSocket.onmessage = function(e) {
			console.log(e.data);
			try{
				data=JSON.parse(e.data);
				if(data.cmd == 'request'){
					if(data.user.includes('${memberinfo.id}')){
						requestView(data.host,e.data);
					}else if (data.host=="${memberinfo.id}"){
						new_window(e.data);
					}
				}
			} catch(e){}
		}

		function disConn() {
	        webSocket.close();
	    }

		function requestChat(id){
			my = '${memberinfo.id}';
			if(my !="" && my=='${memberinfo.id}'){
				var data = new Object();
				data.cmd = "request";
				data.host = my;
				data.user = new Array();
				data.user.push(id);
				data.json = JSON.stringify(data);
				console.log(data.json);
				webSocket.send(data.json);
				
			}
		}
		
		function requestView(requestid,header){
			var div_ = $('<div>');
			var p_ = $('<p>');
			var form_ = $('<form>');
			var input_ = $('<input>');
			var button_ = $('<button>');
			var button1_ = $('<button>');

			button_.html('수락');
			button1_.html('거절');
			form_.attr({'method':'post','action':'chatroom.do','target':'chatroom'+count});
			button_.attr({'type':'submit','name':'accept'});
			button1_.attr({'type':'button',"name":'reject'});
			input_.attr({'type':'hidden','name':'chatHeader','value':header});
			div_.append(p_);
			div_.append(form_);
			form_.append(input_);
			form_.append(button_);
			form_.append(button1_);
			button_.click(function(){
				new_window($(this).siblings().eq(0).val());
				form_.submit();
				$(this).parent().parent().remove();
			});
			button1_.click(function(){
				$(this).parent().parent().remove();
			});
			
			
			div_.addClass("request_msg");
			button_.addClass("btn btn-success chat-btn");
			button1_.addClass("btn btn-success chat-btn");
			p_.html(requestid+" 님께서 1:1 대화를 요청하셨습니다.");
			$('body').append(div_);
			
		}
		function new_window(data){
			var form_ = $('<form>');
			var input_ = $('<input>');
			
			form_.attr({'method':'post','action':'chatroom.do','target':'chatroom'+count});
			input_.attr({'type':'hidden','name':'chatHeader','value':data});
			console.log(window.open('', 'chatroom'+(count++), 'width=530, height=535,toolbar=no,menubar=no,location=no,status=no,fullscreen=no'));
			form_.append(input_);
			$('body').append(form_);
			form_.submit();
			form_.remove();
		}

		
	</script>
	</sec:authorize>
</body>
</html>