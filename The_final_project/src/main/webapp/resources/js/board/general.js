$(document).ready(function () {
	//글쓰기 버튼을 클릭했을 때
	$('#writeboard').click(function(){
		var confirm=$('#confirmsession').val();
		if(confirm=="null"){
			alert("글쓰기는 로그인이 필요한 서비스 입니다.");
			window.location.href="login.do";
			return;
		}
		
		window.location.href="writeboard.do?b_boardname="+$('#boardname').val();
	})
	
});