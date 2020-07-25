<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="Smart-Farm.do">smartFarm</a>
<a href="requestData.do">test</a>
<a href="updateAccount.do">updateAccount</a>
	<div id="map" style="width:1000px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85ca856139e74206389aacd96ce85ab6"></script>
	<script>
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
	</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85ca856139e74206389aacd96ce85ab6"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85ca856139e74206389aacd96ce85ab6&libraries=services,clusterer,drawing"></script>
</body>
</html>