<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .my-info{
            width: 400px;
            height: 250px;
            margin: auto;
            display: inline-block;
            text-align: center0
            padding: 51px;
        }
        .my-info .my-profile-img{
            width: 150px;
            height: 100%;
            position: relative;
            float: left;
            
        }
        
        .my-info .my-private{
            height: 100%;
            position: relative;
            float: left;
        }
        
        .my-info .info-update{
            position: relative;
            float: right;
        }
    </style>
</head>
<body>
	<jsp:include page="./header.jsp"/>
	<jsp:include page="./side.jsp"/>
    <div class="my-info">
        <span><h3>나의 회원정보</h3></span>
        <hr>
        <div class="my-profile-img">이미지 영역</div>
        <div class="my-private">
            <span>아이디</span> <span>${sessionScope.memberinfo.id }</span>  <br> 
            <span>회원명</span> <span>${sessionScope.memberinfo.name}</span> <br>
            <span>이메일</span> <span>${sessionScope.memberinfo.email}</span> <br>
            <span>휴대폰</span> <span>${sessionScope.memberinfo.phoneNumber}</span> <br>
        </div>
        <a class="info-update" href="/updateAccount.do"> 정보 수정하기</a>

    </div>
    <div class="my-info">
        <span><h3>농부 신청 현황</h3></span>
        <hr>
        
        <div class="my-private">
            <span>이름</span> <span>sample</span>  <br> 
            <span>경작지 명</span> <span>sample</span> <br>
            <span>농장 연락처</span> <span>sample</span> <br>
            <span>농장 주소</span> <span>sample</span> <br>
            <span>농업경영체 등록번호</span> <span>sample</span> <br>
            <span>신청 및 수정일</span> <br>
            <span>승인 일</span>
        </div>
        <sub><a class="info-update" href="/farmer-application-update.do"> 정보 수정하기</a></sub>
    </div>
    <br>
    <div class="my-info">
        <span><h3>스마트팜 신청 현황</h3></span>
        <hr>
        
        <div class="my-private">
            <span>이름</span> <span>sample</span>  <br> 
            <span>신청일</span> <span>sample</span> <br>
            <span>승인일</span> <span>sample</span> <br>
        </div>
        <sub><a class="info-update" href="#"> 정보 수정하기</a></sub>
    </div>
<jsp:include page="./footer.jsp"/>
</body>
</html>