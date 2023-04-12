<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
//	Session내장객체 메모리 영역에 session값 얻기
String id = (String)session.getAttribute("id");
String ContextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<!--  	 Top CSS 셋팅 -->
 	<link href="<%=request.getContextPath()%>/css/Top.css" rel="stylesheet">
<style>
</style>

<!--          			# 부트스트랩 플러그인  관련 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   	<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=no, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Digital marketing courses website template that can help you boost your business courses website and its completely free.">
    <meta name="keywords" content="seo,free website template, free responsive website template, seo marketing, search engine optimization, web analytics">
	
<!-- 	Fontawesome 셋팅 -->
	<script src="https://kit.fontawesome.com/4536cebc99.js" crossorigin="anonymous"></script>

   
<!--  	 quickmenu CSS 셋팅 -->
<%--  	<link href="<%=request.getContextPath()%>/css/quickmenu.css" rel="stylesheet"> --%>
    <!-- Bootstrap -->
<%--     <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet"> --%>
    <!-- Style CSS -->
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
    <!-- 구글 폰트 -->
<!--     <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet"> -->
<!--     FontAwesome CSS -->
<%--     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/fontello.css"> --%>
<%--     <link href="<%=request.getContextPath()%>/css/font-awesome.min.css" rel="stylesheet"> --%>
    <link href="<%=request.getContextPath()%>/css/owl.carousel.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/owl.theme.default.css" rel="stylesheet">

<!--          			# 부트스트랩 플러그인  관련 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!--          			# 홈버튼 플러그인  관련 -->
<i class="bi bi-house"></i>
</svg>

<title>Top.jsp</title>

<!--          			# 플러그인  관련 -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=request.getContextPath()%>/js/jquery.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/js/menumaker.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.sticky.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/slider.js"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
            integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
    <script>
      Kakao.init('083d7283f7089c6f3d424efd747489e9'); // 사용하려는 앱의 JavaScript 키 입력
    </script>
