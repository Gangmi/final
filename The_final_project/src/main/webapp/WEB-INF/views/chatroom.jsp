<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    html ,body{
        width: 100%;
        height: 100vh;
        margin: 0;
    }
	body{
		background: #aabfd0;
	}
	.chat-container{
	    text-align: center;
	    height: 100%;
	}
	.chat-title{
	   
	    font-weight: bolder;
	}
	.chat-msg{
	    width: 100%;
	    min-height: 67%;
	    max-height: 67%;
	    display: block;
	}
	.chat-msg .send{
	    float:left;
	    text-align: left;
	    background: #ffe403;
	    height: auto;
	    min-height: 50px;
	    min-width: 30%;
	    border-radius: 5px;
	    margin: 10px 5px 0px 5px;
	    padding: 3px 6px;
	}
	.chat-msg .receive{
	    float:right;
	    text-align: left;
	    background: white;
	    height: auto;
	    min-height: 50px;
	    min-width: 30%;
	    border-radius: 5px;
	    margin: 10px 5px 0px 5px;
	    padding: 3px 6px;
	}    
	.chat-send-container{
	    height: 25%;     
	    margin: 0;
	    padding-left: 5px;
	    bottom: 5px;
	    left: 5px;
	    width: 100%;
	}
	
	.chat-send-container textarea{
	    display: inline;
	    resize: none;
	    float: left;
	    width: 75%;
	    height: 97.5%;
	    border-radius: 10px
	  
	}
    .btn-send{
        margin-left: 5px;
        float: left;
        width: 19.5%;
        height: 100%;
        border-radius: 10px;
    }
    .width100{
        width: 100%;
        min-height: 80px;
    }
    .chat-id{
    	text-align: left;
        font-weight: bold;
    }
    .chat-system{
    	margin-top: 10px;
    	margin-bottom:10px;
    	width: 100%;
    }
</style>
</head>
<body>
<div class="chat-container">
	<div class="chat-title">
    <span id="userid"></span>
	</div>
	<hr>
	<div class="chat-msg" id="chat-msg">
        
	</div>
	<div class="chat-send-container">
        
            <textarea id="msg" cols="30" rows="10"></textarea>
            <button class="btn-send" id="send_msg">전송</button>
        
	</div>
</div>

<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	var URL = "ws://192.168.0.11:8080/chatroom/";
	var webSocket = new WebSocket(URL+"${memberinfo.id}");
	console.log(webSocket);
	webSocket.onopen = function(e) {
        console.log(e);
        $('#userid').html("${memberinfo.id}");
        sendHello('${memberinfo.id}');
    }
	webSocket.onclose = function(e) {
		sendMsg('sad');
    	if (e.type == "close") {
        	console.log(e.type);
        }
    }

	webSocket.onmessage = function(e) {
		console.log(e);
		myid='${memberinfo.id}';
		try{
			data=JSON.parse(e.data);
			if(data.header.cmd =="message"){
				if(data.header.sender == myid){
					var div_ = $('<div>');
					var div1_ = $('<div>');
					var pre_ = $('<pre>');
					var div2_ =$('<div>');
					div_.addClass('width100');
					div1_.addClass('receive');
					div2_.html(data.header.sender);
					div1_.append(div2_);
						
					div2_.addClass('chat-id');
					pre_.html(data.body.msg);
					div1_.append(pre_);
					div_.append(div1_);
					$('#chat-msg').append(div_);
					$('html, body').scrollTop(document.body.scrollHeight);
				}else{
					var div_ = $('<div>');
					var div1_ = $('<div>');
					var pre_ = $('<pre>');
					var div2_ =$('<div>');
					div_.addClass('width100');
					div1_.addClass('send');
					div2_.html(data.header.sender);
					div1_.append(div2_);
					div2_.addClass('chat-id');
					pre_.html(data.body.msg);
					div1_.append(pre_);
					div_.append(div1_);
					$('#chat-msg').append(div_);
					$('html, body').scrollTop(document.body.scrollHeight);
				}
				
			}else if(data.header.cmd=="system"){
				var div_ = $('<div>');
				div_.addClass('chat-system');
				div_.html(data.body.msg);
				$('#chat-msg').append(div_);
				$('html, body').scrollTop(document.body.scrollHeight);
			}else if(data.header.cmd=="close"){
				var div_ = $('<div>');
				div_.addClass('chat-system');
				div_.html(data.body.msg);
				$('#chat-msg').append(div_);
				$('html, body').scrollTop(document.body.scrollHeight);
			}
		}catch(e){}
	}
	$('#send_msg').click(function(){
		sendMsg($('#msg').val());
		$('#msg').val("");
	});
	$('#msg').keydown(function(event){
		if( event.which === 13 && event.shiftKey) {
			$('#msg').val($('#msg').val()+"\n");
			event.preventDefault();
		}else if( event.which === 13) {
			sendMsg($('#msg').val());
			event.preventDefault();
			$('#msg').val("");
		}	
	});
	function sendMsg(msg){
		var data_ = new Object();
		var body_= new Object();
		var header_ = new Object();
		header_ = JSON.parse('${users}');
		header_.cmd = "message";
		header_.sender = "${memberinfo.id}";
		data_.header = header_;
		data_.body = body_;
		body_.msg = msg;
		console.log(JSON.stringify(data_));
		webSocket.send(JSON.stringify(data_));
	}
	function sendHello(id){
		var data_ = new Object();
		var body_= new Object();
		var header_ = new Object();
		header_ = JSON.parse('${users}');
		header_.cmd = "system";
		header_.sender = "${memberinfo.id}";
		data_.header = header_;
		data_.body = body_;
		body_.msg = id + '님이 접속하셨습니다.';
		console.log(JSON.stringify(data_));
		webSocket.send(JSON.stringify(data_));
	}
	function sendBye(id){
		var data_ = new Object();
		var body_= new Object();
		var header_ = new Object();
		header_ = JSON.parse('${users}');
		header_.cmd = "system";
		header_.sender = "${memberinfo.id}";
		data_.header = header_;
		data_.body = body_;
		body_.msg = id + '님이 종료하셨습니다.';
		console.log(JSON.stringify(data_));
		webSocket.send(JSON.stringify(data_));
	}
	







</script>
</body>
</html>