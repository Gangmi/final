$(document).ready(function() {
	getCommentList();
	//댓글 입력을 누르면
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
	$(document).on("click",".delRepl",function(evt){
	//$('#79').on('click', function(){
		//보드이름에 따른 댓글 디비를 저장할 변수
		
		var b_boardname = $('input[name=b_boardname]').val();
		//게시판 이름에 맞는 댓글 디비의 이름을 넣는다.
		if(b_boardname=="free_board"){
			b_boardname="free_repl";
		}
		if(b_boardname=="tip_board"){
			b_boardname="tip_repl";
		}
		if(b_boardname=="parcel_board"){
			b_boardname="parcel_repl";
		}
		alert(b_boardname);
		alert($(this).attr('id'));
		$.ajax({
			type:'POST',
			url:'/delrepl.do',
			data:"b_boardname="+b_boardname+"&replno="+$(this).attr('id'),
			success : function(data){
				$("#repl").append(getCommentList());
			},
			error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
		});
	});
	
	//댓글 목록 불러오기
	function getCommentList(){
		$.ajax({
			type:'POST',
			url : "/viewrepl.do",
			data:$('#commentInsertForm').serialize(),
			success : function(data){
				var html =''; 
				var cCnt = data.length;
				
				
				
				if(data.length>0){
					for(i=0; i<data.length; i++){
						html+= "<div class='contain'>";
						html+="<div>"+data[i].nickname+"<div class='dropdown'><span class='replmodify dropdown-toggle' data-toggle='dropdown' aria-expanded='true'/>";
						html+='<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">';
						html+='<li role="presentation"><a role="menuitem" tabindex="-1" >수정</a></li>';
//						html+='<li role="presentation" class="delRepl" id='+data[i].replno+'>삭제</li></ul></div></div>';
						html+='<li role="presentation"><a role="menuitem" tabindex="-1" class="delRepl" id='+data[i].replno+' >삭제</a></li></ul></div></div>';
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
	

	   
	    
	
	
	

