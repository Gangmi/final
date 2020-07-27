$(document).ready(function () {
	$('#writeboard').click(function(){
		window.location.href="writeboard.do?b_boardname="+$('#boardname').val();
	})
	
});