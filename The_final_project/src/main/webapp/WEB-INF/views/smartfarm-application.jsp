<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kos.vo.SmartFarmApplicationVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/Smart-Farm/smartfarm-appli.css">
<meta charset="UTF-8">
<title>스마트팜 신청 관리</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
<div class="main">
  <div class="contents">
 	<div>
        <div>
           <form action="/smart-farmApplication.do" method="post">
           <h3 class="bottom-20">스마트팜 신청 관리</h3>
            <table>
                <tr>
                    <td>
                        <label for="id">신청자 ID</label>
                    </td>
                    <td>
                        <input type="text" class="form-control" readonly name="id" value="${sessionScope.memberinfo.id}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label  for="phoneNumber">연락처</label>
                    </td>
                    <td>
                        <input class="form-control" type="text" name="phoneNumber" value="${sessionScope.memberinfo.phoneNumber }" readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="startDate">시작일</label>
                    </td>
                     <td><input class="form-control" type="date" name="startDate"></td>
                    <td>
                        <label for="dueDate">종료일</label>
                    </td>
                    <td><input class="form-control" type="date" name="dueDate"></td>
                </tr>
            </table>
            <table class="table table-hover">
             <tr>
                    <th>
                        <p>번호</p>
                    </th>
                    <th>
                        <p>아이디</p>
                    </th>
                    <th>
                        <p>신청일</p>
                    </th>
                    <th>
                        <p>시작일</p>
                    </th>
                    <th>
                        <p>종료일</p>
                    </th>
                    <th>
                        <p>승인일</p>
                    </th>
                </tr>
           <%
               //데이터 받아와서 for문 돌리기
               if ((List<SmartFarmApplicationVO>)request.getAttribute("result") != null) {
            	   List<SmartFarmApplicationVO> result = (List<SmartFarmApplicationVO>)request.getAttribute("result");
				
              
               for(SmartFarmApplicationVO vo : result) {%>
               <tr>
	                <td>
	                	<%=vo.getNo()%>
	                </td>
	                <td>
	                	<%=vo.getId() %>
	                </td>
	                <td>
	                  	<%=vo.getApplyDate() %>
	                </td>
	                <td>
	                  	<%=vo.getDueDate() %>
	                </td>
	                <td>
	                  	<%=vo.getStartDate() %>
	                </td>
	                <td>
	                	<%if(vo.getApproveDate()==null){ %>
	                	미승인
	                	<%}else{ %>
	                  	<%=vo.getApproveDate() %>
	                  	<%}%>
	                </td>
               </tr>
               <%} 
               }%> 
	 		</table>
           <!--  <textarea  class="form-control" name="" id="" cols=70 rows="20" readonly></textarea> -->
            <br>
            <input type="submit" class="btn btn-success" value="신청하기">
            <button type="button" class="btn btn-danger" name="cancel">취소하기</button>
            </form>
        </div>
    </div>
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