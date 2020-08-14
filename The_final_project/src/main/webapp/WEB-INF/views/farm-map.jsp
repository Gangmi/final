<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제휴 농장</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<style>
        .farm-list {
            margin:10px;
            text-align: center;
            display: inline-block;
            vertical-align: middle;
        }
        
        #map{
        margin:0 auto;
        margin-top: 50px;
        margin-bottom: 50px;
        
        }
        
        .table{
        margin-top:50px;
        margin: 0 auto;
        width: auto !important;
        }
        .tablewrap{
        margin-top: 50px;
        width: 80%;
        text-align: center;
        margin: 0 auto;
        }
        .partnerfarm{
        margin:0 auto;
        width: 80%;
        
        margin-top: 50px;
        }
        
</style>
</head>
<body>
	<jsp:include page="./header.jsp"/>
	 <div class="partnerfarm">
	<h3>제휴 농장</h3>
	</div>
	<div id="map" style="width:1000px;height:400px;"></div>
	<div class="tablewrap">
	<table class="table table-striped table-bordered table-hover table-sm farm-list">
	    <colgroup>
	        <col width="150px"/>
	        <col width="300px"/>
	        <col width="150px"/>
	        <col width="350px"/>
	        <col width="150px"/>
	    </colgroup>
	    <thead>
	        <tr>
	            <th>No</th>
	            <th>농장주소</th>
	            <th>농장 주</th>
	            <th>농장 이름</th>
	            <th>전화 번호</th>
	            <th>위치</th>
	        </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${farmlist}" var="farm" varStatus="index">
	        <tr>
	            <td>${farm.no }</td>
	            <td>${farm.address }</td>
	            <td>${farm.name }</td>
	            <td>${farm.farmName }</td>
	            <td>${farm.tel }</td>
	            <td><button class="btn-sm btn-info btn_show_position">위치보기</button></td>
	        </tr>
	    </c:forEach>
	    </tbody>
    </table>
    </div>
	<jsp:include page="./footer.jsp"/>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85ca856139e74206389aacd96ce85ab6&libraries=services,clusterer,drawing"></script>
	<script>
		$(document).ready(function(){
			var lat1=33.450580;
			var lng1=126.574942;
			$('.btn_show_position').on("click",function(event){
				//주소 좌표 변환 객체 생성
				var farmName = $(this).parent().siblings().eq(3).html()
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch($(this).parent().siblings().eq(1).html(), function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        //var marker = new kakao.maps.Marker({
				        //    map: map,
				        //    position: coords
				        //});
				        marker.setPosition(coords)
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+farmName+'</div>'
				        });
				        infowindow.open(map, marker);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				        console.log(result);
				    } 
				});    
				
				console.log($(this).parent().siblings().eq(1).html());
				//panTo(lat1,lng1);
				//var markerPosition  = new kakao.maps.LatLng(lat1, lng1); 
				//marker.setPosition(markerPosition);
			})
		})
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		
		var map = new kakao.maps.Map(container, options);
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);

		function panTo(lat,lng) {
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(lat, lng);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);            
		}
		
	</script>
	

<script type="text/javascript">
	$('.mainmenu ul li').find('a[href="/farm-map.do"]').parent().addClass('active');
	</script>
</body>
</html>