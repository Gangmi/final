$(document).ready(function() {
	$("#repl").append(getCommentList());
	$("#commentInsertBtn").click(function(){
		 $.ajax({
		        type:'POST',
		        url : "/writerepl.do",
		        data:$('#commentInsertForm').serialize(),
		        success : function(data){		            
		        	$("#repl").append(getCommentList());
		             $("#comment").val("");
		           
		        },
		        error:function(request,status,error){
		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		        
		    });
		    
	});
	
	function getCommentList(){
		$.ajax({
			type:'GET',
			url : "/viewrepl.do",
			data:$('#commentInsertForm').serialize(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			success : function(data){
				var html =''; 
				var cCnt = data.length;
				alert(data);
				
				if(data.length>0){
					for(i=0; i<data.length; i++){
						html+= "<div>";
						html+="<div>"+data[i];
						html+="<div>";
						html+="<div>";
						
							
					}
					
				}else{
					 html += "<div>";
		                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
		                html += "</table></div>";
		                html += "</div>";
				}
				$("#cCnt").html(cCnt);
	            $("#commentList").html(html);
			},
			error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
		
		});
	}
	
});
	

	   
	    
	
	
	

