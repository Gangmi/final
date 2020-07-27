$(document).ready(function() {
	
	CKEDITOR.replace('editor', {
		filebrowserUploadUrl : '/imageUpload.do?b_boardname='+$('#boardname').val(),
		
		height : '500px',
		//filebrowserImageUploadUrl : '/upload/ckeditor_upload.asp'

	});
	
	$("#savebutton").click(function(){
		window.location.href="write.do?b_boardname=free_board"
	});

	
});
