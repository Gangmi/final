$(document).ready(function() {
	
	$("#commentInsertBtn").click(function(){
	    
	    $.ajax({
	        type:'POST',
	        url : "/writerepl.do",
	        data:$("#commentInsertForm").serialize(),
	        alert(data);
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	                $("#comment").val("");
	            }
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
	
	});
	function fn_comment(code){
	    
	    $.ajax({
	        type:'POST',
	        url : "/writerepl.do",
	        data:$("#commentInsertForm").serialize(),
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	                $("#comment").val("");
	            }
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
	}
	
});