<script>
//메인 메뉴에 마우스가 올려지면 토글하는 함수 생성
$(document).ready(function(){


	$(".edu_btn").on("click", function(){
		
		<%
			if(id == null){
		%> 
				alert("로그인 후 수강신청 가능합니다!");
				location.replace("<%=request.getContextPath()%>/member/login.me");
				return false;
			
		<%		
			}
		%>
	})
	
	$("#cart").on("click", function(){
		
		<%
			if(id == null){
		%> 
				alert("로그인 후 조회 가능합니다.");
				location.replace("<%=request.getContextPath()%>/member/login.me");
				return false;
			
		<%		
			}
		%>
	})

	// MEGA-MENU 롤다운 설정
	$("#list_gnb").on("mouseover", function(){
		$("#mega-menu").stop().slideDown("fast");
	})
	
	$("#mega_wrapper").on("mouseleave", function(){
		$("#mega-menu").stop().slideUp("fast");
	})
	
	$("#hamburger > a").on("click", function(){
		$("#mega-menu").stop().slideDown("fast");
	})

	

	// quick-menu 설정	
	  var currentPosition = parseInt($("#quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $("#quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	
	
});
</script>
</head>    
<body>    
 <div class="nb_top" >
<!--          			# 메인 로고  관련 -->
<!--  #   menu1 :  슬라이더 + 로그인 버튼 4개  -->
    <div id = "menu1" >
		<div id = "textSlider" class="row">
					<div class="scroller">
							<div class="inner">
								<p align="center">늘 봄</p>
								<p align="center">いつも春</p>
								<p align="center">Always See</p>
								<p align="center">Always Spring</p>
							</div>
					</div>
		</div>
		<!--                  1) 로그인 & 로그아웃 & 마이페이지 & 장바구니 버튼 -->
		<div id = "nb_login">
				<div id = "nb_box">
					<ul id = "login_box">	                    			
	<%				
					if(id == null){
				%>	
				   <li id="loginhomebtn" class="login1" ><a id="login5" href="<%=request.getContextPath()%>/nb/Main" class="btn">   홈   </a></li>
				   <li class="login1"><a id="login2"href="<%=request.getContextPath()%>/member/login.me?center=/nbMember/login.jsp" class="btn">로그인</a></li>
<%-- 	               <li class= "login1"><a id="login3"href="<%=request.getContextPath()%>/nb/mypage.me?center=/nbMember/mypage.jsp" class="btn">마이페이지</a></li> --%>
	               <li class= "login1"><a id="login4"href="<%=request.getContextPath()%>/member/joinCategory.me?center=/nbMember/join.jsp" class="btn">회원가입</a></li>
	               <li class= "login1"><a id="cart" href="<%=request.getContextPath()%>/nb/cart.do?id=<%=id%>&center=/nbShop/cart.jsp" class="btn">장바구니</a></li>

				<%
					}else{//로그인 O
				%>
				<li id="loginhomebtn" class="login1" ><a id="login5" href="<%=request.getContextPath()%>/nb/Main" class="btn">   홈   </a></li>
				   <li class="login1"><a id="login6" href="<%=request.getContextPath()%>/member/logout.me" class="btn">로그아웃</a></li>
				   <c:choose>
				   		<c:when test="${id eq 'admin'}">
				   		<li class="login1"><a id="login7" href="<%=request.getContextPath()%>/adm/adminMain" class="btn">관리자페이지</a></li>
				   		</c:when>
				   	<c:otherwise>
	 	              <li class="login1"><a id="login7" href="<%=request.getContextPath()%>/nb/mypage.me?center=/nbMember/mypage.jsp" class="btn">마이페이지</a></li>
	               <li class="login1"><a  id="cart" href="<%=request.getContextPath()%>/nb/cart.do?id=<%=id%>&center=/nbShop/cart.jsp" class="btn">장바구니</a></li>
				   	</c:otherwise>
				   </c:choose>

				<%
					}
				%>
					</ul>
				</div>	
			</div>	
	</div>
	
<!--  #   menu2 :  네브바 + 날씨 API  -->		

	<div id="menu2" align="center" >
	  <div id = "nav_box">
		<nav id="main_menu">
			<ul id="list_gnb">
				<li style="font-family: 'Nanum Gothic', sans-serif;">
				<!-- 			 1-1)	홈 버튼 -->
				<a id ="homebtn" href="<%=request.getContextPath()%>/nb/Main" title="">
				<svg id="nb_homebtn" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-houses" viewBox="0 0 16 16">
 				<path d="M5.793 1a1 1 0 0 1 1.414 0l.647.646a.5.5 0 1 1-.708.708L6.5 1.707 2 6.207V12.5a.5.5 0 0 0 .5.5.5.5 0 0 1 0 1A1.5 1.5 0 0 1 1 12.5V7.207l-.146.147a.5.5 0 0 1-.708-.708L5.793 1Zm3 1a1 1 0 0 1 1.414 0L12 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l1.854 1.853a.5.5 0 0 1-.708.708L15 8.207V13.5a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 4 13.5V8.207l-.146.147a.5.5 0 1 1-.708-.708L8.793 2Zm.707.707L5 7.207V13.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5V7.207l-4.5-4.5Z"/>
				</svg></a>
				<!-- 			 1-2)	메뉴 버튼 -->
				<a href="<%=request.getContextPath()%>/nb/Intro.do?center=/nbCompany/intro.jsp"> 늘 봄이란?</a>
				<a class = "edu_btn" href="<%=request.getContextPath()%>/nb/edu.do?center=/nbShop/trainer.jsp"> 수강 신청 </a>
				<a href="<%=request.getContextPath()%>/freeboard/list.fb"> 소통 하기</a>
				<a href="<%=request.getContextPath()%>/review/qna.bo"> 고객 센터</a>



			  </li>
			</ul>
		</nav>
	</div>
		<!-- 					2) 날씨 구현 파트 -->
<div id = "weatherWrapper">
	<div id="weatherbox">
		<div id="todayweather">
			<label>우리동네 날씨는..?</label>
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
				<img src="" />
				<input id="weatherzone" type="text" value="날씨정보가 안나올경우" />
				<input id="weatherzone2" type="text" value="위치서비스 동의필요!" />
			</div>
		</div>
	</div>
	  </div>
 </div>

