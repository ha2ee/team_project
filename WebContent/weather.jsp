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
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 250px;
	height : 25px;
	border-radius: 5px;
	
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
	
/* 	날씨에 대한 결과값 계산 후 출력할 곳 */
	#weatherzone {
	
	border : 1px solid blue;
	
	text-align : center;
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 97%;
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
			<div id="resultDate">20230223</div>
			<div id= "resultTime">0600</div>
			<div id= "resultTemp">-4.0</div>
			<div id="resultWind">동향 4s</div>
		</div>
		<div id="weatherFooter">
			<div id="weatherResult">
				<input id="weatherzone" type="text" />
			</div>
		</div>
	</div>
	
	
	
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
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
	
	
	
		var Wdate = new Date();
		var Wyear = moment(Wdate).format('YYYY');
		var Wmonth = moment(Wdate).format('MM');
		var Wday = moment(Wdate).format('DD');
		var Wtime = moment(Wdate).format('h');
		var initDate = Wyear+Wmonth+Wday;
		var initTime = Wtime-1;
		console.log(initDate);
		console.log(Wtime);
		// 3) ajax를 활용해서 현재날씨 데이터 만들기
		// 가져올 값 : 1)해당날짜의 시간 2)온도 3)바람세기
	$.ajax({
			url: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=SswoUAmXtjH%2FEZIxjrzCxbjXuV0AhAdO5rXvMxXfxqis8wmCcKFciA72WHxnWC1Uyosdebw1T1HP5qH9bEyu7w%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date="+initDate+"&base_time=0600&nx=55&ny=127", 
			success: function(result){
		
			console.log(result);

		   	},
	});
	
</script>
</body>
</html>