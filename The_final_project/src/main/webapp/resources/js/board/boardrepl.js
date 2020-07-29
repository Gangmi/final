$(document).ready(function() {
	getCommentList();
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
			success : function(data){
				var html =''; 
				var cCnt = data.length;
				
				if(data.length>0){
					for(i=0; i<data.length; i++){
						html+= "<div class='contain'>";
						html+="<div>"+data[i].nickname+"</div>";
						html+="<div>"+data[i].contents+"</div>";
						html+="<div>"+data[i].regdate+"</div>";
						html+="</div>";
						
							
					}
					
				}else{
					 html += "<div>";
		                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
		                html += "</table></div>";
		                html += "</div>";
				}
				$("#cCnt").html(cCnt);
	            $("#repl").html(html);
			},
			error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
		
		});
	}
	
});
	

	   
	    
	
	
	

