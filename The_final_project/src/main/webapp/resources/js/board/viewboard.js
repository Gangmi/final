$(document).ready(function() {
	

	//글쓰기 버튼을 클릭했을 때
	$('#writeboard').click(function(){
		var confirm=$('#confirmsession').val();
		alert(confirm);
		if(confirm==""){
			alert("글쓰기는 로그인이 필요한 서비스 입니다.");
			window.location.href="login.do";
			return;
		}
		//현재 머물고 있는 게시판의 이름과 함께 전달
		window.location.href="writeboard.do?b_boardname="+$('#bname').val();
	})
	
	//수정 버튼을 클릭했을 때
	$('#modifyboard').click(function(){
		//확인이 필요한 값 가져오기
		var boardname=$('#bname').val();
		var boardno=$('#boardno').val();
		
		
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
	
	// 좋아요를 클릭했을 때
	$('.fa-thumbs-up').click(function(){
		
		var boardname=$('#bname').val();
		var boardno=$('#boardno').val();
		var nowid=$('#confirmsession').val();
		
		
		
		if(nowid==""){
			alert("좋아요는 로그인이 필요한 서비스 입니다.");
			
			return;
		}
		
		
		
		$.ajax({ 
			type: "post", 
			url: "/likebad.do?b_boardname="+boardname+"&boardno="+boardno+"&confirmnum=1"+"&id="+nowid, 
			
			success: function(data) { 
				if(data=="success"){
					alert("좋아요를 누르셨습니다.")
					$('#countlike').text(($('#countlike').text()*1)+1)
					
					}else{
					alert("이미 좋아요/싫어요를 누르셨습니다.")
					}
				}  
			});

		
//		window.location.href="bad.do?b_boardname="+boardname+"&boardno="+boardno;
	})
	
	
	
	
	$('.fa-thumbs-down').click(function(){
	
		var boardname=$('#bname').val();
		var boardno=$('#boardno').val();
		var nowid=$('#confirmsession').val();
		
		
		
		if(nowid==""){
			alert("싫어요는 로그인이 필요한 서비스 입니다.");
			
			return;
		}
		
		
		
		$.ajax({ 
			type: "post", 
			url: "/likebad.do?b_boardname="+boardname+"&boardno="+boardno+"&confirmnum=2"+"&id="+nowid, 
			
			success: function(data) { 
				if(data=="success"){
					alert("싫어요를 누르셨습니다.")
						
					$('#countbad').text(($('#countbad').text()*1)+1)
					}else{
					alert("이미 좋아요/싫어요를 누르셨습니다.")
					}
				}  
			});

		
//		window.location.href="bad.do?b_boardname="+boardname+"&boardno="+boardno;
	})
	
	
	
});
