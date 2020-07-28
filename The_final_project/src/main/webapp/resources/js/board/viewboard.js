$(document).ready(function() {
	

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
	
	//수정 버튼을 클릭했을 때
	$('#modifyboard').click(function(){
		//확인이 필요한 값 가져오기
		var boardname=$('#bname').val();
		var boardno=$('#boardno').val();
		alert(boardname+boardno)
		
		if($('#writer').val()==$('#confirmsession').val()){
			window.location.href="modifyboard.do?b_boardname="+boardname+"&boardno="+boardno;
		}else{
			alert("글수정은 작성자 id로만 가능합니다.");
			window.location.href="login.do";
			return;

		}
	});
	
	//삭제 버튼을 눌렀을 때
	$('#deleteboard').click(function(){
		//확인이 필요한 값 가져오기
		var boardname=$('#bname').val();
		var boardno=$('#boardno').val();
		
		window.location.href="deleteboard.do?b_boardname="+boardname+"&boardno="+boardno;
		
	});
	
});
