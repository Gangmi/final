<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>관리자 페이지</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/datepicker3.css" rel="stylesheet">
<link href="/resources/css/styles.css" rel="stylesheet">


<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">

 

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
				
				<a class="navbar-brand" href="/index.do"><span>여름지기</span></a>
				
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
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<div class="easypiechart" id="easypiechart-teal" data-percent="30">
							<span class="name">방문자수</span>
							<span class="percent">30</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<div class="easypiechart" id="easypiechart-blue" data-percent="15">
							<span class="name">전체 댓글수</span>
							<span class="percent">15</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<div class="easypiechart" id="easypiechart-orange"
							data-percent="21">
							<span class="name">등록 게시물 갯수</span>
							<span class="percent">21</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<div class="easypiechart" id="easypiechart-red" data-percent="4">
							<span class="name">스마트팜,농부신청</span>
							<span class="percent">4</span>
						</div>
					</div>
				</div>
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
							<!-- <canvas class="main-chart" id="line-chart" height="200"
								width="600"></canvas> -->

							<div class="col-lg-12" id="linechart_material"
								style="width: 100%; height: 500px"></div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						스마트팜, 농부신청
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
							<!-- <canvas class="main-chart" id="bar-chart" height="200"
								width="600"></canvas> -->
							<div id="columnchart_material"
								style="width: 100%; height: 500px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.row-->
		
		
<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						게시판당 게시물 등록 갯수
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
							<!-- <canvas class="main-chart" id="bar-chart" height="200"
								width="600"></canvas> -->
							<div id="piechart_3d" style="width: 100%; height: 500px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		


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
	<script>
		/* window.onload = function() {
			var chart1 = document.getElementById("line-chart").getContext("2d"); 
			window.myLine = new Chart(chart1).Line(lineChartData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				scaleGridLineColor : "rgba(0,0,0,.05)",
				scaleFontColor : "#c5c7cc" 
			});
			var chart2 = document.getElementById("bar-chart").getContext("2d");
			window.myBar = new Chart(chart2).Bar(barChartData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				scaleGridLineColor : "rgba(0,0,0,.05)",
				scaleFontColor : "#c5c7cc"
			});
			var chart3 = document.getElementById("doughnut-chart").getContext(
					"2d");
			window.myDoughnut = new Chart(chart3).Doughnut(doughnutData, {
				responsive : true,
				segmentShowStroke : false
			});
			var chart4 = document.getElementById("pie-chart").getContext("2d");
			window.myPie = new Chart(chart4).Pie(pieData, {
				responsive : true,
				segmentShowStroke : false
			});
			var chart5 = document.getElementById("radar-chart")
					.getContext("2d");
			window.myRadarChart = new Chart(chart5).Radar(radarData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.05)",
				angleLineColor : "rgba(0,0,0,.2)"
			});
			var chart6 = document.getElementById("polar-area-chart")
					.getContext("2d");
			window.myPolarAreaChart = new Chart(chart6).PolarArea(polarData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				segmentShowStroke : false
			});
		}; */
	</script>
	<script type="text/javascript" src="/resources/js/googleChart.js"></script>
</body>
</html>