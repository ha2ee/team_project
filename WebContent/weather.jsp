<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#weatherbox{
	
	border : 1px solid green;
	
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 100%;
	height : 150px;
	}
	
	#todayweather{
	
/* 	border : 1px solid green; */
	
	position : relative;
	text-align : center;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 250px;
	height : 30px;
	font-size : 20px;
	background : #ffebcd;
	border-radius : 10px;
	}
	
	#topTitle{
	
	border : 1px solid blue;
	
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 250px;
	height : 25px;
	border-radius: 5px;
	}
	
	#topTitle > div{
	
	border : 1px solid red;
	
	float:left;
	text-align : center;
	position : relative;
	top : 0;
	left : 1px;
	right : 0;
	margin : 0 auto;
	width : calc(96%/4);
	height : 100%;
	}
	
	#weatherBody{
	text-align : center;
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 250px;
	height : 25px;
	font-size : 13px;
	
	}
	
	#weatherBody > div{
	
	border : 1px solid red;
	
	float:left;
	text-align : center;
	position : relative;
	top : 0;
	left : 1px;
	right : 0;
	margin : 0 auto;
	width : calc(96%/4);
	height : 100%;
	}
	
	#weatherFooter {
	
/* 	border : 1px solid red; */
	
	text-align : center;
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 100%;
	height : 65px;
	
	}
	
	
	#weatherResult {
	
	border : 1px solid red;
	
	text-align : center;
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 246px;
	height : 100%;
	border-radius: 5px;
	}
	
	
	#weatherResult > img {
	
	border : 1px solid orange;
	
	text-align : center;
	position : relative;
	top : 0;
	left : -2px;
	right : 0;
	margin : 0 auto;
	width : 100px;
	height : 98%;
	border-radius: 5px;

	}
	
/* 	날씨에 대한 결과값 계산 후 출력할 곳 */

	#weatherzone {
	
	border : 1px solid blue;
	
	text-align : center;
	position : relative;
	top : -27px;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 135px;
	height : 90%;
	border-radius: 5px;
	
	}
</style>
<title>기상청 날씨 API</title>
</head>
<body>	
	<h1> 기상청 날씨 API</h1>
	<h2>종로 날씨</h2>
	
	

	
	<div id="weatherbox">
		<div id="todayweather">
			<label>실시간 날씨는..?</label>
		</div>
		<div id="topTitle">
			<div id="weatherDate">날짜</div>
			<div id="weatherTime">시간</div>
			<div id="weatherTemp">온도</div>
			<div id="weatherWind">바람</div>
		</div>
		<div id="weatherBody">
			<div id="resultDate">준비중</div>
			<div id= "resultTime">준비중</div>
			<div id= "resultTemp">준비중</div>
			<div id="resultWind">준비중</div>
		</div>
		<div id="weatherFooter">
			<div id="weatherResult">
				<img src="#" /><input id="weatherzone" type="text" />
			</div>
		</div>
	</div>
	
	
	
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
<script>
    // 1) getJSON을 활용해서 데이터값을 가져오는 방법 
// 	$.getJSON("https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=SswoUAmXtjH%2FEZIxjrzCxbjXuV0AhAdO5rXvMxXfxqis8wmCcKFciA72WHxnWC1Uyosdebw1T1HP5qH9bEyu7w%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=20230224&base_time=0600&nx=55&ny=127"
// 			, function(data){
// 				console.log(data.response.body.items.item[3].obsrValue);
				
// 				var content = data.response.body.items.item[3].baseDate+","+data.response.body.items.item[3].baseTime+","+data.response.body.items.item[3].obsrValue;
// 				$(".weatherResult").text(content);
// 		}
// 	)
	// 2) ajax를 활용해서 데이터 값을 가져오는 방법	
// 	$.ajax({
// 			url: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=SswoUAmXtjH%2FEZIxjrzCxbjXuV0AhAdO5rXvMxXfxqis8wmCcKFciA72WHxnWC1Uyosdebw1T1HP5qH9bEyu7w%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=20230224&base_time=0600&nx=55&ny=127", 
// 			success: function(data){
				
// 				console.log(data);
// 				var item = data.response.body.items.item[3];
// 				console.log(item);
// 				var content = item.baseDate+","+item.baseTime+","+item.obsrValue;
// 				console.log(content);
// 				$(".weatherResult").text(content);
// 		   	},
// 	});	
			// 전역변수로 url에 들어갈 실시간 날짜 받아오기
			var Wdate = new Date();
			var initDate = moment(Wdate).format('YYYYMMDD');
			var initTime = moment(Wdate).format('HH')-1;	
			var koDate = moment(Wdate).format('M월 DD일');
			var KoTime = moment(Wdate).format('HH시');

		// 3) ajax를 활용해서 현재날씨 데이터 만들기
		// 가져올 값 : 1)해당날짜의 시간 2)온도 3)바람세기
	$.ajax({
			url: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=SswoUAmXtjH%2FEZIxjrzCxbjXuV0AhAdO5rXvMxXfxqis8wmCcKFciA72WHxnWC1Uyosdebw1T1HP5qH9bEyu7w%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date="+initDate+"&base_time="+initTime+"00&nx=99&ny=80", 
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
			
				// 온도와 바람에 따라서 변경 노출 될 이미지와 문구 설정
				if(temp >= 11 && rain == 0){
					
					// 온도는 11도 이상이지만 비가올 경우
					if(temp >= 11 && rain > 0){
						
						$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nb/nbShop/img/rainy.gif");
						
					}else{
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nb/nbShop/img/sunny.gif");
					$("#weatherzone").text("산책하기 딱 좋은 날씨!");
					
					}
				}else if(temp >= 6){
					
					
				}
			
			
			// 홈페이지를 이동할때마다 변경된 값을 저장시키기
			$("#resultDate").text(koDate);
			$("#resultTime").text(KoTime);
			$("#resultTemp").text(temp+" 도");
			$("#resultWind").text(wind+" m/s");

		   	},
	});
	
</script>
</body>
</html>