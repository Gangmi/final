$(document).ready(function () {
	//답변창 안보이기
	$('.main_box').hide();
		//감추기 버튼 누르면 답변창 감추기
		$('#answer').click(function(){
			$('.main_box').show();
			});
		//답변하기 버튼 누르면 답변창 보이기
		$('#savebutton').click(function(){
			$('.main_box').hide();
			});
		
		
});