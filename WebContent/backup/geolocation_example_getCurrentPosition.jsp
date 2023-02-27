<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <title>Geolocation example - getCurrentPosition()</title>
</head>
<body>
    <script>
    
    	
    function findLocation() {

        if (navigator.geolocation) { 

            navigator.geolocation.getCurrentPosition(showYourLocation); 

        } else { 

             alert("이 문장은 사용자의 웹 브라우저가 Geolocation API를 지원하지 않을 때 나타납니다!"); 

        }
        
        function showErrorMsg(error) {

            switch(error.code) {

                case error.PERMISSION_DENIED:

                	alert("이 문장은 사용자가 Geolocation API의 사용 요청을 거부했을 때 나타납니다!");

                break;

                case error.POSITION_UNAVAILABLE:
	
              	  alert("이 문장은 가져온 위치 정보를 사용할 수 없을 때 나타납니다!");

                break;

                case error.TIMEOUT:

               	  alert("이 문장은 위치 정보를 가져오기 위한 요청이 허용 시간을 초과했을 때 나타납니다!");

                break;

                case error.UNKNOWN_ERROR:

                  alert("이 문장은 알 수 없는 오류가 발생했을 때 나타납니다!");

                break;

            }

        }
        
        function showYourLocation(position) {

            var userLat = position.coords.latitude;

            var userLng = position.coords.longitude;

            alert("위도값 :"+userLat+", 경도값 : "+userLng);

        }
        
        
        

    }

    
    
    
 </script>    
</body>

</html>