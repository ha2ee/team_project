<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 소스출처 : http://www.kma.go.kr/weather/forecast/digital_forecast.jsp  내부에 있음 -->
<!-- 기상청에서 이걸 왜 공식적으로 공개하지 않을까? -->

<!-- (사용 예) -->
<!-- var rs = dfs_xy_conv("toXY","60","127"); -->

<!-- console.log(rs.x, rs.y); -->


<script>



 // # 위치정보를 동의했을 때 받아오는 위도와 경도값을 기초로 x,y 좌표를 구한다음 해당 지역의 날씨를 api 로 받아오는 설정 
 //
 // LCC DFS 좌표변환을 위한 기초 자료
 //
 var RE = 6371.00877; // 지구 반경(km)
 var GRID = 5.0; // 격자 간격(km)
 var SLAT1 = 30.0; // 투영 위도1(degree)
 var SLAT2 = 60.0; // 투영 위도2(degree)
 var OLON = 126.0; // 기준점 경도(degree)
 var OLAT = 38.0; // 기준점 위도(degree)
 var XO = 43; // 기준점 X좌표(GRID)
 var YO = 136; // 기1준점 Y좌표(GRID)
 
 //
 // LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
 //

var v1 = 35.370422222222224;
var v2 = 129.15226388888888;
var rs = dfs_xy_conv(v1, v2);
console.log(rs.x, rs.y);

 function dfs_xy_conv(v1, v2) {
     var DEGRAD = Math.PI / 180.0;
     var RADDEG = 180.0 / Math.PI;
     var re_1 = RE / GRID;
     var slat_1 = SLAT1 * DEGRAD;
     var slat_2 = SLAT2 * DEGRAD;
     var olon_1 = OLON * DEGRAD;
     var olat_1 = OLAT * DEGRAD;

     var sn = Math.tan(Math.PI * 0.25 + slat_2 * 0.5) / Math.tan(Math.PI * 0.25 + slat_1 * 0.5);
     sn = Math.log(Math.cos(slat_1) / Math.cos(slat_2)) / Math.log(sn);
     var sf = Math.tan(Math.PI * 0.25 + slat_1 * 0.5);
     sf = Math.pow(sf, sn) * Math.cos(slat_1) / sn;
     var ro = Math.tan(Math.PI * 0.25 + olat_1 * 0.5);
     ro = re_1 * sf / Math.pow(ro, sn);
     var rs = {};
         rs['lat'] = v1;
         rs['lng'] = v2;
         
         var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
         ra = re_1 * sf / Math.pow(ra, sn);
    
         var theta = v2 * DEGRAD - olon_1;
         if (theta > Math.PI) {
        	 theta -= 2.0 * Math.PI;
         }
         if (theta < -Math.PI){
        	 theta += 2.0 * Math.PI;
         }
         theta *= sn;
    
         rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
         rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
         
     return rs;
 }
 //-->
</script>
</body>
</html>