<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/general.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="resources/js/general.js"></script>
<%
	 BoardVO result = (BoardVO)request.getAttribute("board");
	
%>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="Board/side.jsp" />
	<div class="writeboardbox">

		<div class="row">

			<form method="post" action="write.do">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								읽기</th>
						</tr>

					</thead>

					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								 name="b_title" maxlength="220" value="<%=result.getTitle()%>"  /></td>

						</tr>

						<tr>

							<td><textarea class="form-control" 
									name="b_contents" maxlength="2048"
									style="height: 550px; width: 550px;"><%=result.getContents() %></textarea></td>

						</tr>

					</tbody>

				</table>

				<input type="submit" value="글쓰기" />

			</form>

		</div>

	</div>


	<div id="footer">
		<p>@COPYRIGHT_</p>
	</div>
<body />
</html>