<!--  #   mega-menu :  메가드롭 메뉴  -->
	<div id="mega-menu">
		<div id = mega_wrapper>
			<ul class="list_lnb_01">
				<li><a href="<%=request.getContextPath()%>/nb/Intro.do?center=/nbCompany/intro.jsp">회사 소개</a></li>
				<li><a href="<%=request.getContextPath()%>/nb/navi.do?center=/nbCompany/navi.jsp">오시는 길</a></li>
			</ul>
			<ul class="list_lnb_02">
				<li><a class="edu_btn" href="<%=request.getContextPath()%>/nb/edu.do?center=/nbShop/trainer.jsp">수강신청 가기</a></li>
				<li><a href="<%=request.getContextPath()%>/review/list.rv">수강 후기</a></li>
			</ul>
			<ul id = "list_lnb_03" class="list_lnb_03">
				<li></li>
			</ul>
			<ul class="list_lnb_04">
				<li><a href="<%=request.getContextPath()%>/tb/list.bo">훈련사 상담</a></li>
				<li><a href="<%=request.getContextPath()%>/review/qna.bo">Q&A</a></li>
		 </ul>
		 </div>
	</div>	

 </div>
 
 	<div id= "hamburger">
 		<a href="#"><i id="hamburgerbtn" class="fa-solid fa-bars"></i></a>
 	</div>
 
 
 	<!-- 	퀵 메뉴 설정 -->
	<div id="quickmenubox">
		<div id="quickmenu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/nb/edu.do?center=/nbShop/trainer.jsp">수강 신청</a></li>
				<li><a href="<%=request.getContextPath()%>/review/list.rv">수강 후기</a></li>
				<li><a id="add-channel-button" href="javascript:addChannel()"><br><i style="font-size: 55px;"id="chaticon" class="fa-solid fa-paw"></i><br>1:1 채팅문의</a></li>
			</ul>
		</div>
	</div>







