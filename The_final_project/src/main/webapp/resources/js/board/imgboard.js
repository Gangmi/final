/**
 * 
 */

$(document).ready(function(){
	var page = 1;
	//스크롤이 바닥을 찍었을 때
    $(window).scroll(function() {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
          var nowboard=
        	 $.ajax({
 		        type:'POST',
 		        url : "/getNextPost.do",
 		        
 		        success : function(data){		            
 		        	$("#repl").append(getCommentList());
 		             $("#comment").val("");
 		           
 		        },
 		        error:function(request,status,error){
 		            alert("로그인 후 이용 가능합니다.");
 		       }
 		        
 		    });
        	
        	
//          $(".verwrap").append('<div class="big-box"><h1>Page ' + page + '</h1></div>');
        	
        }
    });



	
	
	
	
})