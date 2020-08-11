$(document).ready(function() {
	$("#commentInsertBtn").click(function(){
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		 $.ajax({
		        type:'POST',
		        url : "/admin.do",
		        success : function(data){
					  function drawChart() { 
					  	alert(data);
						
						var data = google.visualization.arrayToDataTable([
						  ['day', 'free_board', 'tip_board', 'nongsain', 'parcel_board'],
						  
						  [data,  , ],
							}
						]); 

						var options = { 
						  title: 'Company Performance', 
						  curveType: 'function',
						  legend: { position: 'bottom' }
						};

						var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

						chart.draw(data, options);
					
					},
					error:function(request,status,error){
						alert("로그인 후 이용 가능합니다.");
				}
		       } 
		    });
		});    

 });
