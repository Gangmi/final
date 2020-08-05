$(document).ready(function() {
	//에디터 사용 부분
	CKEDITOR.replace('editor', {
		filebrowserUploadUrl : '/imageUpload.do?boardname='+$('#form-boarname').val(),
		
		height : '500px',
		//filebrowserImageUploadUrl : '/upload/ckeditor_upload.asp'

	});
	
	//사용자가 글쓸 게시판을 선택하려고 눌렀을 때
	$('#boardselect').change(function(){
		//선택된 게시판의 값을 가져옴
		var selected=$('#boardselect option:selected').val();
		// 선택한 값을 폼 안의 hidden input 에 추가
		$('#form-boarname').val(selected);
		
		
	})
	
});
