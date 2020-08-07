$(document).ready(function () {
	//답변창 안보이기
	$('.main_box').hide();
		//답변저장 버튼 누르면 답변창 감추기
		$('#answer').click(function(){
			if($('#confirmsession').val()!=null){
				$('.main_box').show();
			}else{
				alert("로그인 후 입력 가능합니다.");
			}
			
			});
		//답변하기 버튼 누르면 답변창 보이기
		$('#savebutton').click(function(){

			$('.main_box').hide();
			});
		$('#cancelwriteAnswer').click(function(){
			$('.main_box').hide();
		});
		//답글수정을 누르면
		$('.cke_editable').click(function(){
			alert("11");
		});
		
		//수정버튼 누르면
		$('.modifyAnswer').on("click",function(){
			var string=$(this).attr("id");
			var replno=string.replace(/[^0-9]/g,'');
			var boardno = $("#boardno").val();
			var boardname=$('#bname').val();
			$("#"+replno).hide();
			
			var contents = $('#contents'+replno+' p').html();
			//수정을 누른 것의 내용을 찍어준다.
			$('.cke_wysiwyg_frame').contents().find('p').html($('#contents'+replno+' p').html());//홀리 쓋
			$('#replno').val(replno);
			$('#frm').attr("action","/updateAnswer.do");
			$('#replno').attr("value",replno);
			$(".main_box").show();
		});
		
		//답글삭제를 누르면
		$('.delAnswer').click(function(){
			var string=$(this).attr("id");
			var replno=string.replace(/[^0-9]/g,'');
			var boardno = $("#boardno").val();
			var boardname=$('#bname').val();
			window.location.href="deleteAnswer.do?b_boardname="+boardname+"&boardno="+boardno+"&replno="+replno;

		});
		
		//저장버튼을 누르면 수정하던 거 보이게 하기
		$('#store').on("click",function(){
			$("#"+replno).show();
		});
		
		$('.answer').on("click",function(){
			var string=$(this).attr("id");
			var replno=string.replace(/[^0-9]/g,'');
			var boardno = $("#boardno").val();
			var boardname=$('#bname').val();
			window.location.href="updateCheteck.do?b_boardname=nongsain&replno="+replno+"&boardno="+boardno;
		});
		
		$('.cancleCheteck').on("click",function(){
			var string=$(this).attr("id");
			var replno=string.replace(/[^0-9]/g,'');
			var boardno = $("#boardno").val();
			var boardname=$('#bname').val();
			var nic = $('#nick').val();
			window.location.href="cancleCheteck.do?b_boardname=nongsain&replno="+replno+"&boardno="+boardno+"&nickname="+nic;
		});
		
});