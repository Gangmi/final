<%@page import="com.kos.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style type="text/css">



/*전체 폼을 감싸는div  */
.formdiv{
text-align: center;
margin-top: 50px;
height: 1200px;

}
/*회원 정보 수정 텍스트  */
.formdiv h3{

margin-bottom: 50px;

}

/* 전체 인풋 컨트롤  */
.formdiv input{
width: 20%;
margin: 0 auto;
}
#find_postcode_btn{
margin-right: 13%;
margin-bottom: 30px;
margin-top: 10px;

}
#modifyinfo{
margin-top: 10px;

}


@media (max-width:1024px){
	.formdiv input{
	width: 70%;
	margin: 0 auto;
	}
	
	#find_postcode_btn{
	margin-right: 60%;
	margin-bottom: 30px;
	margin-top: 10px;

}
	
	
}


.nowimg img{

width: 80px;
height: 80px;
border: 1px solid black;

}
.updateprofile{
display:block;

margin-top: 10px;
margin-bottom: 30px;

}
.updateprofile input{
margin-top: 20px;

}

#updateAccount{


}




</style>
<%String profile=(String)session.getAttribute("profileimg"); %>
<%MemberVO vo=(MemberVO)session.getAttribute("memberinfo"); %>
</head>
<body>
	<jsp:include page="./header.jsp"/>
	
	<div class="formdiv">
	<h3>회원정보 수정</h3>

	
	<div class="updateprofile">
	<span>현재 프로필사진</span>
	
	<div class="nowimg">
	<img src="\resources\profileimg\<%if(profile!=""){ %><%=profile%><%}else{%>my_page.png<%}%>">
	
	</div>
	
	 <form method="post" action="/profile-up.do" enctype="multipart/form-data">
         <label>이미지 파일:</label>
         <div>
         <input multiple="multiple" type="file" name="upload">
         <input type="hidden" name="id" value="<%=vo.getId()%>">
         </div>
         <div>
         <input class="btn btn-info" type="submit" value="업로드하기">
         </div>
  	</form>
	</div>
	

	<form id="updateAccount" name="updateAccount" action="updateAccount_act.do"
		method="post">
		<div>
			<div>
				
				<input type="text" name="name" id="fullName" 
					value="${sessionScope.memberinfo.name }" 
					placeholder="*이름" class="form-control">
			</div>
			<sup id="name_check">&nbsp;</sup>
			<div>
			
				<input type="text" name="id" id="id" 
					value="${sessionScope.memberinfo.id }" 
					placeholder="*아이디" readonly="readonly" class="form-control">
			</div>
			<sup id="id_check">&nbsp;</sup>
			<div>
			
				<input type="text" name='nickname' id="nickName" 
					value="${sessionScope.memberinfo.nickname }" 
					placeholder="*닉네임" class="form-control">
			</div>
			<sup id="nick_check">&nbsp;</sup>
			<div>
			
				<input id="now-password" type="password" name="password" placeholder="현재 비밀번호" class="form-control">
			</div>
			<br>
			<div>
			
				<input type="password" name="updatepassword" id="password"
					placeholder="*변경 비밀번호(영문자/숫자 4~16자)" class="form-control">
			</div>
			<sup id=pass_check>&nbsp;</sup>
			<div>
		
				<input type="password" id='confirm' placeholder="*변경 비밀번호 확인" class="form-control">
			</div>
			
			<sup id=confirm_check>&nbsp;</sup>
			<div class="ad">
				<p>주소</p>
				<input type="text" name="postCode" id="postCode" 
					value="${sessionScope.memberinfo.postCode }" 
					placeholder="*우편번호" readonly class="form-control">
				<button class="btn btn-success" id="find_postcode_btn" type="button">주소찾기 ></button>
				<br> 
				<input type="text" name="baseAddress" id="baseAddress"
					value="${sessionScope.memberinfo.baseAddress}"
					placeholder="기본주소" readonly class="form-control"> 
				<input type="text" name="detailAddress" id="detailAddress" 
					value="${sessionScope.memberinfo.detailAddress}" 
					placeholder="상세주소" class="form-control">

			</div>

			<div>
				<input type="tel" name="phoneNumber" id="phoneNumber"
					value="${sessionScope.memberinfo.phoneNumber }" placeholder="*휴대전화 ( - 포함)" class="form-control">
			</div>
			<sup id="phone_check">&nbsp;</sup>
			<div>
				<input type="email" name="email" id="email"
					value="${sessionScope.memberinfo.email }"
					 placeholder="*이메일" class="form-control">
			</div>
			<sup id="email_check">&nbsp;</sup>
			<div>
				<input type="date" name="birthDay" 
					value="${sessionScope.memberinfo.birthDay }"
					placeholder="생년월일" class="form-control">
			</div>


		</div>
		<div>
			<button id="modifyinfo" class="btn btn-success" type="submit">변경하기</button>
		</div>
	</form>
	</div>
	<jsp:include page="./footer.jsp"/>
	<script src="/resources/js/updateAccount.js"></script>
	
</body>
</html>