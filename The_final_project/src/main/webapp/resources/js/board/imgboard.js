/**
 * 
 */

$(document).ready(function(){
	
	var page = 2;
	var countpost=$('#countpost').val()
	for (var i =2; i<=countpost; i++){
		$('#'+i).hide();
		
	}
	
	//스크롤이 바닥을 찍었을 때
    $(window).scroll(function() {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
         
        	$('#'+page).show();
        	page++;
        	
//          $(".verwrap").append('<div class="big-box"><h1>Page ' + page + '</h1></div>');
        	
        }
    });



	
	
	
	
})