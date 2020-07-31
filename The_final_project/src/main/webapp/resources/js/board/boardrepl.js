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
	
	//댓글 삭제버튼 누르면 삭제하기
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
		//아이디에서 글자에서 숫자만 추출한다.
		var string = $(this).attr('id');
		var no=string.replace(/[^0-9]/g,'');

		$.ajax({
			type:'POST',
			url:'/delrepl.do',
			data:"b_boardname="+b_boardname+"&replno="+no,
			success : function(data){
				$("#repl").append(getCommentList());
			},
			error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
		});
	});
	
	
	//수정 버튼을 눌렀을때
	$(document).on("click",".modifyRepl",function(evt){
			//보드이름에 따른 댓글 디비를 저장할 변수
		
			var b_boardname = $('input[name=b_boardname]').val();
			
			//아이디에서 글자에서 숫자만 추출한다.
			var string = $(this).attr('id');
			var no=string.replace(/[^0-9]/g,'');
			
			getModifyRepl(b_boardname,no);

		});
	
	//수정 버튼을 누르면 나오는 html
	function getModifyRepl(b_boardname,replno){
		var html ='';
		var repl = $("#"+replno).children('.repl').text();
			
		$.ajax({
			type:'POST',
			url : "/getrepl.do",
			data:"b_boardname="+b_boardname+"&replno="+replno,
			dataType:"JSON",
			success : function(data){
				var html="";
				
				html+="        <div class='contain comment-widgets' id="+data.replno+">";
				html+="            <!-- Comment Row -->";
				html+="            <div class='d-flex flex-row comment-row m-t-0'>";
				html+="                <div class='p-2'><img src='https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583336/AAA/4.jpg' alt='user' width='40' class='rounded-circle'></div>";
				html+="                <div class='comment-text w-100'>";
				html+="                    <p class='nickname' >"+data.nickname+"</p> ";
				html+=" 						<textarea id=repl"+data.replno+" class='form-control ml-1 shadow-none textarea'></textarea>";
				html+="                    <div class='comment-footer'> <button type='button' class='storeReplModify btn btn-cyan btn-sm'>저장</button> <button type='button' class='cancleReplModify btn btn-cyan btn-sm'>취소</button></div>";
				html+="                </div>";
				html+="            </div> <!-- Comment Row --> ";              
				html+="        </div> <!-- Card -->";
				
			$("#"+replno).html(html);
			}
		});
	}
	
	//수정에서 저장버튼을 누르면
	$(document).on("click",".storeReplModify",function(evt){
		//$('#79').on('click', function(){
			//보드이름에 따른 댓글 디비를 저장할 변수
		
			var b_boardname = $('input[name=b_boardname]').val();
			
			if(b_boardname=="free_board"){
				b_boardname="free_repl";
			}
			if(b_boardname=="tip_board"){
				b_boardname="tip_repl";
			}
			if(b_boardname=="parcel_board"){
				b_boardname="parcel_repl";
			}
			
			//아이디에서 글자에서 숫자만 추출한다.
			var string = $(this).parents().parents().parents().parents().attr('id');
			var replno=string.replace(/[^0-9]/g,'');			

			getModifyRepl(b_boardname,replno);
			var contents = $("#repl"+replno).val();
			
			$.ajax({
				type:'POST',
				url:'/modifyrepl.do',
				data:"b_boardname="+b_boardname+"&replno="+replno+"&contents="+contents,
				success : function(data){
					$("#repl").append(getCommentList());

				},
				error:function(request,status,error){
					alert("공백은 저장이 불가 합니다.");
		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
			});
		});
	//취소
	$(document).on("click",".cancleReplModify",function(evt){
		var b_boardname = $('input[name=b_boardname]').val();
		
		//아이디에서 글자에서 숫자만 추출한다.
		var string =$(this).parents().parents().parents().parents().parents().attr('id');
		var replno=string.replace(/[^0-9]/g,'');
		
		$.ajax({
			type:'POST',
			url : "/getrepl.do",
			data:"b_boardname="+b_boardname+"&replno="+replno,
			dataType:"JSON",
			success : function(data){
				var html="";
				html+="        <div class='contain comment-widgets' id="+data.replno+">";
				html+="            <!-- Comment Row -->";
				html+="            <div class='d-flex flex-row comment-row m-t-0'>";
				html+="                <div class='p-2'><img src='https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583336/AAA/4.jpg' alt='user' width='40' class='rounded-circle'></div>";
				html+="                <div class='comment-text w-100'>";
				html+="                    <p class='nickname' >"+data.nickname+"</p> <span class='m-b-15 d-block'>"+data.contents+" </span>";
				html+="                    <div class='comment-footer'> <span class='text-muted float-right'>"+data.regdate+"</span> <button type='button' id=modify"+data.replno+" class='modifyRepl btn btn-cyan btn-sm'>수정</button> <button type='button' id=del"+data.replno+" class='delRepl btn btn-cyan btn-sm'>삭제</button></div>";
				html+="                </div>";
				html+="            </div> <!-- Comment Row --> ";              
				html+="        </div> <!-- Card -->";
				
			
			$("#"+replno).html(html);
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

						html+="        <div class='contain comment-widgets' id="+data[i].replno+">";
						html+="            <!-- Comment Row -->";
						html+="            <div class='d-flex flex-row comment-row m-t-0'>";
						html+="                <div class='p-2'><img src='https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583336/AAA/4.jpg' alt='user' width='40' class='rounded-circle'></div>";
						html+="                <div class='comment-text w-100'>";
						html+="                    <p class='nickname' >"+data[i].nickname+"</p> <span class='m-b-15 d-block'>"+data[i].contents+" </span>";
						html+="                    <div class='comment-footer'> <span class='text-muted float-right'>"+data[i].regdate+"</span><%if userid == '"+data[i]+"' <button type='button' id=modify"+data[i].replno+" class='modifyRepl btn btn-cyan btn-sm'>수정</button> <button type='button' id=del"+data[i].replno+" class='delRepl btn btn-cyan btn-sm'>삭제</button></div>";
						html+="                </div>";
						html+="            </div> <!-- Comment Row --> ";              
						html+="        </div> <!-- Card -->";

					
						
					}
					
				}else{
					html+="        <div class='comment-widgets' >";
					html+="            <!-- Comment Row -->";
					html+="            <div class='d-flex flex-row comment-row m-t-0'>";
					html+="                <div class='p-2'><img src='https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583336/AAA/4.jpg' alt='user' width='40' class='rounded-circle'></div>";
					html+="                <div class='comment-text w-100'>";
					html+="                    <h6 class='nickname font-medium'></h6> <span class='m-b-15 d-block'>등록된 댓글이 없습니다.</span>";
					html+="                    <div class='comment-footer'> <span class='text-muted float-right'></span>";
					html+="                </div>";
					html+="            </div> <!-- Comment Row --> ";              
					html+="        </div> <!-- Card -->"; 
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
	

	   
	    
	
	
	

