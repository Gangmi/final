$(document).ready(function () {
	//답변창 안보이기
	$('#dapgul').hide();
		//감추기 버튼 누르면 답변창 감추기
		$('#hideBtn').click(function(){
			$('#dapgul').hide();
			$('#openBtn').show();
			});
		//답변하기 버튼 누르면 답변창 보이기
		$('#openBtn').click(function(){
			$('#dapgul').show();
			$('#openBtn').hide();
			});
});