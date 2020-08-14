<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>농부권한 승인페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/datepicker3.css" rel="stylesheet">
<link href="/resources/css/styles.css" rel="stylesheet">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">

 <style type="text/css">
        .approve_button{ 
            display: none;
        }
        .cancel_button{
        	display:none;
        }
    </style>

<!-- 구글 그래프 스크립트 -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/js/googleChart.js"></script>


<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				
				<a class="navbar-brand" href="#"><span>여름지기</span></a>
				
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive"
					alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">Username</div>
				<div class="profile-usertitle-status">
					<span class="indicator label-success"></span>Online
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		
		<ul class="nav menu">
			
			<li class="active"><a href="/admin.do"><em
					class="fa fa-bar-chart">&nbsp;</em> Charts</a></li>
			<li><a href="/resources/admin-nexacro/index.html"><em class="fa fa-check-square-o">&nbsp;</em>
					Smart Farm 승인페이지</a></li>
			<li><a href="/farmer-application-manage2.do"><em class="fa fa-check-square-o">&nbsp;</em>
					농부권한 승인페이지</a></li>
			<li><a href="index.do"><em class="fa fa-sign-out">&nbsp;</em>
					메인페이지</a></li>
		</ul>
	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">Charts</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Charts</h1>
			</div>
		</div>
		<!--/.row-->

		

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						일별 조회수
						<ul class="pull-right panel-settings panel-button-tab-right">
							<li class="dropdown"><a class="pull-right dropdown-toggle"
								data-toggle="dropdown" href="#"> <em class="fa fa-cogs"></em>
							</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li>
										<ul class="dropdown-settings">
											<li><a href="#"> <em class="fa fa-cog"></em>
													Settings 1
											</a></li>
											<li class="divider"></li>
											<li><a href="#"> <em class="fa fa-cog"></em>
													Settings 2
											</a></li>
											<li class="divider"></li>
											<li><a href="#"> <em class="fa fa-cog"></em>
													Settings 3
											</a></li>
										</ul>
									</li>
								</ul></li>
						</ul>
						<span
							class="pull-right clickable panel-toggle panel-button-tab-left"><em
							class="fa fa-toggle-up"></em></span>
					</div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							

							<div class="">
    <a href="farmer-application-manage.do?processingDate=null">미승인 목록 보기</a>
        <table class="table table-hover">
            <thead class="">
                <tr>
                    <th scope="col"><input id="all_checked" type="checkbox"></th>
                    <th scope="col">No</th>
                    <th scope="col">아이디</th>
                    <th scope="col">농부 이름</th>
                    <th scope="col">농장 주소</th>
                    <th scope="col">사업자 명</th>
                    <th scope="col">농업경영체 등록번호</th>
                    <th scope="col">농장 전화번호</th>
                    <th scope="col">증명서 이미지</th>
                    <th scope="col">신청 일</th>
                    <th scope="col">승인 일</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="application" items="${applicationlist }">
                <tr class="select_tr">
                    <th scope="row"><input class="chk" type="checkbox"></th>
                    <td><span name="no">${application.no}</span></td>
                    <td><span name="id">${application.farmerId}</span></td>
                    <td><span name="name">${application.farmerName}</span></td>
                    <td><span name="addr">${application.farmlandAddress}</span></td>
                    <td><span name="cor_name">${application.farmlandCorporationName}</span></td>
                    <td><span name="cor_number">${application.farmlandCorporationNumber}</span></td>
                    <td><span name="tel">${application.farmlandTel}</span></td>
                    <td><a href="/resources/farmer_certificate/${application.certificateImageUrl}" target="_blank">${application.certificateImageUrl}</a></td>
                    <td><span name="apply_date">${application.applyDate}</span></td>
                    <td><span name="approve_date">${application.processingDate}</span></td>
                    <td><button class="approve_button"></button></td>
                    <td><button class="cancel_button"></button></td>
                </tr>
                </c:forEach>
                
            </tbody>
        </table>
        
        <button id="btn_approve" class="btn">승인</button>
        <button id="btn_approve_cancel" class="btn">승인취소</button>
    </div>
     <div style="display: block; text-align: center;">		
				<c:if test="${paging.startpage != 1 }">
					<a href="/farmer-application-manage.do?nowpage=${paging.startpage - 1 }&cntPerPage=${paging.cntPerPage}${isPDateNull}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startpage }" end="${paging.endpage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowpage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowpage }">
							<a href="/farmer-application-manage.do?nowpage=${p }&cntPerPage=${paging.cntPerPage}${isPDateNull}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endpage != paging.lastPage}">
					<a href="/farmer-application-manage.do?nowpage=${paging.endpage+1 }&cntPerPage=${paging.cntPerPage}${isPDateNull}">&gt;</a>
				</c:if>
			</div>
  
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.row-->

	
		

		


	</div>
	<!--/.main-->


	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/chart.min.js"></script>
	<script src="/resources/js/chart-data.js"></script>
	<script src="/resources/js/easypiechart.js"></script>
	<script src="/resources/js/easypiechart-data.js"></script>
	<script src="/resources/js/bootstrap-datepicker.js"></script>
	<script src="/resources/js/custom.js"></script>


	<script type="text/javascript" src="/resources/js/googleChart.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
    var agent = navigator.userAgent.toLowerCase();
    $( function() {
        if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
            $("input[type='date']").addClass("datepicker");
            $("input[type='date']").attr({"readonly":true});
            $(".datepicker").datepicker({dateFormat: 'yy-mm-dd' })   
        };
        $("#all_checked").click(function(){
            var chk = $(this).is(":checked");//.attr('checked');
            if(chk){
              $("input.chk").prop('checked', true);  
            } 
            else{
              $("input.chk").prop('checked', false); 
            }
        });
        //각 ROW에 체크박스가 체크가 되어있으면 ajax통신을 통해 농부를 승인하고,
        //화면을 다시 갱신한다.
        $(".approve_button").on("click",function(){
            var change_value = $(this).parent().parent().find('span[name="approve_date"]');
            var mydata = new Object();
            mydata.no = parseInt($(this).parent().parent().find('span[name="no"]').text());//등록번호
            mydata.farmerName=$(this).parent().parent().find('span[name="name"]').text();//이름
            mydata.farmerId=$(this).parent().parent().find('span[name="id"]').text();//아이디
            mydata.farmlandAddress=$(this).parent().parent().find('span[name="addr"]').text();//주소
            mydata.farmlandCorporationName=$(this).parent().parent().find('span[name="cor_name"]').text();//경영인 이름
            mydata.farmlandTel=$(this).parent().parent().find('span[name="tel"]').text();//전화번호
            mydata.farmlandCorporationNumber=$(this).parent().parent().find('span[name="cor_number"]').text();//농업경영체번호
            mydata.applyDate=$(this).parent().parent().find('span[name="apply_date"]').text();//신청일
            if($(this).parent().parent().find('input.chk').is(":checked")){
                $.ajax({
                    url:"farmer-approve-act.do", //url에 데이터를 적재해서 보낼 순 있으나 비추
                    type:"post",
                    cache:false,
                    dataType:'json',
                    data:mydata , //쿼리스트링 혹은 json 방식(딕셔너리)으로 보내면됨.
                    success:function(data){
                        mydata=data;
                        if(mydata.error!=undefined){
                            alert("에러");
                        }else{
                        	change_value.text(mydata.processingDate);
                        }
                    },
                    error:function(data,status,err){
                        alert(status+" :"+err);
                    }
                });
                
            }
        });
        //---------------------------------------------------------------------------
        //--------------------승인 취소-----------------------------------------
        $(".cancel_button").on("click",function(){
        	
            var change_value = $(this).parent().parent().find('span[name="approve_date"]');
            var mydata = new Object();
            mydata.no = parseInt($(this).parent().parent().find('span[name="no"]').text());//등록번호
            mydata.farmerName=$(this).parent().parent().find('span[name="name"]').text();//이름
            mydata.farmerId=$(this).parent().parent().find('span[name="id"]').text();//아이디
            mydata.farmlandAddress=$(this).parent().parent().find('span[name="addr"]').text();//주소
            mydata.farmlandCorporationName=$(this).parent().parent().find('span[name="cor_name"]').text();//경영인 이름
            mydata.farmlandTel=$(this).parent().parent().find('span[name="tel"]').text();//전화번호
            mydata.farmlandCorporationNumber=$(this).parent().parent().find('span[name="cor_number"]').text();//농업경영체번호
            mydata.applyDate=$(this).parent().parent().find('span[name="apply_date"]').text();//신청일
            if($(this).parent().parent().find('input.chk').is(":checked")){
                $.ajax({
                    url:"farmer-cancel-act.do", //url에 데이터를 적재해서 보낼 순 있으나 비추
                    type:"post",
                    cache:false,
                    dataType:'json',
                    data:mydata , //쿼리스트링 혹은 json 방식(딕셔너리)으로 보내면됨.
                    success:function(data){
                    	
                        mydata=data;
                        if(mydata.error!=undefined){
                            alert("에러");
                        }else{
                        	console.log(data);
                        	change_value.text(mydata.processingDate);
                        }
                    },
                    error:function(data,status,err){
                        alert(status+" :"+err);
                    }
                });
                
            }
        });
        //-------------------------------------------------------------------
        
        $(".select_tr").not('.approve_button').not('input.chk').not('.cancel_button').on("click",function(){
            if($(this).find('input.chk').is(":checked"))
                $(this).find('input.chk').prop('checked', false);
            else
                $(this).find('input.chk').prop('checked', true);
        });
        $("input.chk").on("click",function(){
            if($(this).is(":checked"))
                $(this).prop('checked', false);
            else
                $(this).prop('checked', true);
        });
        
        $('#btn_approve').click(function(){
            $(".approve_button").click(); 
            var chk = $(this).is(":checked");//.attr('checked');
            if(chk){
            }else{
              $("input.chk").prop('checked', false); 
            }
        });
        $('#btn_approve_cancel').click(function(){
            
        	$(".cancel_button").click(); 
            var chk = $(this).is(":checked");//.attr('checked');
            if(chk){
            }else{
            $("input.chk").prop('checked', false); 
            }
        });
    });
  </script>
</body>
</html>