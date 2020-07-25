$(document).ready(function() {

	CKEDITOR.replace('editor', {
		filebrowserUploadUrl : 'fileupload.do',
		
		height : '500px',
		filebrowserImageUploadUrl : '/upload/ckeditor_upload.asp'

	});

});