<!-- 날씨 관련 스크립트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
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
	
	
	// 만약에 initTime 값이 10보다 작을경우
	if( initTime < 10){
		
		// 2번째 자리수에 0을 붙인다.
		initTime = "0"+initTime;
	}
	
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
// 	console.log(initDate);
// 	console.log(initTime);	
// 	console.log(result);
// 	console.log(temp);
// 	console.log(wind);
// 	console.log(rain);
	
	// 홈페이지를 이동할때마다 변경된 값을 저장시키기
	$("#resultDate").text(koDate);
	$("#resultTime").text(KoTime);
	$("#resultTemp").text(temp+" 도");
	$("#resultWind").text(wind+" m/s");
	
		// 온도와 바람에 따라서 변경 노출 될 이미지와 문구 설정
		
		// #1 온도가 25도 이상일 경우
		if(temp >= 25){
			
			// 온도가 25도 이상이지만 비가올 경우
			if(rain > 0){
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
				$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
				$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
			
			// 오후 6시 이후일 경우,
			}else if(rain == 0 && initTime >= 18){
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
				$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
				$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
				
				
				
			// 온도가 26도 이상이고 비가 오지 않을경우,	
			}else{
			
			$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
			$("#weatherzone").attr("value", "무더운 날씨네요").css("font-weight","bold");
			$("#weatherzone2").attr("value", "더위 조심하세요!!").css("color", "#009688").css("font-weight","bold");
			
			}
			
		// #2 온도가 16도 이상 25도 미만일 경우
		}else if(temp >= 16 && temp < 25){
				
				// 온도는 16도 이상 25도 미만이지만 비가올 경우
				if(rain > 0){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
					
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
					
					
				// 온도는 16도 이상 25도 미만이지만 비가 오지 않을경우,	
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "따뜻한 날씨네요").css("font-weight","bold");
				$("#weatherzone2").attr("value", "수분 챙기세요!!").css("color", "#009688").css("font-weight","bold");
				
				}
		
		
		
		// #3) 11도 보다 온도가 높거나 같고, 16도 미만 일 경우
		}else if(temp >= 11 && temp < 16){
			
				// 온도는 11도 이상이지만 비가올 경우
				if(rain > 0){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
					
				// 온도가 11도 이상 16도 미만이지만 눈이 올 경우	
				}else if(rain== 3){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/snowy.png");
					$("#weatherzone").attr("value", "눈이와요 *** ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "하얀 눈이 내립니다!").css("color", "#2196f3").css("font-weight","bold");	
				
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
					
					
					
				// 온도가 11도 이상이고 비가 오지 않을경우,	
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "산책하기").css("font-weight","bold");
				$("#weatherzone2").attr("value", "딱 좋은 날씨!").css("color", "#009688").css("font-weight","bold");
				
				}
			
		// #4) 온도가 6도 보다는 높지만, 11도 보다는 낮을때	
		}else if(temp >= 6 && temp < 11){
			
				// 온도는 6도 이상 11도 미만이지만 비가올 경우
				if(rain > 0){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");

				// 온도가 6도 이상 11도 미만이지만 눈이 올 경우	
				}else if(rain== 3){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/snowy.png");
					$("#weatherzone").attr("value", "눈이와요 *** ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "하얀 눈이 내립니다!").css("color", "#2196f3").css("font-weight","bold");	
					
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
						
					
					
				// 온도가 6도 이상 11도 미만에 비가 안 올 경우
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "산책하기 괜찮지만").css("font-weight","bold");
				$("#weatherzone2").attr("value", "조심히 산책하세요!").css("color", "#8bc34a").css("font-weight","bold");
				
				}
		// #5) 온도가 -1도 이상 6도 미만일때
		}else if(temp >= -1 && temp < 6){
				
				// 온도는 -1도 이상 6도 미만이지만 비가올 경우
				if(rain > 0){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
				
				// 온도가 -1도 이상 6도 미만이지만 눈이 올 경우	
				}else if(rain== 3){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/snowy.png");
					$("#weatherzone").attr("value", "눈이와요 *** ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "하얀 눈이 내립니다!").css("color", "#2196f3").css("font-weight","bold");	
							
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
						
					
				// 온도가 -1도 이상 6도 미만에 비가 안 올 경우
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "방한용품을 권장하고").css("font-weight","bold");
				$("#weatherzone2").attr("value", "많은 주의가 필요합니다!").css("color", "#ff5722").css("font-weight","bold");
				}
			
				// #6) 온도는 -2도보다 낮거나 같고 -4도 미만일 때
		}else if (temp <= -2 && temp > -4){
			
				// 온도는 -2도보다 낮거나 같고 -4도 미만일 때, 비가올 경우
				if(rain > 0){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
					
				// 온도가 -2도 이상 -4도 미만이지만 눈이 올 경우	
				}else if(rain== 3){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/snowy.png");
					$("#weatherzone").attr("value", "눈이와요 *** ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "하얀 눈이 내립니다!").css("color", "#2196f3").css("font-weight","bold");	
				
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
						
					
					
				// 온도는 -2도보다 낮거나 같고 -4도 미만일 때, 비가 안 올 경우
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "산책하기엔 쌀쌀해요").css("font-weight","bold");
				$("#weatherzone2").attr("value", "방한대책 필수에요!!").css("color", "#ff5722").css("font-weight","bold");
				
				}
			
		// #7) 온도가 -4도와 같거나 높을경우	
		}else if(temp >= -4){
			
			// 온도가 -4도와 같거나 높고 비가올 경우
			if(rain > 0){
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
				$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
				$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
				
			// 온도가 -4도 이하이고 눈이 올 경우	
			}else if(rain== 3){
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/snowy.png");
				$("#weatherzone").attr("value", "눈이와요 *** ").css("font-weight","bold");
				$("#weatherzone2").attr("value", "하얀 눈이 내립니다!").css("color", "#2196f3").css("font-weight","bold");	
			
			// 오후 6시 이후일 경우,
			}else if(rain == 0 && initTime >= 18){
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
				$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
				$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
			
			// 온도가 -4도와 같거나 높고 비가 안 올 경우
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
function addChannel() {
  Kakao.Channel.addChannel({
    channelPublicId: '_Xpekxj',
  });
}
</script>
 
 
 
 
<!-- header-close -->
<div id = "center1">

</div>
</body>
</html>