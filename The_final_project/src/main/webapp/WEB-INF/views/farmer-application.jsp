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
    <form action="/test.do" method="post" name="form" enctype="multipart/form-data">
        <table>
            <caption></caption>
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
                <td><input type="text" name="farmlandAddress"></td>
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
                <td colspan="2"><input type="submit"> </td>
            </tr>
        </table>
         <input type="hidden" name="farmerId" value="${sessionScope.memberinfo.id }">
    </form>
   
    <jsp:include page="./footer.jsp"></jsp:include>
   
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
					
		});
    </script>
</body>
</html>