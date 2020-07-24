$(document).ready(function() {

	CKEDITOR.replace('editor', {
		filebrowserUploadUrl : 'fileupload.do',
		width : '800px',
		height : '500px',
		filebrowserImageUploadUrl : '/upload/ckeditor_upload.asp'

	});

});
