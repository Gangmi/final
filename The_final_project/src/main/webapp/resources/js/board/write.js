$(document).ready(function() {
	//에디터 사용 부분
	CKEDITOR.replace('editor', {
		filebrowserUploadUrl : '/imageUpload.do?b_boardname='+$('#boardname').val(),
		
		height : '500px',
		//filebrowserImageUploadUrl : '/upload/ckeditor_upload.asp'

	});
	
	
});
