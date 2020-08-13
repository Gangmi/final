$(document).ready(function() {



//	$("#commentInsertBtn").click(function(){
	//일별 조회수 구글차트 ajax
/*	$.ajax({
		type:'POST',
		url : "/adminChart.do",
		success : function(data){  

			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);

			var a=[['data', '자유게시판', '팁게시판', '농사in게시판', '분양게시판']];
			for(var i=0; i<=data[0].length; i++){
				a.push([data[0][i].regdate, data[0][i].boardView, data[1][i].boardView, data[2][i].boardView, data[3][i].boardView ])
			}
 
			function drawChart() {
				var data = google.visualization.arrayToDataTable(a);

				var options = {
						title: '이번 달 일별 조회수',
						curveType: 'function',
						legend: { position: 'bottom' }
				};

				var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

				chart.draw(data, options);
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});*/
	
	
	$.ajax({
		type:'POST',
		url : "/adminChart.do",
		success : function(data){  

			 google.charts.load('current', {'packages':['line']});
		     google.charts.setOnLoadCallback(drawChart);

			var a=[];

			for(var i=0; i<=data[0].length; i++){
				
				a.push([data[0][i].regdate, data[0][i].boardView, data[1][i].boardView, data[2][i].boardView, data[3][i].boardView ]);
			}
 
		
			 function drawChart() {

			      var data = new google.visualization.DataTable();
			      data.addColumn('string', '날짜');
			      data.addColumn('number', '자유게시판');
			      data.addColumn('number', '팁게시판');
			      data.addColumn('number', '농사in게시판');
			      data.addColumn('number', '분양게시판');
			      
			      data.addRows(a);

			        var options = {
			          chart: {
			            title: '이번 달 일별 조회수',
			            subtitle: ''
			          }
			       
			        };

			        var chart = new google.charts.Line(document.getElementById('linechart_material'));

			        chart.draw(data, google.charts.Line.convertOptions(options));
			      }
			 
				
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});

	//스마트팜, 농부신청 구글차트 ajax
	$.ajax({
		type:'POST',
		url : "/FarmerChart.do",
		success : function(data){ 
 

			google.charts.load('current', {'packages':['bar']});
			google.charts.setOnLoadCallback(drawChart);

			var a=[['신청날짜', '신청개수']];

			for(var i=0; i<=data.length; i++){
				a.push([data[i].applyDate, data[i].count])
			}

			function drawChart() {
				var data = google.visualization.arrayToDataTable(a);

				var options = {
						chart: {
							title: '',
							subtitle: '',
						}
				};

				var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

				chart.draw(data, google.charts.Bar.convertOptions(options));
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	
	
	//스마트팜, 농부신청 구글차트 ajax
	$.ajax({
		type:'POST',
		url : "/adminPieChart.do",
		success : function(data){ 
 
			 google.charts.load("current", {packages:["corechart"]});
		      google.charts.setOnLoadCallback(drawChart);
	
		      var a=[['Board', 'count']];
		      
		      
		    	  a.push(['자유게시판',  data[0].boardView])
		    	  a.push(['팁게시판',  data[1].boardView])
		    	  a.push(['농사in게시판',  data[2].boardView])
		    	  a.push(['분양게시판',  data[3].boardView])
		      
		      function drawChart() {
		        var data = google.visualization.arrayToDataTable(a);

		        var options = {
		          title: '오늘 게시판 글 개수',
		          is3D: true,
		        };

		        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		        chart.draw(data, options);
		      }
			
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
});		 

