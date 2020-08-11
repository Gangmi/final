$(document).ready(function() {



//	$("#commentInsertBtn").click(function(){
	//일별 조회수 구글차트 ajax
	$.ajax({
		type:'POST',
		url : "/adminChart.do",
		error : function(e){
			alert('error')
			console.log(e)
		},
		success : function(data){ 

			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);

			var a=[['data', 'free_board', 'tip_board', 'nongsain', 'parcel_board']];
			for(var i=0; i<=data.length; i++){
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
		}
	});

	//스마트팜, 농부신청 구글차트 ajax
	$.ajax({
		type:'POST',
		url : "/FarmerChart.do",
		error : function(e){
			alert('error')
			console.log(e)
		},
		success : function(data){ 
 
			console.log(data+'##########')
			google.charts.load('current', {'packages':['bar']});
			google.charts.setOnLoadCallback(drawChart);

			var a=[['applyDate', 'count']];
			alert(data[0].count);
			
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
});		 

