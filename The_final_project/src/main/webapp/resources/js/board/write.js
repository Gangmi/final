$(document).ready(function() {

	CKEDITOR.replace('editor', {
		filebrowserUploadUrl : '/imageUpload.do',
		
		height : '500px',
		//filebrowserImageUploadUrl : '/upload/ckeditor_upload.asp'

	});
	
	$("#savebutton").click(function(){
		window.location.href="write.do?b_boardname=free_board"
	});

	
});
