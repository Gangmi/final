$(document).ready(function() {



//	$("#commentInsertBtn").click(function(){
	//일별 조회수 구글차트 ajax
	$.ajax({
		type:'POST',
		url : "/adminChart.do",
		success : function(data){  

			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);

			var a=[['data', 'free_board', 'tip_board', 'nongsain', 'parcel_board']];
			for(var i=0; i<=data[0].length; i++){
				a.push([data[0][i].regdate, data[0][i].boardView, data[1][i].boardView, data[2][i].boardView, data[3][i].boardView ])
			}
 
			function drawChart() {
				var data = google.visualization.arrayToDataTable(a);

				var options = {
						title: 'Company Performance',
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
	});

	//스마트팜, 농부신청 구글차트 ajax
	$.ajax({
		type:'POST',
		url : "/FarmerChart.do",
		success : function(data){ 
 

			google.charts.load('current', {'packages':['bar']});
			google.charts.setOnLoadCallback(drawChart);

			var a=[['applyDate', 'count']];

			for(var i=0; i<=data.length; i++){
				a.push([data[i].applyDate, data[i].count])
			}

			function drawChart() {
				var data = google.visualization.arrayToDataTable(a);

				var options = {
						chart: {
							title: 'Company Performance',
							subtitle: 'Sales, Expenses, and Profit: 2014-2017',
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
		      
		      
		    	  a.push(['free_board',  data[0].boardView])
		    	  a.push(['tip_board',  data[1].boardView])
		    	  a.push(['nongsain',  data[2].boardView])
		    	  a.push(['parcel_board',  data[3].boardView])
		      
		      function drawChart() {
		        var data = google.visualization.arrayToDataTable(a);

		        var options = {
		          title: 'My Daily Activities',
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

