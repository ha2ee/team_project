<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <script>
    
    navigator.geolocation.getCurrentPosition(showYourLocation, showErrorMsg); 

    function showYourLocation(position) {  // 성공했을때 실행
        var userLat = position.coords.latitude;
        var userLng = position.coords.longitude;
        
        console.log("가져온 위도경도값 : "+ userLat , userLng);
        
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

	   // 함수를 실행시키고 리턴 받아온 값들을 출력한다.
       var rs = dfs_xy_conv(userLat, userLng);
        
       console.log("x,y좌표값 : "+ rs.x, rs.y);
       
       // 받아온 값들을 변수에 저장한다.
       var todayx = rs.x;
       var todayy = rs.y;

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
        
        
    	// 전역변수로 url에 들어갈 실시간 날짜 받아오기
    	var Wdate = new Date();
    	var initDate = moment(Wdate).format('YYYYMMDD');
    	var initTime = moment(Wdate).format('HH')-1;	
    	var koDate = moment(Wdate).format('M월 DD일');
    	var KoTime = moment(Wdate).format('HH시');

    // 3) ajax를 활용해서 현재날씨 데이터 만들기
    // 가져올 값 : 1)해당날짜의 시간 2)온도 3)바람세기
    $.ajax({
    	url: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=SswoUAmXtjH%2FEZIxjrzCxbjXuV0AhAdO5rXvMxXfxqis8wmCcKFciA72WHxnWC1Uyosdebw1T1HP5qH9bEyu7w%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date="+initDate+"&base_time="+initTime+"00&nx="+todayx+"&ny="+todayy, 
    	success: function(result){
    	
    	// 온도 , 바람, 비	등의 정보를 API 에서 받아오기
    	// 11 ~ 15  도 : 산책하기 딱 좋은 날씨!
    	//  6 ~ 10  도 : 괜찮지만, 만약을 대비해 조심히 산책!
    	//  -1 ~  5 도 : 품종에따른 주의가 필요해요! (방한용품권장)
    	//  -2 ~ -4 도 : 산책하기에는 상당히 쌀쌀해요! (방한용품필수)
    	//  -5 이후     : 실내활동 권장 (너무 추워요)
    	var temp = result.response.body.items.item[3].obsrValue;
    	
    	// 바람 Max 값 : 14 m /s 이상
    	// 4 미만    : 바람이 약하다.
    	// 4~ 8      : 바람이 약간 강하다.
    	// 9~14미만 : 바람이 강하다.
    	// 14 이상  : 바람이 매우 강하다.

    	var wind = result.response.body.items.item[7].obsrValue;
    	
    	// 0 : 없음, 
    	// 1 : 비옴, 
    	// 2:  비 또는 눈 
    	// 3: 눈,
    	// 4: 소나기
    	var rain = result.response.body.items.item[0].obsrValue;
    	
    	// console에 출력해보기
    	console.log(initDate);
    	console.log(initTime);	
    	console.log(result);
    	console.log(temp);
    	console.log(wind);
    	console.log(rain);
    	
    	// 홈페이지를 이동할때마다 변경된 값을 저장시키기
    	$("#resultDate").text(koDate);
    	$("#resultTime").text(KoTime);
    	$("#resultTemp").text(temp+" 도");
    	$("#resultWind").text(wind+" m/s");
    	
    		// 온도와 바람에 따라서 변경 노출 될 이미지와 문구 설정
    		
    		// #1) 11도 보다 온도가 높거나 같고, 16도 미만 일 경우
    		if(temp >= 11 && temp < 16){
    			
    				// 온도는 11도 이상이지만 비가올 경우
    				if(rain > 0){
    					
    					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
    					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
    					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
    				
    				// 오후 6시 이후일 경우,
    				}else if(rain == 0 && initTime > 18){
    					
    					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
    					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
    					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
    					
    					
    					
    				// 온도가 11도 이상이고 비가 오지 않을경우,	
    				}else{
    				
    				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
    				$("#weatherzone").attr("value", "산책하기").css("font-weight","bold");
    				$("#weatherzone2").attr("value", "딱 좋은 날씨!").css("color", "#009688").css("font-weight","bold");
    				
    				}
    			
    		// #2) 온도가 6도 보다는 높지만, 11도 보다는 낮을때	
    		}else if(temp >= 6 && temp < 11){
    			
    				// 온도는 6도 이상 11도 미만이지만 비가올 경우
    				if(rain > 0){
    					
    					
    					
    					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
    					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
    					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
    				
    				// 오후 6시 이후일 경우,
    				}else if(rain == 0 && initTime > 18){
    					
    					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
    					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
    					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
    						
    					
    					
    				// 온도가 6도 이상 11도 미만에 비가 안 올 경우
    				}else{
    				
    				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
    				$("#weatherzone").attr("value", "산책하기 괜찮지만").css("font-weight","bold");
    				$("#weatherzone2").attr("value", "조심히 산책하세요!").css("color", "#8bc34a").css("font-weight","bold");
    				
    				}
    		// #3) 온도가 -1도 이상 6도 미만일때
    		}else if(temp >= -1 && temp < 6){
    				
    				// 온도는 -1도 이상 6도 미만이지만 비가올 경우
    				if(rain > 0){
    					
    					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
    					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
    					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
    				
    				// 오후 6시 이후일 경우,
    				}else if(rain == 0 && initTime > 18){
    					
    					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
    					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
    					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
    						
    					
    				// 온도가 -1도 이상 6도 미만에 비가 안 올 경우
    				}else{
    				
    				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
    				$("#weatherzone").attr("value", "방한용품을 권장하고").css("font-weight","bold");
    				$("#weatherzone2").attr("value", "많은 주의가 필요합니다!").css("color", "#ff5722").css("font-weight","bold");
    				}

    			
    		// #4) 온도가 -2도보다 이하고 -4도 초과 일때	
    		}else if (temp <= -2 && temp > -4){
    			
    				// 온도는 -2도 이하 -4도 초과이지만 비가올 경우
    				if(rain > 0){
    					
    					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
    					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
    					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
    				
    				// 오후 6시 이후일 경우,
    				}else if(rain == 0 && initTime > 18){
    					
    					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
    					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
    					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
    						
    					
    					
    				// 온도가 -2도 이하 -4도 초고에 비가 안 올 경우
    				}else{
    				
    				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
    				$("#weatherzone").attr("value", "산책하기엔 쌀쌀해요").css("font-weight","bold");
    				$("#weatherzone2").attr("value", "방한대책 필수에요!!").css("color", "#ff5722").css("font-weight","bold");
    				
    				}
    			
    		// #5) 온도가 -5도 이하일 경우	
    		}else if(temp <= -5){
    			
    			// 온도는 -5도 이하에 비가올 경우
    			if(rain > 0){
    				
    				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
    				$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
    				$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
    			
    			// 오후 6시 이후일 경우,
    			}else if(rain == 0 && initTime > 18){
    				
    				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
    				$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
    				$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");

    			
    			// 온도가 -5도 이하에 비가 안 올 경우
    			}else{
    			
    			$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
    			$("#weatherzone").attr("value", "실내 놀이를").css("font-weight","bold");
    			$("#weatherzone2").attr("value", "적극 권장합니다!!").css("color", "#ff5722").css("font-weight","bold");
    			
    			}
    			
    			
    			
    		}
    	

       	},
    });

        
        
        
        
        
        
        
    }

    function showErrorMsg(error) { // 실패했을때 실행
        switch(error.code) {
            case error.PERMISSION_DENIED:
            loc.innerHTML = "이 문장은 사용자가 Geolocation API의 사용 요청을 거부했을 때 나타납니다!"
            break;

            case error.POSITION_UNAVAILABLE:
            loc.innerHTML = "이 문장은 가져온 위치 정보를 사용할 수 없을 때 나타납니다!"
            break;

            case error.TIMEOUT:
            loc.innerHTML = "이 문장은 위치 정보를 가져오기 위한 요청이 허용 시간을 초과했을 때 나타납니다!"
            break;

            case error.UNKNOWN_ERROR:
            loc.innerHTML = "이 문장은 알 수 없는 오류가 발생했을 때 나타납니다!"
            break;
        }
    }

        




        
</script>
</body>

</html>