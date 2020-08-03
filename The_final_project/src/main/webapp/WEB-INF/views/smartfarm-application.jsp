<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
 	<div>
        <div>
           <form action="/smart-farmApplication.do" method="post">
            <table>
                <tr>
                    <td>
                        <label for="id">신청자 ID</label>
                    </td>
                    <td>
                        <input type="text" readonly name="id" value="${sessionScope.memberinfo.id}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="phoneNumber">연락처</label>
                    </td>
                    <td>
                        <input type="text" name="phoneNumber" value="${sessionScope.memberinfo.phoneNumber }" readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="startDate">시작일</label>
                    </td>
                    <td><input type="date" name="startDate"></td>
                    <td>
                        <label for="dueDate">종료일</label>
                    </td>
                    <td><input type="date" name="dueDate"></td>
                </tr>
            </table>
            <textarea name="" id="" cols=70 rows="20" readonly></textarea>
            <br>
            <input type="submit" value="신청하기">
            <button type="button" name="cancel">취소하기</button>
            </form>
        </div>
    </div>
    <jsp:include page="./footer.jsp"/>
    <script type="text/javascript">
	$(document).ready(function(){
		$('input').keydown(function(e){
			if (e.keyCode === 13) {
			    e.preventDefault();
			};
		});

		$('input[type="submit"]').click(function(){
			if($('input[name="id"]').val()==""){
				alert("아이디가 비어있습니다.");
				return false;
			}else if($('input[name="phoneNumber"]').val()==""){
				alert("전화번호가 비어있습니다.");
				return false;
			}else if($('input[name="startDate"]').val()==""){
				alert("시작날짜를 작성하세요.");
				return false;
			}else if($('input[name="dueDate"]').val()==""){
				alert("종료날짜를 작성하세요.");
				return false;
			}
		});
		$('button[name="cancel"]').click(function(){
			history.back();
		})
	});
    </script>
</body>
</html>