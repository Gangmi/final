<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="./header.jsp"></jsp:include>
    <h1>농부 신청</h1>
    <textarea readonly="readonly">
    	파일을 첨부하실 때에는 주민등록번호를 필히 가려주시길 바랍니다.
    	농업 경영체 증명서를 첨부해주시길바랍니다.
    	
    </textarea>
    <form action="/farmerApplication.do" method="post" name="form" enctype="multipart/form-data">
        <table>
            <caption></caption>
            <colgroup>
            	<col>
            	<col width="100">
            </colgroup>
            <tr>
                <td>이름</td>
                <td><input type="text" name="farmerName" value="${sessionScope.memberinfo.name }"/></td>
            </tr>
            <tr>
            	<td>경작지 이름</td>
            	<td><input type="text" name="farmlandCorporationName"/></td>
           	</tr>
            <tr>
                <td>농장 연락처</td>
                <td><input type="tel" name="farmlandTel"/></td>
            </tr>
            <tr>
                <td>경작지 주소</td>
                <td><input type="text" name="farmlandAddress" readonly="readonly"><button id="find_postcode_btn" type="button">주소찾기</button></td>
               
            </tr>
            <tr>
                <td>농업경영체 등록번호</td>
                <td><input type="text" name="farmlandCorporationNumber"></td>
            </tr>
            <tr>
                <td>첨부파일</td>
                <td><input type="file" accept="application/pdf,image/*" name="file1"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="신청"> </td>
            </tr>
        </table>
         <input type="hidden" name="farmerId" value="${sessionScope.memberinfo.id }">
    </form>
   
    <jsp:include page="./footer.jsp"></jsp:include>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
		$(document).ready(function(){
			$('input[type="text"]').keydown(function(e){
				if (e.keyCode === 13) {
					    e.preventDefault();
				}  
			});
			$('input[type="tel"]').keydown(function(e){
				if (e.keyCode === 13) {
					    e.preventDefault();
				}
			});
			$('input[type="submit"]').click(function(e){
				e.preventDefault();
				if($('input[name="farmerName"]').val()==""){
					alert("이름을 작성해주세요.");
				}else if($('input[name="farmlandCorporationName"]').val()==""){
					alert("경작지 이름을 작성해주세요.");
				}else if($('input[name="farmlandTel"]').val()==""){
					alert("농장 연락처를 작성해주세요.");
				}else if($('input[name="farmlandAddress"]').val()==""){
					alert("경작지 주소를 작성해주세요.");
				}else if($('input[name="farmlandCorporationNumber"]').val()==""){
					alert("농업경영체 등록번호를 작성해주세요.");
				}else if(!$('input[name="file1"]').val()){
					alert("파일을 첨부해주세요.");
				}
				$("form[name='form']").submit();
			});



			$('#find_postcode_btn').click(function(){
				execDaumPostcode();
				});
			
			function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    //document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    //document.getElementById("sample6_extraAddress").value = '';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                
		                $('input[name="farmlandAddress"]').val(addr);
		                // 커서를 상세주소 필드로 이동한다.
		                $('input[name="farmlandAddress"]').focus();
		            }
		        }).open();
		    }
		});
    </script>
</body>
</html>