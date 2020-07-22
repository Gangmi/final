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
	String boardname = (String) request.getAttribute("b_boardname");
%>
<title><%=boardname%></title>
<script src="resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<jsp:include page="Board/header.jsp" />
	<jsp:include page="Board/side.jsp" />
	<div>
		<textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
			<script>
				var ckeditor_config = {
					resize_enaleb : false,
					enterMode : CKEDITOR.ENTER_BR,
					shiftEnterMode : CKEDITOR.ENTER_P,
					filebrowserUploadUrl : "/admin/goods/ckUpload"
				};

				CKEDITOR.replace("gdsDes", ckeditor_config);
			</script>
		
	</div>


	

	<div id="footer">
		<p>@COPYRIGHT_</p>
	</div>
<body />
</html>