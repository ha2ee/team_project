<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>	
<!DOCTYPE html>
<html>
<head>
<style>
 #map{
 	margin : 0 auto 0 auto;
 }
 
 #kmap{
 	padding : 10px 45px;

 }
</style>
<meta charset="UTF-8">
<title>intro.jsp</title>
</head>
<body>

	<!-- 	오시는길이  들어갈 항목 -->
	 <h1> (주) 늘 봄 </h1>
	 <br>
	 <h3>경남 양산시 중부동 686-7 양산역프라자 2층</h3>
	 <br>
	 <h4> 대표전화 : 1800-0000</h4>
	 <br>
	 <h7>업무시간 ▶ 09:00 ~ 18:00 / 점심시간 12:00 ~ 13:00</h7>
	 <br>
	 <h7>(토,일요일,공휴일)은 휴무입니다.</h7>
	 <br>
	 <br>

	 <div id="map" style="width:500px;height:300px;"></div>
	 
	 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c389d4627b346ffd6ecdd0ee427f6f4"></script>
     <script>
		var container = document.getElementById('map');
		var options = {
			// 지도가 표시될 중심 위치 입니다 위도,경도
			center: new kakao.maps.LatLng(35.338397270427365, 129.0270503412126  ),
			level: 2
		};
		
		// 지도를 생성합니다
		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 위도,경도
		var markerPosition  = new kakao.maps.LatLng(35.33788895330836, 129.02753802495232 ); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div id="kmap" style=" padding : 10px 45px; ">(주)늘 봄<br><a href="https://map.kakao.com/link/to/양산직업학교,35.33788895330836,129.02753802495232" style="color:green;" target="_blank">[길 찾기]<br></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(35.33788895330836, 129.02753802495232); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
	  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		
		
	 </script>
	 <br>
	 <br>

</body>
</html>