<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.vertical-menu {
  	width: 150px;
	
	float:right;
/*  	right: 100px; */
  	margin-right: 3%;
  	margin-top: 100px;
}

.vertical-menu a {
  background-color: #eee;
  color: black;
  display: block;
  padding: 12px;
  text-decoration: none;
}

.vertical-menu a:hover {
  background-color: #ccc;
}

.vertical-menu a.active {
  background-color: #4CAF50;
  color: white;
}
.vertical-menu ul{
    list-style:none;
}

@media screen and (max-width:1075px){
	.vertical-menu ul{
		visibility: hidden;
		} 
}
</style>
</head>
<body>	
    <div class=" vertical-menu">
        <ul>
            <li><a href="/updateAccount.do">회원 정보 수정</a></li>
            <li><a href="/farmer-application.do">농부 권한 신청</a></li>
            <li><a href="/smartfarm-application.do">스마트 팜 신청</a></li>
        </ul>
    </div>
</body>
</html>