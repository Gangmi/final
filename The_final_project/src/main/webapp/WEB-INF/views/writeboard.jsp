<%@page import="com.kos.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/css/general.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="resources/js/general.js"></script>
<%
	String boardname=(String)request.getAttribute("b_boardname");
%>
<title><%=boardname %></title>
</head>
<body>
	<jsp:include page="Board/header.jsp" />
	<jsp:include page="Board/side.jsp" />
	<div class="writeboardbox">

		<div class="row">

			<form method="post" action="write.do">
			<input type="hidden" name="b_boardname" value="<%=boardname%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>

					</thead>

					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="b_title" maxlength="220" /></td>

						</tr>

						<tr>

							<td><textarea class="form-control" placeholder="글 내용"
									name="b_contents" maxlength="2048" style="height: 550px; width: 550px;"></textarea></td>

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