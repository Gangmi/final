$(document).ready(
		function(event) {

			// 글쓰기 버튼을 클릭했을 때
			$('#writeboard').click(
					function() {
						var confirm = $('#confirmsession').val();
						if (confirm == "null") {
							alert("글쓰기는 로그인이 필요한 서비스 입니다.");
							window.location.href = "login.do";
							return;
						}

						window.location.href = "writeboard.do?b_boardname="
								+ $('#boardname').val();
					})

			// 이름클릭시 드롭박스 보이기

			$('.dropbtn').click(function(evt) {

				i = $(this).next();
				$(this).next().show();
				

				// 드롭박스 숨김

			})

			// $('body').not('.nick').click(function(e){
			//	
			// alert();
			// $('#myDropdown').hide();
			//		
			// });
			   $(document).on('click', function(e) {
				   if (e.target.id === 'dropbt') {
					 
				   } else {
					   $('.dropdown-content').hide();
				   }

			   	})
			
			

			// 대화
			$('.oneonone').click(function() {
				
				requestChat($(this).next().val());
			})

			// 사진게시판을 눌렀을 때
			$('#goimgboard').click(
					function() {
						window.location.href = "/imgboard.do?b_boardname="
								+ $('#boardname').val();
					})

		});